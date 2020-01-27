using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PurchaserPortal1
{
    public partial class PurchaserPortal : System.Web.UI.Page
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["Project"] = "Lux Art Institute";
            Session["location"] = "Encinitas";
            Session["projectID"] = "485";
            Session["itcValue"] = "81,442$";
            Session["purchaseCost"] = "220,115$";
            Session["dType"] = "PPA";
            Session["bType"] = "COMMERCIAL";
            Server.Transfer("PurchaseForm.aspx", true);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Session["Project"] = "First Baptist Church of Chula Vista";
            Session["location"] = "Chula Vista";
            Session["projectID"] = "462";
            Session["itcValue"] = "35,287$";
            Session["purchaseCost"] = "135,720$";
            Session["dType"] = "PPA";
            Session["bType"] = "NON-PROFIT";
            Server.Transfer("PurchaseForm.aspx", true);
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Session["Project"] = "New Life Community Adventist Church";
            Session["location"] = "Napa";
            Session["projectID"] = "468";
            Session["itcValue"] = "10,860$";
            Session["purchaseCost"] = "11,475$";
            Session["dType"] = "Prepay";
            Session["bType"] = "NON-PROFIT";
            Server.Transfer("PurchaseForm.aspx", true);
        }
    }
}