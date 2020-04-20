using System;
using System.Collections.Generic;
using System.Security.Cryptography;
using AutoMapper;
using TvShows.Common;
using TvShows.Infrastructure;
using TvShows.Services.Base;

namespace TvShows.Services.Application
{
    public interface ISecurityService : IService
    {
        bool CheckPasswordForLogin(string passwordToCheck, string savedSaltPlusHash);
        string CreatePasswordSaltPlusHash(string password);
    }
    public class SecurityService : Service, ISecurityService
    {
        // The random salt length we will use
        private const int SaltLength = 24;
        // The derived key length for PBKDF2
        private const int DerivedKeyLength = 24;
        // The iteration count for PBKDF2
        private const int IterationCount = 24000;

        public SecurityService(IRepositoryFactory repositoryFactory, IUnitOfWork unitOfWork, IMapper mapper) : base(repositoryFactory, unitOfWork, mapper)
        {
        }

        /// <summary>
        /// Generates a random salt with RNGCryptoServiceProvider
        /// </summary>
        /// <returns>A byte array with the random salt</returns>
        private static byte[] GenerateRandomSalt()
        {
            var rngCryptoServiceProvider = new RNGCryptoServiceProvider();
            var salt = new byte[SaltLength];
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
        private static bool ConstantTimeComparison(IReadOnlyList<byte> passwordToCheck, IReadOnlyList<byte> savedPassword)
        {
            var difference = (uint)passwordToCheck.Count ^ (uint)savedPassword.Count;
            for (var i = 0; i < passwordToCheck.Count && i < savedPassword.Count; i++)
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
                hashValue = pbkdf2.GetBytes(DerivedKeyLength);
            }
            return hashValue;
        }

        /// <summary>
        /// Generates an encoded string with the hashed password + the random salt that has been used 
        /// </summary>
        /// <param name="password">The password entered by the user</param>
        /// <returns></returns>
        public string CreatePasswordSaltPlusHash(string password)
        {
            var salt = GenerateRandomSalt();
            var hashValue = GenerateHashValue(password, salt, IterationCount);
            var saltPlusHash = new byte[SaltLength + DerivedKeyLength];
            Buffer.BlockCopy(salt, 0, saltPlusHash, 0, SaltLength);
            Buffer.BlockCopy(hashValue, 0, saltPlusHash, SaltLength, DerivedKeyLength);
            return Convert.ToBase64String(saltPlusHash);
        }

        /// <summary>
        /// Checks whether a passwordToCheck is valid compared to a saved salt plus hash
        /// </summary>
        /// <param name="passwordToCheck">The password entered by the user (plain text)</param>
        /// <param name="savedSaltPlusHash">The salt plus hash value retrieved from the password field for the user</param>
        /// <returns></returns>
        public bool CheckPasswordForLogin(string passwordToCheck, string savedSaltPlusHash)
        {
            var salt = new byte[SaltLength];
            var hashedSavedPasswordByteArr = new byte[DerivedKeyLength];
            var savedSaltPlusHashByteArr = Convert.FromBase64String(savedSaltPlusHash);
            // Copy the saved salt to salt
            Buffer.BlockCopy(savedSaltPlusHashByteArr, 0, salt, 0, SaltLength);
            // Copy the saved hash to passwordToCheckByteArr
            Buffer.BlockCopy(savedSaltPlusHashByteArr, SaltLength, hashedSavedPasswordByteArr, 0, hashedSavedPasswordByteArr.Length);
            var hashedPasswordToCheckByteArr = GenerateHashValue(passwordToCheck, salt, IterationCount);

            return ConstantTimeComparison(hashedPasswordToCheckByteArr, hashedSavedPasswordByteArr);
        }
    }
}
