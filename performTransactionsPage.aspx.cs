using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace _45096600_Individual_Webpages
{
    public partial class performTransactionsPage : System.Web.UI.Page
    {
        private readonly string connectionString = @"Server=RUAN_BARNARD\SQLEXPRESS;Database=ProfessionalBankingServices; Trusted_Connection=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            lblError.Visible = false;
            lblClientsName.Text = Session["Name"].ToString();
            btnTransferMoneyBetweenOwnAccounts.Focus();
        }

        protected void btnReturnDashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("dashboard.aspx");
        }

        public void LoadBankAccountDetails()
        {
            string clientID = Session["ClientID"].ToString();
            int count = 0;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string populateDroplist = "SELECT BankAccountNumber, BankAccountTypeID, Balance FROM BankAccounts WHERE ClientID = @clientID";
                SqlCommand cmd = new SqlCommand(populateDroplist, conn);
                cmd.Parameters.AddWithValue("@clientID", clientID);
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        count++;

                        if (count == 1)
                        {
                            lblError.Text = "You need to have more than one bank account to perform this!";
                            lblError.Visible = true;
                        }

                        if (count == 2)
                        {
                            Response.Redirect("transferBetweenOwnAccountsPage.aspx");
                        }
                    }
                }
            }
        }

        protected void btnTransferMoneyBetweenOwnAccounts_Click(object sender, EventArgs e)
        {
            LoadBankAccountDetails();
        }

        protected void btnTransferToExternalAccount_Click(object sender, EventArgs e)
        {
            Response.Redirect("transferToExternalAccountsPage.aspx");
        }
    }
}