using System;

namespace InvestorPortal
{
    /// <summary>
    /// Base page for admin-only pages.
    /// Inherits session guard from BasePage and adds role check.
    /// A logged-in purchaser who navigates to an admin URL is sent back to their portal.
    /// </summary>
    public class AdminBasePage : BasePage
    {
        protected override void OnPreLoad(EventArgs e)
        {
            base.OnPreLoad(e); // checks Session["Name"] first

            if (Session["Role"]?.ToString() != "Admin")
                Response.Redirect("~/Pages/PurchaserPortal.aspx");
        }
    }
}
