using System.Collections.Generic;
using System.Data.SqlClient;
using InvestorPortal.Models;

namespace InvestorPortal.Data
{
    public static class UserRepository
    {
        /// <summary>Returns the User with the given email, or null if not found.</summary>
        public static User GetByEmail(string email)
        {
            if (!Database.IsConfigured) return null;

            using (var conn = Database.Open())
            using (var cmd  = conn.CreateCommand())
            {
                cmd.CommandText =
                    "SELECT UserId, Email, PasswordHash, Salt, Role, FullName, Phone, Entity " +
                    "FROM   Users WHERE Email = @Email";
                cmd.Parameters.AddWithValue("@Email", email.ToLower());

                using (var r = cmd.ExecuteReader())
                    return r.Read() ? Map(r) : null;
            }
        }

        /// <summary>Returns all users with Role = 'Purchaser'.</summary>
        public static List<User> GetAllPurchasers()
        {
            var list = new List<User>();
            if (!Database.IsConfigured) return list;

            using (var conn = Database.Open())
            using (var cmd  = conn.CreateCommand())
            {
                cmd.CommandText =
                    "SELECT UserId, Email, PasswordHash, Salt, Role, FullName, Phone, Entity " +
                    "FROM   Users WHERE Role = 'Purchaser' ORDER BY FullName";

                using (var r = cmd.ExecuteReader())
                    while (r.Read()) list.Add(Map(r));
            }
            return list;
        }

        /// <summary>Updates mutable profile fields for a user.</summary>
        public static void UpdateProfile(int userId, string fullName, string phone, string entity)
        {
            if (!Database.IsConfigured) return;

            using (var conn = Database.Open())
            using (var cmd  = conn.CreateCommand())
            {
                cmd.CommandText =
                    "UPDATE Users SET FullName=@FullName, Phone=@Phone, Entity=@Entity " +
                    "WHERE UserId=@UserId";
                cmd.Parameters.AddWithValue("@FullName", fullName);
                cmd.Parameters.AddWithValue("@Phone",    (object)phone  ?? System.DBNull.Value);
                cmd.Parameters.AddWithValue("@Entity",   (object)entity ?? System.DBNull.Value);
                cmd.Parameters.AddWithValue("@UserId",   userId);
                cmd.ExecuteNonQuery();
            }
        }

        private static User Map(SqlDataReader r) => new User
        {
            UserId       = r.GetInt32(0),
            Email        = r.GetString(1),
            PasswordHash = r.GetString(2),
            Salt         = r.GetString(3),
            Role         = r.GetString(4),
            FullName     = r.IsDBNull(5) ? "" : r.GetString(5),
            Phone        = r.IsDBNull(6) ? "" : r.GetString(6),
            Entity       = r.IsDBNull(7) ? "" : r.GetString(7)
        };
    }
}
