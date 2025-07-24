using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _45096600_Individual_Webpages
{
    public partial class dashboardUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string name = Session["Name"].ToString();
            lblName.Text = name;
            btnManageClients.Focus();
        }

        protected void btnManageClients_Click(object sender, EventArgs e)
        {
            Response.Redirect("clientMaintenancePage.aspx");
        }

        protected void btnLogOut_Click1(object sender, EventArgs e)
        {
            lblConfirm.Visible = true;
            btnYes.Visible = true;
            btnNo.Visible = true;
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            Response.Redirect("default.aspx");
        }

        protected void btnNo_Click(object sender, EventArgs e)
        {
            lblConfirm.Visible = false;
            btnYes.Visible = false;
            btnNo.Visible = false;
        }

        protected void btnManageEmployees_Click(object sender, EventArgs e)
        {
            Response.Redirect("userMaintenancePage.aspx");
        }

        protected void btnManageBankAccountTypes_Click(object sender, EventArgs e)
        {
            Response.Redirect("bankAccountTypeMaintenancePage.aspx");
        }

        protected void btnManageBankAccounts_Click(object sender, EventArgs e)
        {
            Response.Redirect("bankAccountMaintenancePage.aspx");
        }

        protected void btnRequestReports_Click(object sender, EventArgs e)
        {
            Response.Redirect("requestReportsPage.aspx");
        }
    }
}