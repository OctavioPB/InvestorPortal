using System;
using System.Security.Cryptography;

namespace InvestorPortal.Data
{
    /// <summary>
    /// PBKDF2-SHA256 password hashing (100 000 iterations, 32-byte key).
    /// Compatible with .NET 4.8 — uses the instance Rfc2898DeriveBytes overload
    /// that accepts a HashAlgorithmName (added in .NET 4.7.2).
    /// </summary>
    public static class PasswordHelper
    {
        private const int Iterations = 100_000;
        private const int HashBytes  = 32;

        /// <summary>
        /// Hashes <paramref name="password"/> with the provided base-64 salt.
        /// </summary>
        public static string Hash(string password, string saltBase64)
        {
            var salt = Convert.FromBase64String(saltBase64);
            using (var pbkdf2 = new Rfc2898DeriveBytes(
                       password, salt, Iterations, HashAlgorithmName.SHA256))
                return Convert.ToBase64String(pbkdf2.GetBytes(HashBytes));
        }

        /// <summary>
        /// Generates a new salt and returns (hash, salt) as base-64 strings.
        /// </summary>
        public static (string hash, string salt) Create(string password)
        {
            var saltBytes = new byte[16];
            using (var rng = new RNGCryptoServiceProvider())
                rng.GetBytes(saltBytes);

            var saltBase64 = Convert.ToBase64String(saltBytes);
            return (Hash(password, saltBase64), saltBase64);
        }

        /// <summary>
        /// Returns true if <paramref name="password"/> matches the stored hash/salt pair.
        /// </summary>
        public static bool Verify(string password, string storedHash, string storedSalt) =>
            Hash(password, storedSalt) == storedHash;
    }
}
