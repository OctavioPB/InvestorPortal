using System;
using System.Web.UI.WebControls;
using InvestorPortal.Data;

namespace InvestorPortal
{
    public partial class Projects : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var projects = ProjectRepository.GetAvailable();
                if (projects.Count == 0)
                {
                    lblNoProjects.Visible = true;
                }
                else
                {
                    rptProjects.DataSource = projects;
                    rptProjects.DataBind();
                }
            }
        }

        protected void rptProjects_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName != "Select") return;

            var projectId = int.Parse(e.CommandArgument.ToString());
            var project   = ProjectRepository.GetById(projectId);
            if (project == null) return;

            Session["Project"]      = project.Name;
            Session["location"]     = project.Location;
            Session["projectID"]    = project.ProjectId.ToString();
            Session["itcValue"]     = string.Format("{0:N0}$", project.ITCValue);
            Session["purchaseCost"] = string.Format("{0:N0}$", project.PurchaseCost);
            Session["dType"]        = project.DealType;
            Session["bType"]        = project.BusinessType;

            Response.Redirect("~/Pages/PurchaseForm.aspx");
        }
    }
}
