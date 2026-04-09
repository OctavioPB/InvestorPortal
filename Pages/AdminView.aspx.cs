using System;
using System.Web.UI.WebControls;
using InvestorPortal.Data;

namespace InvestorPortal
{
    public partial class AdminView : AdminBasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                PopulateDropDown();
        }

        // ── Load purchaser into form ──────────────────────────────────────
        protected void btnLoad_Click(object sender, EventArgs e)
        {
            if (ddlPurchaser.SelectedValue == "") return;

            var user = UserRepository.GetByEmail(ddlPurchaser.SelectedValue);
            if (user == null) { ShowError("Purchaser not found."); return; }

            txtFullName.Text = user.FullName;
            txtEmail.Text    = user.Email;
            txtPhone.Text    = user.Phone   ?? "";
            txtEntity.Text   = user.Entity  ?? "";

            // Load notification flags
            int userId = user.UserId;
            chkPaymentPending.Checked  = NotificationRepository.IsActive(userId, NotificationRepository.PaymentPending);
            chkDocumentPending.Checked = NotificationRepository.IsActive(userId, NotificationRepository.DocumentPending);
            chkCallScheduled.Checked   = NotificationRepository.IsActive(userId, NotificationRepository.CallScheduled);

            ClearMessages();
        }

        // ── Save changes ─────────────────────────────────────────────────
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (!Database.IsConfigured)
            {
                ShowError("Database not configured. Changes cannot be saved in fallback mode.");
                return;
            }

            if (ddlPurchaser.SelectedValue == "") { ShowError("Select a purchaser first."); return; }

            var user = UserRepository.GetByEmail(ddlPurchaser.SelectedValue);
            if (user == null) { ShowError("Purchaser not found."); return; }

            UserRepository.UpdateProfile(user.UserId,
                fullName : txtFullName.Text.Trim(),
                phone    : txtPhone.Text.Trim(),
                entity   : txtEntity.Text.Trim());

            NotificationRepository.Set(user.UserId, NotificationRepository.PaymentPending,  chkPaymentPending.Checked);
            NotificationRepository.Set(user.UserId, NotificationRepository.DocumentPending, chkDocumentPending.Checked);
            NotificationRepository.Set(user.UserId, NotificationRepository.CallScheduled,   chkCallScheduled.Checked);

            ShowSuccess("Changes saved successfully.");
        }

        // ── Helpers ──────────────────────────────────────────────────────
        private void PopulateDropDown()
        {
            ddlPurchaser.Items.Clear();
            ddlPurchaser.Items.Add(new ListItem("— select —", ""));

            foreach (var u in UserRepository.GetAllPurchasers())
                ddlPurchaser.Items.Add(new ListItem(u.FullName, u.Email));
        }

        private void ShowSuccess(string msg)
        {
            lblStatus.Text    = msg;
            lblStatus.Visible = true;
            lblError.Visible  = false;
        }

        private void ShowError(string msg)
        {
            lblError.Text     = msg;
            lblError.Visible  = true;
            lblStatus.Visible = false;
        }

        private void ClearMessages()
        {
            lblStatus.Visible = false;
            lblError.Visible  = false;
        }
    }
}
