using System;
using System.Collections.Generic;
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
using TvShows.Common.Exceptions;
using TvShows.Services.Application;

namespace TvShows.Services.Domain
{
    public interface IUsersService : IService
    {
        Task<IEnumerable<Users>> GetUsers();
        Task<ResponseModel<LoginResult>> LoginAsync(string userName, string password);
        Task<ResponseModel<long>> CreateUserAsync(Users userModel);
        Task<ResponseModel<long>> UpdateUserAsync(long userId, Users userModel);
        Task DeleteUserAsync(long userId);
        Task<Users> GetUser(long userId);
    }

    public class UsersService : Service, IUsersService
    {

        private readonly ISecurityService _securityService;
        private readonly AppSettings _appSettings;

        public UsersService(IRepositoryFactory repositoryFactory, IUnitOfWork unitOfWork, IMapper mapper, IOptions<AppSettings> appSettings, ISecurityService securityService) :
            base(repositoryFactory, unitOfWork, mapper)
        {
            _securityService = securityService;
            _appSettings = appSettings.Value;
        }

        public async Task<ResponseModel<LoginResult>> LoginAsync(string userName, string password)
        {
            var response = new ResponseModel<LoginResult>();

            var user = await Repositories.UsersRepository.GetSingleAsync(u => u.UserName == userName, new List<string> { "Role" });
            if (user == null)
            {
                response.Messages.Add("Wrong credentials");
                return response;
            }

            if (!_securityService.CheckPasswordForLogin(password, user.Password))
            {
                response.Messages.Add("Wrong credentials");
                return response;
            }

            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes(_appSettings.SecretKey);
            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new[]
                {
                    new Claim(ClaimTypes.NameIdentifier, user.UserId.ToString()),
                    new Claim(ClaimTypes.Name, user.UserName),
                    new Claim(ClaimTypes.Role, user.Role.RoleName)
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
                string.IsNullOrEmpty(userModel.Name) || string.IsNullOrEmpty(userModel.LastName) || userModel.RoleId == 0)
            {
                response.Messages.Add("UserName, Password, Role, Name and LastName fields are required");
                response.Success = false;
                return response;
            }

            var user = await Repositories.UsersRepository.GetSingleAsync(u => u.UserName == userModel.UserName && u.State == true);
            if (user != null)
            {
                response.Messages.Add("UserName already exist");
                response.Success = false;
                return response;
            }

            user = Mapper.Map<Infrastructure.Entities.Users>(userModel);
            user.Password = _securityService.CreatePasswordSaltPlusHash(userModel.Password);
            user.State = true;

            Repositories.UsersRepository.Save(user);
            await UnitOfWork.CommitAsync();

            response.Data = user.UserId;
            response.Success = true;

            return response;
        }

        public async Task<ResponseModel<long>> UpdateUserAsync(long userId, Users userModel)
        {
            var response = new ResponseModel<long>();

            if (string.IsNullOrEmpty(userModel.UserName) || string.IsNullOrEmpty(userModel.Name) || userModel.RoleId == 0)
            {
                response.Messages.Add("UserName, Password, Role, Name and LastName fields are required");
                response.Success = false;
                return response;
            }

            var user = await Repositories.UsersRepository.GetSingleAsync(u => u.State == true && u.UserId == userId);
            if (user == null)
            {
                throw new NotFoundCustomException("User not found", "");
            }

            user = Mapper.Map<Infrastructure.Entities.Users>(userModel);

            if (userModel.NewPassword)
            {
                if (userModel.Password != userModel.VerifyPassword)
                {
                    response.Messages.Add("Password not match");
                    response.Success = false;
                    return response;
                }

                user.Password = _securityService.CreatePasswordSaltPlusHash(userModel.Password);
            }

            Repositories.UsersRepository.Save(user);
            await UnitOfWork.CommitAsync();

            response.Data = user.UserId;
            response.Success = true;

            return response;
        }

        public async Task DeleteUserAsync(long userId)
        {
            var user = await Repositories.UsersRepository.GetSingleAsync(u => u.State == true && u.UserId == userId);
            if (user == null)
            {
                throw new NotFoundCustomException("User not found", "");
            }

            user.State = false;

            Repositories.UsersRepository.Update(user);
            await UnitOfWork.CommitAsync();
        }

        public async Task<IEnumerable<Users>> GetUsers()
        {
            var users = await Repositories.UsersRepository.ListAsync(u => u.State == true);
            return Mapper.Map<IEnumerable<Users>>(users);
        }

        public async Task<Users> GetUser(long userId)
        {
            var user = await Repositories.UsersRepository.GetSingleAsync(u => u.UserId == userId && u.State == true);

            if(user == null)
                throw new NotFoundCustomException("User not found", "");

            return Mapper.Map<Users>(user);
        }
    }
}
