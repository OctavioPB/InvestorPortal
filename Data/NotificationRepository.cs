using System.Collections.Generic;
using System.Data.SqlClient;

namespace InvestorPortal.Data
{
    public static class NotificationRepository
    {
        // ── Types ────────────────────────────────────────────────────────
        public const string PaymentPending  = "PaymentPending";
        public const string DocumentPending = "DocumentPending";
        public const string CallScheduled   = "CallScheduled";

        // ── Read ─────────────────────────────────────────────────────────

        /// <summary>Returns true if the user has an active notification of the given type.</summary>
        public static bool IsActive(int userId, string type)
        {
            if (!Database.IsConfigured) return false;

            using (var conn = Database.Open())
            using (var cmd  = conn.CreateCommand())
            {
                cmd.CommandText =
                    "SELECT COUNT(1) FROM Notifications " +
                    "WHERE UserId=@UserId AND Type=@Type AND IsActive=1";
                cmd.Parameters.AddWithValue("@UserId", userId);
                cmd.Parameters.AddWithValue("@Type",   type);
                return (int)cmd.ExecuteScalar() > 0;
            }
        }

        /// <summary>Returns all active notification types for the user.</summary>
        public static HashSet<string> GetActive(int userId)
        {
            var result = new HashSet<string>();
            if (!Database.IsConfigured) return result;

            using (var conn = Database.Open())
            using (var cmd  = conn.CreateCommand())
            {
                cmd.CommandText =
                    "SELECT Type FROM Notifications WHERE UserId=@UserId AND IsActive=1";
                cmd.Parameters.AddWithValue("@UserId", userId);

                using (var r = cmd.ExecuteReader())
                    while (r.Read()) result.Add(r.GetString(0));
            }
            return result;
        }

        // ── Write ─────────────────────────────────────────────────────────

        /// <summary>Sets a notification flag for the user (upsert).</summary>
        public static void Set(int userId, string type, bool isActive)
        {
            if (!Database.IsConfigured) return;

            using (var conn = Database.Open())
            using (var cmd  = conn.CreateCommand())
            {
                cmd.CommandText =
                    "IF EXISTS (SELECT 1 FROM Notifications WHERE UserId=@UserId AND Type=@Type) " +
                    "    UPDATE Notifications SET IsActive=@Active WHERE UserId=@UserId AND Type=@Type " +
                    "ELSE " +
                    "    INSERT INTO Notifications (UserId, Type, IsActive) VALUES (@UserId, @Type, @Active)";
                cmd.Parameters.AddWithValue("@UserId", userId);
                cmd.Parameters.AddWithValue("@Type",   type);
                cmd.Parameters.AddWithValue("@Active", isActive ? 1 : 0);
                cmd.ExecuteNonQuery();
            }
        }
    }
}
