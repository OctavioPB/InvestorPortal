using System.Configuration;
using System.Data.SqlClient;

namespace PurchaserPortal1.Data
{
    /// <summary>
    /// Provides a SqlConnection from the InvestorPortalDB connection string.
    /// IsConfigured returns false when the string is empty (dev fallback mode).
    /// </summary>
    internal static class Database
    {
        private static string ConnectionString =>
            ConfigurationManager.ConnectionStrings["InvestorPortalDB"]?.ConnectionString;

        public static bool IsConfigured =>
            !string.IsNullOrWhiteSpace(ConnectionString);

        public static SqlConnection Open()
        {
            var conn = new SqlConnection(ConnectionString);
            conn.Open();
            return conn;
        }
    }
}
