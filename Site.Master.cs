using System;
using System.Web.UI;

namespace InvestorPortal
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var role = Session["Role"]?.ToString();
            pnlAdminNav.Visible     = (role == "Admin");
            pnlPurchaserNav.Visible = (role != "Admin");
        }
    }
}
