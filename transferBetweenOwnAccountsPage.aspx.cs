using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Globalization;

namespace _45096600_Individual_Webpages
{
    public partial class transferBetweenOwnAccountsPage : System.Web.UI.Page
    {
        private readonly string connectionString = @"Server=RUAN_BARNARD\SQLEXPRESS;Database=ProfessionalBankingServices; Trusted_Connection=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            lblClientsName.Text = Session["Name"].ToString();
            lblConfirm.Visible = false;
            btnYes.Visible = false;
            btnNo.Visible = false;
            if (!Page.IsPostBack)
            {
                populateAccountsList();
            }
            dropListAccounts.Focus();
        }

        public bool validateInput()
        {
            if (string.IsNullOrEmpty(txtAmount.Text) || dropListAccounts.SelectedIndex == -1)
            {
                lblConfirm.Text = "Please select an account and enter an amount!";
                lblConfirm.Visible = true;
                btnNo.Visible = false;
                btnYes.Visible = false;
                btnTransfer.Visible = true;
                return false;
            }
            else if (!decimal.TryParse(txtAmount.Text, out decimal balance))
            {
                lblConfirm.Text = "Amount should be in decimal format!";
                lblConfirm.Visible = true;
                btnNo.Visible = false;
                btnYes.Visible = false;
                btnTransfer.Visible = true;
                return false;
            }
            else
            {
                return true;
            }
        }

        public void populateAccountsList()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                dropListAccounts.Items.Clear();
                string populateDroplist = "SELECT BankAccountTypeID FROM BankAccounts WHERE ClientID ="+Session["ClientID"].ToString();
                SqlCommand cmd = new SqlCommand(populateDroplist, conn);
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        if (reader.GetValue(0).ToString() == "1")
                        {
                            dropListAccounts.Items.Add("Cheque");
                        }

                        if (reader.GetValue(0).ToString() == "2")
                        {
                            dropListAccounts.Items.Add("Savings");
                        }
                    }
                }
            }
        }

        protected void btnTransfer_Click(object sender, EventArgs e)
        {
            lblConfirm.Text = "Are you sure you want to transfer money from " + dropListAccounts.SelectedValue.ToString() + " account ?";
            lblConfirm.Visible = true;
            btnYes.Visible = true;
            btnNo.Visible = true;
            btnTransfer.Visible = false;
        }

        public void updateBalance(string bankAccountNumber, decimal balance)
        {
            CultureInfo southAfricanFormat = new CultureInfo("en-ZA");
            string formattedBalance = balance.ToString("0.00", CultureInfo.InvariantCulture);

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();

                    string sql = "UPDATE BankAccounts SET Balance = @Balance WHERE BankAccountNumber = @BankAccountNumber AND ClientID = @ClientID";
                    SqlCommand cmd = new SqlCommand(sql, conn);

                    // This needs to use the selected value from `dropListChange`
                    cmd.Parameters.AddWithValue("@BankAccountNumber", bankAccountNumber);
                    cmd.Parameters.AddWithValue("@ClientID", int.Parse(Session["ClientID"].ToString()));

                    // Add parameters
                    cmd.Parameters.AddWithValue("@Balance", formattedBalance);

                    int executedRows = cmd.ExecuteNonQuery();
                    if (executedRows > 0)
                    {
                        lblConfirm.Text = "Money transferred successfully!";
                        lblConfirm.Visible = true;
                    }
                    else
                    {
                        lblConfirm.Text = "Money transferred unsuccessfully! Try again.";
                        lblConfirm.Visible = true;
                    }
                }
                catch (SqlException ex)
                {
                    lblConfirm.Text = "An error occured updating bank account's balance: " + ex.Message;
                    lblConfirm.Visible = true;
                }
            }
        }

        public void recordTransaction(char transactionType, DateTime date, decimal amount, string benificiaryName, string benificiaryAccountNumber, int success, int clientID)
        {
            CultureInfo southAfricanFormat = new CultureInfo("en-ZA");
            string formattedAmount = amount.ToString("0.00", CultureInfo.InvariantCulture);

            string query = "INSERT INTO Transactions(TransactionType,Date,Amount,BeneficiaryName,BenificiaryAccountNo,Successful,ClientID) " +
                "VALUES (@TransactionType,@Date,@Amount,@BeneficiaryName,@BeneficiaryAccountNo,@Successful,@ClientID)";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@TransactionType", transactionType);
                    cmd.Parameters.AddWithValue("@Date", date);
                    cmd.Parameters.AddWithValue("@Amount", formattedAmount);
                    cmd.Parameters.AddWithValue("@BeneficiaryName", benificiaryName);
                    cmd.Parameters.AddWithValue("@BeneficiaryAccountNo", benificiaryAccountNumber);
                    cmd.Parameters.AddWithValue("@Successful", success);
                    cmd.Parameters.AddWithValue("@ClientID", int.Parse(Session["ClientID"].ToString()));

                    int executedRows = cmd.ExecuteNonQuery();
                }
                catch (SqlException ex)
                {
                    lblConfirm.Text = "An error occured updating bank account's balance: " + ex.Message;
                    lblConfirm.Visible = true;
                }
            }
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            if (validateInput())
            {
                int count = 0;
                decimal amount = decimal.Parse(txtAmount.Text);
                decimal firstBalance = 0;
                decimal secondBalance = 0;
                string firstID = "";
                string secondID = "";
                string bankAccountNum1 = "";
                string bankAccountNum2 = "";
                string query = "SELECT Balance, BankAccountTypeID, BankAccountNumber FROM BankAccounts WHERE ClientID = "+Session["ClientID"].ToString();
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand(query, conn);
                    conn.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            count++;
                            if (count == 1)
                            {
                                firstBalance = decimal.Parse(reader["Balance"].ToString());
                                firstID = reader["BankAccountTypeID"].ToString();
                                if (firstID == "1")
                                {
                                    firstID = "Cheque";
                                }
                                else
                                {
                                    firstID = "Savings";
                                }
                                bankAccountNum1 = reader["BankAccountNumber"].ToString();
                            }

                            if (count == 2)
                            {
                                secondBalance = decimal.Parse(reader["Balance"].ToString());
                                secondID = reader["BankAccountTypeID"].ToString();
                                if (secondID == "2")
                                {
                                    secondID = "Savings";
                                }
                                else
                                {
                                    secondID = "Cheque";
                                }
                                bankAccountNum2 = reader["BankAccountNumber"].ToString(); 
                            }
                        }
                    }
                }

                char transactionType = 'T';
                DateTime date = DateTime.Now;
                string beniName = Session["Name"].ToString();
                string beniAcc = bankAccountNum2;
                int success = 1;
                int clientID = int.Parse(Session["ClientID"].ToString());

                if (dropListAccounts.SelectedValue.ToString() == "Cheque")
                {
                    if (firstID == "Cheque")
                    {
                        if (amount > firstBalance)
                        {
                            lblConfirm.Text = "Amount should be less than or equal to balance! Balance: R" + firstBalance;
                            lblConfirm.Visible = true;
                            btnNo.Visible = false;
                            btnYes.Visible = false;
                            btnTransfer.Visible = true;
                        }
                        else
                        {
                            firstBalance -= amount;
                            secondBalance += amount;
                            updateBalance(bankAccountNum1, firstBalance);
                            updateBalance(bankAccountNum2, secondBalance);
                            recordTransaction(transactionType, date, amount, beniName, beniAcc, success, clientID);
                        }
                    }
                    else if (secondID == "Cheque")
                    {
                        if (amount > secondBalance)
                        {
                            lblConfirm.Text = "Amount should be less than or equal to balance! Balance: R" + secondBalance;
                            lblConfirm.Visible = true;
                            btnNo.Visible = false;
                            btnYes.Visible = false;
                            btnTransfer.Visible = true;
                        }
                        else
                        {
                            secondBalance -= amount;
                            firstBalance += amount;
                            updateBalance(bankAccountNum2, secondBalance);
                            updateBalance(bankAccountNum1, firstBalance);
                            recordTransaction(transactionType, date, amount, beniName, beniAcc, success, clientID);
                        }
                    }
                }
                else if (dropListAccounts.SelectedValue.ToString() == "Savings")
                {
                    if (firstID == "Savings")
                    {
                        if (amount > firstBalance)
                        {
                            lblConfirm.Text = "Amount should be less than or equal to balance! Balance: R" + firstBalance;
                            lblConfirm.Visible = true;
                            btnNo.Visible = false;
                            btnYes.Visible = false;
                            btnTransfer.Visible = true;
                        }
                        else
                        {
                            firstBalance -= amount;
                            secondBalance += amount;
                            updateBalance(bankAccountNum1, firstBalance);
                            updateBalance(bankAccountNum2, secondBalance);
                            recordTransaction(transactionType, date, amount, beniName, beniAcc, success, clientID);
                        }
                    }
                    else if (secondID == "Savings")
                    {
                        if (amount > secondBalance)
                        {
                            lblConfirm.Text = "Amount should be less than or equal to balance! Balance: R" + secondBalance;
                            lblConfirm.Visible = true;
                            btnNo.Visible = false;
                            btnYes.Visible = false;
                            btnTransfer.Visible = true;
                        }
                        else
                        {
                            firstBalance += amount;
                            secondBalance -= amount;
                            updateBalance(bankAccountNum1, firstBalance);
                            updateBalance(bankAccountNum2, secondBalance);
                            recordTransaction(transactionType, date, amount, beniName, beniAcc, success, clientID);
                        }
                    }
                }
            }
        }

        protected void btnNo_Click(object sender, EventArgs e)
        {

        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("performTransactionsPage.aspx");
        }
    }
}