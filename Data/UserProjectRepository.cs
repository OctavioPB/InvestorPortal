using System;
using System.Data.SqlClient;

namespace InvestorPortal.Data
{
    public static class UserProjectRepository
    {
        // ── Dashboard summary ─────────────────────────────────────────────

        public class DashboardSummary
        {
            public decimal PortfolioSize     { get; set; }
            public decimal AmountDue         { get; set; }
            public decimal AmountPaid        { get; set; }
            public int     ProjectCount      { get; set; }
        }

        public static DashboardSummary GetSummary(int userId)
        {
            var summary = new DashboardSummary();
            if (!Database.IsConfigured) return summary;

            using (var conn = Database.Open())
            using (var cmd  = conn.CreateCommand())
            {
                cmd.CommandText =
                    "SELECT " +
                    "    ISNULL(SUM(p.PurchaseCost), 0)  AS PortfolioSize, " +
                    "    ISNULL(SUM(pay.AmountDue), 0)   AS AmountDue, " +
                    "    ISNULL(SUM(pay.AmountPaid), 0)  AS AmountPaid, " +
                    "    COUNT(DISTINCT up.ProjectId)    AS ProjectCount " +
                    "FROM UserProjects up " +
                    "JOIN Projects p ON p.ProjectId = up.ProjectId " +
                    "LEFT JOIN Payments pay ON pay.UserProjectId = up.Id " +
                    "WHERE up.UserId = @UserId";
                cmd.Parameters.AddWithValue("@UserId", userId);

                using (var r = cmd.ExecuteReader())
                {
                    if (r.Read())
                    {
                        summary.PortfolioSize = r.GetDecimal(0);
                        summary.AmountDue     = r.GetDecimal(1);
                        summary.AmountPaid    = r.GetDecimal(2);
                        summary.ProjectCount  = r.GetInt32(3);
                    }
                }
            }
            return summary;
        }

        // ── Reserve / Schedule call ───────────────────────────────────────

        /// <summary>
        /// Creates a UserProject record (status=Reserved) and optionally
        /// sets a scheduled call date. Returns the new UserProjectId.
        /// </summary>
        public static int Reserve(int userId, int projectId,
                                  DateTime? callDate, DateTime? callTime)
        {
            if (!Database.IsConfigured) return -1;

            DateTime? scheduledFor = null;
            if (callDate.HasValue)
            {
                scheduledFor = callDate.Value;
                if (callTime.HasValue)
                    scheduledFor = scheduledFor.Value.Date
                                   .Add(callTime.Value.TimeOfDay);
            }

            using (var conn = Database.Open())
            using (var cmd  = conn.CreateCommand())
            {
                cmd.CommandText =
                    "INSERT INTO UserProjects (UserId, ProjectId, Status, ReservedAt, CallScheduledFor) " +
                    "OUTPUT INSERTED.Id " +
                    "VALUES (@UserId, @ProjectId, 'Reserved', @Now, @CallFor)";
                cmd.Parameters.AddWithValue("@UserId",    userId);
                cmd.Parameters.AddWithValue("@ProjectId", projectId);
                cmd.Parameters.AddWithValue("@Now",       DateTime.Now);
                cmd.Parameters.AddWithValue("@CallFor",
                    (object)scheduledFor ?? DBNull.Value);

                return (int)cmd.ExecuteScalar();
            }
        }
    }
}
