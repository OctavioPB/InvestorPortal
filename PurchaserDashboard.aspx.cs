using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PurchaserPortal1
{
    public partial class PurchaserDashboard : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            name.Text = Session["Name"].ToString();
        }
    }
}