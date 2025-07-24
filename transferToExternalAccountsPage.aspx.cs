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
    public partial class transferToExternalAccountsPage : System.Web.UI.Page
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
            txtAmount.Focus();
        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("performTransactionsPage.aspx");
        }

        protected void btnTransfer_Click(object sender, EventArgs e)
        {
            lblConfirm.Text = "Are you sure you want to transfer money from your " + dropListAccounts.SelectedValue.ToString() + " account to "+txtBeneName.Text+"?";
            lblConfirm.Visible = true;
            btnYes.Visible = true;
            btnNo.Visible = true;
            btnTransfer.Visible = false;
        }

        public void updateClientBalance(int accountID, decimal balance)
        {
            CultureInfo southAfricanFormat = new CultureInfo("en-ZA");
            string formattedBalance = balance.ToString("0.00", CultureInfo.InvariantCulture);

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();

                    string sql = "UPDATE BankAccounts SET Balance = @Balance WHERE BankAccountTypeID = @BankAccountTypeID";
                    SqlCommand cmd = new SqlCommand(sql, conn);

                    // This needs to use the selected value from `dropListChange`
                    cmd.Parameters.AddWithValue("@BankAccountTypeID", accountID);

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

        public void updateBeneficiaryBalance(string accountNumber, decimal balance)
        {
            CultureInfo southAfricanFormat = new CultureInfo("en-ZA");
            string formattedBalance = balance.ToString("0.00", CultureInfo.InvariantCulture);

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();

                    string sql = "UPDATE BankAccounts SET Balance = @Balance WHERE BankAccountNumber = @BankAccountNumber";
                    SqlCommand cmd = new SqlCommand(sql, conn);

                    // This needs to use the selected value from `dropListChange`
                    cmd.Parameters.AddWithValue("@BankAccountNumber", accountNumber);

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

        public bool validateInput()
        {
            if (string.IsNullOrEmpty(txtAmount.Text) || string.IsNullOrEmpty(txtBeneName.Text) || string.IsNullOrEmpty(txtBeneAccountNum.Text) || dropListAccounts.SelectedIndex == -1)
            {
                lblConfirm.Text = "All fields should have values entered!";
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
            else if (!txtBeneAccountNum.Text.All(char.IsDigit) || txtBeneAccountNum.Text.Length != 10)
            {
                lblConfirm.Text = "Beneficiary's account number should only contain 10 digits!";
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

        public bool checkBeneficiaryAccountExists(string accountNumber)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();

                    string sql = "SELECT COUNT(*) FROM BankAccounts WHERE BankAccountNumber = @BankAccountNumber";
                    SqlCommand cmd = new SqlCommand(sql, conn);

                    // Add parameters
                    cmd.Parameters.AddWithValue("@BankAccountNumber", accountNumber);

                    int exists = (int)cmd.ExecuteScalar();

                    return exists > 0;
                }
                catch (SqlException ex)
                {
                    lblConfirm.Text = "An error occured checking if beneficiary's account exists within Professional Banking Services: " + ex;
                    lblConfirm.Visible = true;
                    return false;
                }
            }
        }

        public void populateAccountsList()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                dropListAccounts.Items.Clear();
                string populateDroplist = "SELECT BankAccountTypeID FROM BankAccounts WHERE ClientID =" + Session["ClientID"].ToString();
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

        public decimal getClientBalance(int bankAccountTypeID)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    string sql = "SELECT Balance FROM BankAccounts WHERE ClientID = @ClientID AND BankAccountTypeID = @BankAccountTypeID";
                    decimal balance = 0;
                    conn.Open();
                    SqlCommand comn = new SqlCommand(sql, conn);
                    comn.Parameters.AddWithValue("@ClientID", Session["ClientID"].ToString());
                    comn.Parameters.AddWithValue("@BankAccountTypeID", bankAccountTypeID);
                    SqlDataReader thereader = comn.ExecuteReader();

                    if(thereader.Read())
                    {
                        balance = decimal.Parse(thereader.GetValue(0).ToString());
                    }

                    return balance;
                    
                }
                catch (Exception ex)
                {
                    lblConfirm.Text = "An error occured loading your balance: " + ex.Message;
                    lblConfirm.Visible = false;
                    return 0;
                }
            }
        }

        public decimal getBeneficiaryBalance(string accountNumber)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    string sql = "SELECT Balance FROM BankAccounts WHERE BankAccountNumber = @BankAccountNumber";
                    decimal balance = 0;
                    conn.Open();
                    SqlCommand comn = new SqlCommand(sql, conn);
                    comn.Parameters.AddWithValue("@BankAccountNumber",accountNumber);
                    SqlDataReader thereader = comn.ExecuteReader();

                    if (thereader.Read())
                    {
                        balance = decimal.Parse(thereader.GetValue(0).ToString());
                    }

                    return balance;

                }
                catch (Exception ex)
                {
                    lblConfirm.Text = "An error occured loading your balance: " + ex.Message;
                    lblConfirm.Visible = false;
                    return 0;
                }
            }
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            if (validateInput())
            {
                decimal amount = decimal.Parse(txtAmount.Text);
                string beneficiaryName = txtBeneName.Text;
                string beneficiaryAccountNumber = txtBeneAccountNum.Text;
                int accountID = 0;

                string fromAccount = dropListAccounts.SelectedValue.ToString();

                if (fromAccount == "Savings")
                {
                    accountID = 2;
                }
                else
                {
                    accountID = 1;
                }

                decimal clientBalance = getClientBalance(accountID);

                if (checkBeneficiaryAccountExists(beneficiaryAccountNumber))
                {
                    decimal beneficiaryBalance = getBeneficiaryBalance(beneficiaryAccountNumber);
                    if (amount > clientBalance)
                    {
                        lblConfirm.Text = "Amount should be less than or equal to balance! Balance: R" + clientBalance;
                        lblConfirm.Visible = true;
                        btnNo.Visible = false;
                        btnYes.Visible = false;
                        btnTransfer.Visible = true;
                    }
                    else
                    {
                        clientBalance -= amount;
                        beneficiaryBalance += amount;
                        updateClientBalance(accountID, clientBalance);
                        updateBeneficiaryBalance(beneficiaryAccountNumber,beneficiaryBalance);
                    }
                }
                else
                {
                    if (amount > clientBalance)
                    {
                        lblConfirm.Text = "Amount should be less than or equal to balance! Balance: R" + clientBalance;
                        lblConfirm.Visible = true;
                        btnNo.Visible = false;
                        btnYes.Visible = false;
                        btnTransfer.Visible = true;
                    }
                    else
                    {
                        clientBalance -= amount;
                        updateClientBalance(accountID, clientBalance);
                    }
                }

                char transactionType = 'D';
                DateTime date = DateTime.Now.Date;
                int success = 1;
                int clientID = int.Parse(Session["ClientID"].ToString());
                recordTransaction(transactionType, date, amount, beneficiaryName, beneficiaryAccountNumber, success, clientID);
            }
        }

        protected void btnNo_Click(object sender, EventArgs e)
        {

        }
    }
}