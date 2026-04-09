using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using InvestorPortal.Models;

namespace InvestorPortal.Data
{
    public static class ProjectRepository
    {
        // ── In-memory seed (used when DB is not yet configured) ──────────
        private static readonly List<Project> Seed = new List<Project>
        {
            new Project { ProjectId=485, Name="Lux Art Institute",
                          Location="Encinitas, CA",   DealType="PPA",    BusinessType="COMMERCIAL",
                          ITCValue=81442m,  PurchaseCost=220115m, ImageUrl="solar4.jpg", IsAvailable=true },
            new Project { ProjectId=462, Name="First Baptist Church of Chula Vista",
                          Location="Chula Vista, CA", DealType="PPA",    BusinessType="NON-PROFIT",
                          ITCValue=35287m,  PurchaseCost=135720m, ImageUrl="solar5.jpg", IsAvailable=true },
            new Project { ProjectId=468, Name="New Life Community Adventist Church",
                          Location="Napa, CA",        DealType="Prepay", BusinessType="NON-PROFIT",
                          ITCValue=10860m,  PurchaseCost=11475m,  ImageUrl="solar6.jpg", IsAvailable=true },
        };

        // ── Public API ───────────────────────────────────────────────────

        public static List<Project> GetAvailable()
        {
            if (!Database.IsConfigured) return Seed;

            var list = new List<Project>();
            using (var conn = Database.Open())
            using (var cmd  = conn.CreateCommand())
            {
                cmd.CommandText =
                    "SELECT ProjectId, Name, Location, DealType, BusinessType, " +
                    "       ITCValue, PurchaseCost, ImageUrl " +
                    "FROM   Projects " +
                    "WHERE  IsAvailable = 1";

                using (var r = cmd.ExecuteReader())
                    while (r.Read()) list.Add(Map(r));
            }
            return list;
        }

        public static Project GetById(int projectId)
        {
            if (!Database.IsConfigured)
                return Seed.FirstOrDefault(p => p.ProjectId == projectId);

            using (var conn = Database.Open())
            using (var cmd  = conn.CreateCommand())
            {
                cmd.CommandText =
                    "SELECT ProjectId, Name, Location, DealType, BusinessType, " +
                    "       ITCValue, PurchaseCost, ImageUrl " +
                    "FROM   Projects " +
                    "WHERE  ProjectId = @Id";
                cmd.Parameters.AddWithValue("@Id", projectId);

                using (var r = cmd.ExecuteReader())
                    return r.Read() ? Map(r) : null;
            }
        }

        // ── Private helpers ──────────────────────────────────────────────

        private static Project Map(SqlDataReader r) => new Project
        {
            ProjectId    = r.GetInt32(0),
            Name         = r.GetString(1),
            Location     = r.GetString(2),
            DealType     = r.GetString(3),
            BusinessType = r.GetString(4),
            ITCValue     = r.GetDecimal(5),
            PurchaseCost = r.GetDecimal(6),
            ImageUrl     = r.IsDBNull(7) ? "solar4.jpg" : r.GetString(7)
        };
    }
}
