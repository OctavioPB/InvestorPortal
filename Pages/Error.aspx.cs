using System;
using System.Web.UI;

namespace InvestorPortal
{
    // Error.aspx does NOT inherit BasePage — it must be reachable without a session.
    public partial class ErrorPage : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.StatusCode = 500;
        }
    }
}
