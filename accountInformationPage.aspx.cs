using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace _45096600_Individual_Webpages
{
    public partial class accountInformationPage : System.Web.UI.Page
    {
        private readonly string connectionString = @"Server=RUAN_BARNARD\SQLEXPRESS;Database=ProfessionalBankingServices; Trusted_Connection=True";

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
                            lblAccountNumber.Text = reader["BankAccountNumber"].ToString();
                            if(reader["BankAccountTypeID"].ToString() == "1")
                            {
                                lblAccountType.Text = "Cheque";
                            }
                            else
                            {
                                lblAccountType.Text = "Savings";
                            }
                            lblBalance.Text = "R " + reader["Balance"].ToString();
                        }

                        if (count == 2)
                        {
                            lblAccount2.Visible = true;
                            lblAccountNumber2.Text = reader["BankAccountNumber"].ToString();
                            lblAccountNumber2.Visible = true;
                            if (reader["BankAccountTypeID"].ToString() == "1")
                            {
                                lblAccountType2.Text = "Cheque";
                            }
                            else
                            {
                                lblAccountType2.Text = "Savings";
                            }
                            lblAccountType2.Visible = true;
                            lblBalance2.Text = "R " + reader["Balance"].ToString();
                            lblBalance2.Visible = true;
                            lblAN.Visible = true;
                            lblAT.Visible = true;
                            lblB.Visible = true;
                        }
                    }
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            btnReturnDashboard.Focus();
            string dateOfBirth = Session["DateOfBirth"].ToString();
            int year = int.Parse(dateOfBirth.Substring(0, 2).ToString());
            string month = dateOfBirth.Substring(2, 2);
            string day = dateOfBirth.Substring(4, 2);

            if (year > 24)
            {
                dateOfBirth = "19" + year + " - " + month + " - " + day;
            }
            else
            {
                if(year < 10)
                {
                    dateOfBirth = "200" + year + " - " + month + " - " + day;
                }
                else
                {
                    dateOfBirth = "20" + year + " - " + month + " - " + day;
                }
            }

            lblClientsName.Text = Session["Name"].ToString();
            lblFirstName.Text = Session["Name"].ToString();
            lblLastname.Text = Session["Surname"].ToString();
            lblContactNumber.Text = Session["ContactNumber"].ToString();
            lblEmailAddress.Text = Session["EmailAddress"].ToString();
            lblDOB.Text = dateOfBirth;
            lblUsername.Text = Session["Username"].ToString();
            lblPassword.Text = Session["Password"].ToString();
            LoadBankAccountDetails();
        }

        protected void btnReturnDashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("dashboard.aspx");
        }
    }
}