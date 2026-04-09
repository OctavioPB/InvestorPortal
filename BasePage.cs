using System;
using System.Web.UI;

namespace PurchaserPortal1
{
    /// <summary>
    /// Base page for all authenticated pages.
    /// Redirects to Login.aspx if the session has expired or was never created.
    /// </summary>
    public class BasePage : Page
    {
        protected override void OnPreLoad(EventArgs e)
        {
            if (Session["Name"] == null)
                Response.Redirect("~/Login.aspx");

            base.OnPreLoad(e);
        }
    }
}
