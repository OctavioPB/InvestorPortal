using System;
using InvestorPortal.Data;

namespace InvestorPortal
{
    public partial class PurchaserDashboard : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                name.Text = Session["Name"].ToString();
                LoadSummary();
            }
        }

        private void LoadSummary()
        {
            if (Session["UserId"] == null) return;
            int userId = (int)Session["UserId"];

            var s = UserProjectRepository.GetSummary(userId);

            lblPortfolioSize.Text = string.Format("{0:N0} $", s.PortfolioSize);
            lblAmountPaid.Text    = string.Format("{0:N0} $", s.AmountPaid);
            lblAmountDue.Text     = string.Format("{0:N0} $", s.AmountDue);
            lblProjectCount.Text  = string.Format("{0} Project{1}", s.ProjectCount,
                                                  s.ProjectCount == 1 ? "" : "s");
        }
    }
}
