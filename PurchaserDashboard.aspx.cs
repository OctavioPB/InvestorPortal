using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PurchaserPortal1
{
    public partial class PurchaserDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                name.Text = Session["Name"].ToString();
            }
            catch
            {
                Response.Write("<script>alert('You need to log in');</script>");
                Server.Transfer("Login.aspx", true);
            }
        }
    }
}