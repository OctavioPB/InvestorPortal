using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PurchaserPortal1
{
    public partial class PurchaseForm : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                projectName.Value = Session["Project"].ToString();
                pID.Value         = Session["projectID"].ToString();
                location.Value    = Session["location"].ToString();
                itcValue.Value    = Session["itcValue"].ToString();
                dType.Value       = Session["dType"].ToString();
                bType.Value       = Session["bType"].ToString();
                purchaseValue.Value = Session["purchaseCost"].ToString();
            }
            catch
            {
                Response.Redirect("~/Pages/Login.aspx");
            }

        }
    }
}