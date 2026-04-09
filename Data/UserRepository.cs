using System.Data.SqlClient;
using PurchaserPortal1.Models;

namespace PurchaserPortal1.Data
{
    public static class UserRepository
    {
        /// <summary>
        /// Returns the User with the given email, or null if not found.
        /// Returns null immediately if the database is not configured.
        /// </summary>
        public static User GetByEmail(string email)
        {
            if (!Database.IsConfigured) return null;

            using (var conn = Database.Open())
            using (var cmd  = conn.CreateCommand())
            {
                cmd.CommandText =
                    "SELECT UserId, Email, PasswordHash, Salt, Role, FullName " +
                    "FROM   Users " +
                    "WHERE  Email = @Email";
                cmd.Parameters.AddWithValue("@Email", email.ToLower());

                using (var reader = cmd.ExecuteReader())
                {
                    if (!reader.Read()) return null;
                    return new User
                    {
                        UserId       = reader.GetInt32(0),
                        Email        = reader.GetString(1),
                        PasswordHash = reader.GetString(2),
                        Salt         = reader.GetString(3),
                        Role         = reader.GetString(4),
                        FullName     = reader.GetString(5)
                    };
                }
            }
        }
    }
}
