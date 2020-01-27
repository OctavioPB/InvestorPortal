using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PurchaserPortal1
{
    public partial class PurchaseForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["Project"].ToString();
            //Session["location"].ToString();
            //Session["projectID"].ToString();
            //Session["itcValue"].ToString();
            //Session["purchaseCost"].ToString();
            //Session["dType"].ToString();
            //Session["bType"].ToString();
            try
            { 
                projectName.Value= Session["Project"].ToString();
                pID.Value= Session["projectID"].ToString();
                location.Value= Session["location"].ToString();
                purchaseValue.Value= Session["itcValue"].ToString();
                dType.Value= Session["dType"].ToString();
                bType.Value= Session["bType"].ToString();
                purchaseValue.Value= Session["purchaseCost"].ToString();
            }
            catch
            {
                Response.Write("<script>alert('Please Log In');</script>");
                Server.Transfer("Login.aspx", true);
            }

        }
    }
}