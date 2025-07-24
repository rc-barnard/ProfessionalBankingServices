using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _45096600_Individual_Webpages
{
    public partial class requestReportsPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblUsersName.Text = Session["Name"].ToString();
            RadioButtonList1.Focus();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (Session["Role"].ToString() == "User")
            {
                Response.Redirect("dashboardUser.aspx");
            }
            else
            {
                Response.Redirect("dashboardOwner.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (RadioButtonList1.SelectedIndex == 0)
            {
                lblConfirm.Visible = false;
                Response.Redirect("clientStatementsPage.aspx");
            }
            else if (RadioButtonList1.SelectedIndex == 1)
            {
                lblConfirm.Visible = false;
                Response.Redirect("top10ClientStatementPage.aspx");
            }
            else if(RadioButtonList1.SelectedIndex == 2)
            {
                lblConfirm.Visible = false;
                Response.Redirect("transactionStatementPage.aspx");
            }
            else
            {
                lblConfirm.Visible =  true;
            }
        }
    }
}