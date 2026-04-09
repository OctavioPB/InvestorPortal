using System;
using System.Configuration;
using System.Drawing;
using System.Web.UI;

namespace PurchaserPortal1
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e) { }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var email    = user.Text.Trim().ToLower();
            var password = pass.Text;

            var credentials = ConfigurationManager.AppSettings["auth_" + email];

            if (credentials == null)
            {
                Label3.Text      = "User not found.";
                Label3.ForeColor = Color.Red;
                return;
            }

            // Format stored in Web.config: password|Role|Full Name
            var parts = credentials.Split('|');

            if (parts[0] != password)
            {
                Label3.Text      = "Wrong password.";
                Label3.ForeColor = Color.Red;
                return;
            }

            Session["Name"] = parts[2];
            Session["Role"] = parts[1];

            if (parts[1] == "Admin")
                Response.Redirect("~/Pages/AdminView.aspx");
            else
                Response.Redirect("~/Pages/PurchaserPortal.aspx");
        }
    }
}
