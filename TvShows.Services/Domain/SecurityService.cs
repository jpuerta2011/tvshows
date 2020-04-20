using System;
using System.Text;
using System.Threading.Tasks;
using TvShows.Services.Models;
using TvShows.Services.Base;
using TvShows.Common;
using TvShows.Infrastructure;
using AutoMapper;
using Microsoft.Extensions.Options;
using System.IdentityModel.Tokens.Jwt;
using Microsoft.IdentityModel.Tokens;
using System.Security.Claims;
using System.Security.Cryptography;

namespace TvShows.Services.Domain
{
    public interface ISecurityService : IService
    {
        Task<ResponseModel<LoginResult>> LoginAsync(string userName, string password);
        Task<ResponseModel<long>> CreateUserAsync(Users userModel);
    }

    public class SecurityService : Service, ISecurityService
    {
        // The random salt length we will use
        private const int saltLength = 24;
        // The derived key length for PBKDF2
        private const int derivedKeyLength = 24;
        // The iteration count for PBKDF2
        private const int iterationCount = 24000;

        private readonly AppSettings _appSettings;

        public SecurityService(IRepositoryFactory repositoryFactory, IUnitOfWork unitOfWork, IMapper mapper, IOptions<AppSettings> appSettings) :
            base(repositoryFactory, unitOfWork, mapper)
        {
            _appSettings = appSettings.Value;
        }

        public async Task<ResponseModel<LoginResult>> LoginAsync(string userName, string password)
        {
            var response = new ResponseModel<LoginResult>();

            var user = await Repositories.UsersRepository.GetSingleAsync(u => u.UserName == userName);
            if (user == null)
            {
                var message = string.Format("Wrong credentials");
                response.Messages.Add(message);
                return response;
            }

            if (!CheckPasswordForLogin(password, user.Password))
            {
                var message = string.Format("Wrong credentials");
                response.Messages.Add(message);
                return response;
            }

            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes(_appSettings.SecretKey);
            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new Claim[]
                {
                        new Claim(ClaimTypes.NameIdentifier, user.UserId.ToString()),
                        new Claim(ClaimTypes.Name, user.UserName),
                        new Claim(ClaimTypes.Role, user.RoleId.ToString())
                }),
                Expires = DateTime.UtcNow.AddHours(_appSettings.LifeTime),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
            };
            var token = tokenHandler.CreateToken(tokenDescriptor);

            response.Success = true;
            response.Data = new LoginResult
            {
                Token = tokenHandler.WriteToken(token)
            };

            return response;
        }

        public async Task<ResponseModel<long>> CreateUserAsync(Users userModel)
        {
            var response = new ResponseModel<long>();

            if (string.IsNullOrEmpty(userModel.UserName) || string.IsNullOrEmpty(userModel.Password) ||
                string.IsNullOrEmpty(userModel.Name) || userModel.RoleId == 0)
            {
                response.Messages.Add("UserName, Password, Role, Name and LastName fields are required");
                response.Success = false;
                return response;
            }

            var user = await Repositories.UsersRepository.GetSingleAsync(u => u.UserName == userModel.UserName);
            if (user != null)
            {
                response.Messages.Add("UserName already exist");
                response.Success = false;
                return response;
            }

            user = Mapper.Map<Infrastructure.Entities.Users>(userModel);
            user.Password = CreatePasswordSaltPlusHash(userModel.Password);

            Repositories.UsersRepository.Save(user);
            await UnitOfWork.CommitAsync();

            response.Data = user.UserId;
            response.Success = true;

            return response;
        }

        /// <summary>
        /// Generates a random salt with RNGCryptoServiceProvider
        /// </summary>
        /// <returns>A byte array with the random salt</returns>
        private static byte[] GenerateRandomSalt()
        {
            var rngCryptoServiceProvider = new RNGCryptoServiceProvider();
            var salt = new byte[saltLength];
            rngCryptoServiceProvider.GetBytes(salt);
            return salt;
        }

        /// <summary>
        /// Makes a constant time comparison between the two arrays by using XOR
        /// It is an advisable method of comparison to avoid hacks with simpler comparisons
        /// </summary>
        /// <param name="passwordToCheck">The array with the hashed password to check</param>
        /// <param name="savedPassword">The array with the hashed password that is saved in the DB</param>
        /// <returns>A bool value indicating whether the byte arrays match</returns>
        private static bool ConstantTimeComparison(byte[] passwordToCheck, byte[] savedPassword)
        {
            uint difference = (uint)passwordToCheck.Length ^ (uint)savedPassword.Length;
            for (var i = 0; i < passwordToCheck.Length && i < savedPassword.Length; i++)
            {
                difference |= (uint)(passwordToCheck[i] ^ savedPassword[i]);
            }

            return difference == 0;
        }

        /// <summary>
        /// Generates a hashed value with the password, salt and interation count
        /// </summary>
        /// <param name="password">The string with the password in plain text</param>
        /// <param name="salt">The random salt that has to be used</param>
        /// <param name="iterationCount">The iteration count</param>
        /// <returns></returns>
        private static byte[] GenerateHashValue(string password, byte[] salt, int iterationCount)
        {
            byte[] hashValue;
            var valueToHash = string.IsNullOrEmpty(password) ? string.Empty : password;
            using (var pbkdf2 = new Rfc2898DeriveBytes(valueToHash, salt, iterationCount))
            {
                hashValue = pbkdf2.GetBytes(derivedKeyLength);
            }
            return hashValue;
        }

        /// <summary>
        /// Generates an encoded string with the hashed password + the random salt that has been used 
        /// </summary>
        /// <param name="password">The password entered by the user</param>
        /// <returns></returns>
        private string CreatePasswordSaltPlusHash(string password)
        {
            var salt = GenerateRandomSalt();
            var hashValue = GenerateHashValue(password, salt, iterationCount);
            var iterationCountByteArr = BitConverter.GetBytes(iterationCount);
            var saltPlusHash = new byte[saltLength + derivedKeyLength];
            Buffer.BlockCopy(salt, 0, saltPlusHash, 0, saltLength);
            Buffer.BlockCopy(hashValue, 0, saltPlusHash, saltLength, derivedKeyLength);
            return Convert.ToBase64String(saltPlusHash);
        }

        /// <summary>
        /// Checks whether a passwordToCheck is valid compared to a saved salt plus hash
        /// </summary>
        /// <param name="passwordToCheck">The password entered by the user (plain text)</param>
        /// <param name="savedSaltPlusHash">The salt plus hash value retrieved from the password field for the user</param>
        /// <returns></returns>
        private bool CheckPasswordForLogin(string passwordToCheck, string savedSaltPlusHash)
        {
            var salt = new byte[saltLength];
            var hashedSavedPasswordByteArr = new byte[derivedKeyLength];
            var savedSaltPlusHashByteArr = Convert.FromBase64String(savedSaltPlusHash);
            // Copy the saved salt to salt
            Buffer.BlockCopy(savedSaltPlusHashByteArr, 0, salt, 0, saltLength);
            // Copy the saved hash to passwordToCheckByteArr
            Buffer.BlockCopy(savedSaltPlusHashByteArr, saltLength, hashedSavedPasswordByteArr, 0, hashedSavedPasswordByteArr.Length);
            var hashedPasswordToCheckByteArr = GenerateHashValue(passwordToCheck, salt, iterationCount);

            return ConstantTimeComparison(hashedPasswordToCheckByteArr, hashedSavedPasswordByteArr);
        }
    }
}
