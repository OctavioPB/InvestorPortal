using System;
using System.Configuration;
using System.Drawing;
using System.Web.UI;
using InvestorPortal.Data;

namespace InvestorPortal
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e) { }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var email    = user.Text.Trim().ToLower();
            var password = pass.Text;

            if (Database.IsConfigured)
                AuthenticateWithDatabase(email, password);
            else
                AuthenticateWithConfig(email, password);
        }

        // ── DB authentication (Sprint 4+) ────────────────────────────────
        private void AuthenticateWithDatabase(string email, string password)
        {
            var dbUser = UserRepository.GetByEmail(email);

            if (dbUser == null)
            {
                ShowError("User not found.");
                return;
            }

            if (!PasswordHelper.Verify(password, dbUser.PasswordHash, dbUser.Salt))
            {
                ShowError("Wrong password.");
                return;
            }

            Session["UserId"] = dbUser.UserId;
            Session["Name"]   = dbUser.FullName;
            Session["Role"]   = dbUser.Role;

            Redirect(dbUser.Role);
        }

        // ── Web.config fallback (development / pre-DB) ───────────────────
        private void AuthenticateWithConfig(string email, string password)
        {
            var credentials = ConfigurationManager.AppSettings["auth_" + email];

            if (credentials == null)
            {
                ShowError("User not found.");
                return;
            }

            // Format: password|Role|Full Name
            var parts = credentials.Split('|');

            if (parts[0] != password)
            {
                ShowError("Wrong password.");
                return;
            }

            Session["Name"] = parts[2];
            Session["Role"] = parts[1];

            Redirect(parts[1]);
        }

        // ── Helpers ──────────────────────────────────────────────────────
        private void ShowError(string message)
        {
            Label3.Text      = message;
            Label3.ForeColor = Color.Red;
        }

        private void Redirect(string role)
        {
            if (role == "Admin")
                Response.Redirect("~/Pages/AdminView.aspx");
            else
                Response.Redirect("~/Pages/PurchaserPortal.aspx");
        }
    }
}
