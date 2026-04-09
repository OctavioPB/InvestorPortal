using System;
using System.Globalization;
using InvestorPortal.Data;

namespace InvestorPortal
{
    public partial class PurchaseForm : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadProjectDetails();

            LoadAlerts();
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            if (Session["UserId"] == null || Session["projectID"] == null)
            {
                ShowResult("Session expired. Please start over.", isError: true);
                return;
            }

            int userId    = (int)Session["UserId"];
            int projectId = int.Parse(Session["projectID"].ToString());

            DateTime? parsedDate = null;
            DateTime? parsedTime = null;

            DateTime d;
            if (!string.IsNullOrWhiteSpace(callDate.Value) &&
                DateTime.TryParseExact(callDate.Value, new[] { "MM/dd/yyyy", "M/d/yyyy", "yyyy-MM-dd" },
                    CultureInfo.InvariantCulture, DateTimeStyles.None, out d))
                parsedDate = d;

            DateTime t;
            if (!string.IsNullOrWhiteSpace(callTime.Value) &&
                DateTime.TryParseExact(callTime.Value, new[] { "hh:mm tt", "h:mm tt", "HH:mm" },
                    CultureInfo.InvariantCulture, DateTimeStyles.None, out t))
                parsedTime = t;

            UserProjectRepository.Reserve(userId, projectId, parsedDate, parsedTime);

            ShowResult("Your request has been submitted. Our team will contact you shortly.",
                       isError: false);
            submit.Enabled = false;
        }

        // ── Helpers ──────────────────────────────────────────────────────────

        private void LoadProjectDetails()
        {
            try
            {
                projectName.Value   = Session["Project"].ToString();
                pID.Value           = Session["projectID"].ToString();
                location.Value      = Session["location"].ToString();
                itcValue.Value      = Session["itcValue"].ToString();
                dType.Value         = Session["dType"].ToString();
                bType.Value         = Session["bType"].ToString();
                purchaseValue.Value = Session["purchaseCost"].ToString();
            }
            catch
            {
                Response.Redirect("~/Pages/Login.aspx");
            }
        }

        private void LoadAlerts()
        {
            if (Session["UserId"] == null) return;
            int userId = (int)Session["UserId"];
            var active = NotificationRepository.GetActive(userId);
            pnlPaymentAlert.Visible = active.Contains(NotificationRepository.PaymentPending);
        }

        private void ShowResult(string msg, bool isError)
        {
            lblResult.Text    = msg;
            lblResult.CssClass = "alert d-block mb-3 " + (isError ? "alert-danger" : "alert-success");
            lblResult.Visible = true;
        }
    }
}
