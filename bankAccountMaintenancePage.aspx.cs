using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Globalization;

namespace _45096600_Individual_Webpages
{
    public partial class bankAccountMaintenancePage : System.Web.UI.Page
    {
        //DECLARATION OF THE CONNECTION STRING
        private readonly string connectionString = @"Server=RUAN_BARNARD\SQLEXPRESS;Database=ProfessionalBankingServices; Trusted_Connection=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            btnDisplayBankAccounts.Focus();
            string name = Session["Name"].ToString();
            lblUsersName.Text = name;
            btnDisplayBankAccounts.Focus();
            if(!Page.IsPostBack)
            {
                populateBankAccountTypeIDDropdownLists();
                populateClientIDDropdownLists();
            }
        }

        protected void btnDisplayBankAccounts_Click(object sender, EventArgs e)
        {
            lblInstruction.Visible = false;
            dropListID.Visible = false;
            dropListChange.Visible = false;
            ClearControls();
            lblWarning.Visible = false;
            btnAdd.Visible = false;
            btnChange.Visible = false;
            btnDelete.Visible = false;
            btnYes.Visible = false;
            btnNo.Visible = false;
            lblMessage.Visible = false;
            BindGridView();
        }

        public void BindGridView()
        {
            lblBankAccount.Visible = true;
            gridViewData.Height = Unit.Pixel(400);
            gridViewData.Width = Unit.Pixel(600);
            gridViewData.Attributes["style"] = "overflow-y: auto; display: block;";
            string query = "SELECT * FROM BankAccounts";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();

                    using (SqlDataAdapter sda = new SqlDataAdapter(query, conn))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        gridViewData.DataSource = dt;
                        gridViewData.DataBind();
                    }
                }
                catch (SqlException ex)
                {
                    lblWarning.Text = "An error occured loading the data: " + ex;
                    lblWarning.Visible = true;
                }
            }
        }

        public void DisplayControls()
        {
            lblBankAccountNumber.Visible = true;
            txtBankAccountNumber.Visible = true;
            lblBalance.Visible = true;
            txtBalance.Visible = true;
            lblBankAccountTypeID.Visible = true;
            dropdownListBankAccountTypeID.Visible = true;
            dropdownListClientID.Visible = true;
            lblClientID.Visible = true;
        }

        public void ClearControls()
        {
            lblBankAccountNumber.Visible = false;
            txtBankAccountNumber.Visible = false;
            lblBalance.Visible = false;
            txtBalance.Visible = false;
            lblBankAccountTypeID.Visible = false;
            dropdownListBankAccountTypeID.Visible = false;
            dropdownListClientID.Visible = false;
            lblClientID.Visible = false;
        }

        protected void btnChangeBankAccount_Click(object sender, EventArgs e)
        {
            lblWarning.Visible = false;
            lblMessage.Visible = false;
            clearTextboxes();
            btnAdd.Visible = false;
            btnDelete.Visible = false;
            btnYes.Visible = false;
            btnNo.Visible = false;

            BindGridView();
            DisplayControls();
            lblInstruction.Text = "Select BankAccountID from the dropdown list and provide bank account details to change:";
            lblInstruction.Visible = true;
            dropListChange.Visible = true;
            dropListID.Visible = false;
            populateDropdownLists();
            btnChange.Visible = true;
        }

        private bool validateInput()
        {
            if (string.IsNullOrEmpty(txtBankAccountNumber.Text) || string.IsNullOrEmpty(txtBalance.Text) || string.IsNullOrEmpty(dropdownListClientID.SelectedValue) || string.IsNullOrEmpty(dropdownListBankAccountTypeID.SelectedValue))
            {
                lblWarning.Text = "All fields must have values entered and selected!";
                lblWarning.Visible = true;
                btnYes.Visible = false;
                btnNo.Visible = false;
                return false;
            }

            else if (txtBankAccountNumber.Text.Length != 10 || !txtBankAccountNumber.Text.All(char.IsDigit))
            {
                lblWarning.Visible = true;
                lblWarning.Text = "Bank account number should be 10 digits!";
                btnYes.Visible = false;
                btnNo.Visible = false;
                return false;
            }

            else if (!decimal.TryParse(txtBalance.Text, out decimal balance))
            {
                lblWarning.Visible = true;
                lblWarning.Text = "Balance should be a decimal value!";
                btnYes.Visible = false;
                btnNo.Visible = false;
                return false;
            }

            else
            {
                return true;
            }
        }

        public void populateDropdownLists()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                dropListChange.Items.Clear();
                dropListID.Items.Clear();
                string populateDroplist = "SELECT BankAccountID FROM BankAccounts";
                SqlCommand cmd = new SqlCommand(populateDroplist, conn);
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        dropListChange.Items.Add(reader.GetValue(0).ToString());
                        dropListID.Items.Add(reader.GetValue(0).ToString());
                    }
                }
            }
        }

        public void populateClientIDDropdownLists()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                dropListChange.Items.Clear();
                dropListID.Items.Clear();
                string populateDroplist = "SELECT ClientID FROM Clients";
                SqlCommand cmd = new SqlCommand(populateDroplist, conn);
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        dropdownListClientID.Items.Add(reader.GetValue(0).ToString());
                    }
                }
            }
        }

        public void populateBankAccountTypeIDDropdownLists()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                dropListChange.Items.Clear();
                dropListID.Items.Clear();
                string populateDroplist = "SELECT BankAccountTypeID FROM BankAccountTypes";
                SqlCommand cmd = new SqlCommand(populateDroplist, conn);
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        dropdownListBankAccountTypeID.Items.Add(reader.GetValue(0).ToString());
                    }
                }
            }
        }

        protected void btnChange_Click(object sender, EventArgs e)
        {
            dropListID.Visible = false;
            lblWarning.Visible = false;
            lblMessage.Visible = false;
            fieldTypeConfirm.Value = "Change";
            int bankAccountID = int.Parse(dropListChange.SelectedValue.ToString());
            string query = "SELECT BankAccountNumber FROM BankAccounts WHERE BankAccountID = @bankAccountID";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@BankAccountID", bankAccountID);
                conn.Open();

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        Session["ChangeName"] = reader["BankAccountNumber"].ToString();
                    }
                }

            }
            lblWarning.Text = "Are you sure you want to change bank account details?";
            lblWarning.Visible = true;
            btnYes.Visible = true;
            btnNo.Visible = true;
            btnChange.Visible = false;
        }

        public void populateInputControls()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    string query = "SELECT BankAccountNumber, Balance, ClientID, BankAccountTypeID FROM BankAccounts WHERE BankAccountID = @BankAccountID";
                    using (var cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@BankAccountID", dropListChange.SelectedValue);
                        using (var reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                txtBalance.Text = reader["Balance"].ToString();
                                txtBankAccountNumber.Text = reader["BankAccountNumber"].ToString();
                                dropdownListBankAccountTypeID.SelectedValue = reader["BankAccountTypeID"].ToString();
                                dropdownListClientID.SelectedValue = reader["ClientID"].ToString();
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblWarning.Text = "An error occured loading bank account's details: " + ex;
                    lblWarning.Visible = true;
                }
            }
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            CultureInfo southAfricanFormat = new CultureInfo("en-ZA");
            decimal.TryParse(txtBalance.Text, NumberStyles.Number, southAfricanFormat, out decimal balance);
            string formattedBalance = balance.ToString("0.00", CultureInfo.InvariantCulture);

            if (fieldTypeConfirm.Value == "Change")
            {
                if (validateInput())
                {
                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        try
                        {
                            conn.Open();

                            string sql = "UPDATE BankAccounts SET BankAccountNumber = @BankAccountNumber, Balance = @Balance, ClientID = @ClientID, BankAccountTypeID = @BankAccountTypeID WHERE BankAccountID = @BankAccountID";
                            SqlCommand cmd = new SqlCommand(sql, conn);

                            // This needs to use the selected value from `dropListChange`
                            cmd.Parameters.AddWithValue("@BankAccountID", dropListChange.SelectedValue);

                            // Add parameters
                            cmd.Parameters.AddWithValue("@BankAccountNumber", txtBankAccountNumber.Text);
                            cmd.Parameters.AddWithValue("@Balance", formattedBalance);
                            cmd.Parameters.AddWithValue("@ClientID", dropdownListClientID.SelectedValue);
                            cmd.Parameters.AddWithValue("@BankAccountTypeID", dropdownListBankAccountTypeID.SelectedValue);

                            int executedRows = cmd.ExecuteNonQuery();
                            if (executedRows > 0)
                            {
                                lblMessage.Text = "Details for bank account with number " + Session["ChangeName"].ToString() + " changed successfully!";
                                lblMessage.Visible = true;
                            }
                            else
                            {
                                lblMessage.Text = "Details for bank account with number " + Session["ChangeName"].ToString() + " changed unsuccessfully! Please try again!";
                                lblMessage.Visible = true;
                            }
                        }
                        catch (SqlException ex)
                        {
                            lblWarning.Text = "An error occured changing bank account's details: " + ex.Message;
                            lblWarning.Visible = true;
                        }
                    }
                }
                else
                {
                    btnChange.Visible = true;
                }
            }
            else if (fieldTypeConfirm.Value == "Add")
            {
                if (validateInput())
                {
                    using (var conn = new SqlConnection(connectionString))
                    {
                        try
                        {
                            conn.Open();

                            string sql;
                            SqlCommand cmd;

                            sql = "INSERT INTO BankAccounts (BankAccountNumber, Balance, ClientID, BankAccountTypeID) " +
                                      "VALUES (@BankAccountNumber, @Balance, @ClientID, @BankAccountTypeID)";
                            cmd = new SqlCommand(sql, conn);

                            // Add parameters
                            cmd.Parameters.AddWithValue("@BankAccountNumber", txtBankAccountNumber.Text);
                            cmd.Parameters.AddWithValue("@Balance", formattedBalance);
                            cmd.Parameters.AddWithValue("@ClientID", dropdownListClientID.SelectedValue);
                            cmd.Parameters.AddWithValue("@BankAccountTypeID", dropdownListBankAccountTypeID.SelectedValue);

                            int executedRows = cmd.ExecuteNonQuery();
                            if (executedRows > 0)
                            {
                                lblMessage.Text = "Bank account's details added successfully!";
                                lblMessage.Visible = true;
                            }
                            else
                            {
                                lblMessage.Text = "Bank account's details added unsuccesfully! Please try again.";
                                lblMessage.Visible = true;
                            }
                        }
                        catch (SqlException ex)
                        {
                            lblWarning.Text = "An error occured adding bank account details: " + ex;
                            lblWarning.Visible = true;
                        }
                    }
                }
                else
                {
                    btnAdd.Visible = true;
                }
            }
            else if (fieldTypeConfirm.Value == "Delete")
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    try
                    {
                        conn.Open();
                        string sql = $"DELETE FROM BankAccounts WHERE BankAccountID = @id";
                        SqlCommand cmd = new SqlCommand(sql, conn);
                        cmd.Parameters.AddWithValue("@id", dropListID.SelectedValue);
                        int executedRows = cmd.ExecuteNonQuery();
                        if (executedRows > 0)
                        {
                            lblMessage.Text = "Bank account details removed successfully!";
                            lblMessage.Visible = true;
                        }
                        else
                        {
                            lblMessage.Text = "Bank account removed unsuccesfully! Please try again.";
                            lblMessage.Visible = true;
                        }
                    }
                    catch (SqlException ex)
                    {
                        lblMessage.Text = "Failed to remove bank account details: " + ex.Message;
                    }
                }
            }
            populateDropdownLists();
            BindGridView();
        }

        public void clearTextboxes()
        {
            txtBankAccountNumber.Text = txtBalance.Text = null;
        }

        protected void btnAddBankAccount_Click(object sender, EventArgs e)
        {
            lblMessage.Visible = false;
            dropListChange.Visible = false;
            dropListID.Visible = false;
            clearTextboxes();
            DisplayControls();
            btnChange.Visible = false;
            btnDelete.Visible = false;
            btnYes.Visible = false;
            btnNo.Visible = false;
            lblWarning.Visible = false;
            BindGridView();
            lblInstruction.Text = "Please provide bank account details to add:";
            lblInstruction.Visible = true;
            btnAdd.Visible = true;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            fieldTypeConfirm.Value = "Add";
            lblWarning.Text = "Are you sure you want to add bank account's details?";
            lblWarning.Visible = true;
            btnYes.Visible = true;
            btnNo.Visible = true;
            btnAdd.Visible = false;
        }

        protected void btnRemoveBankAccount_Click(object sender, EventArgs e)
        {
            lblWarning.Visible = false;
            lblMessage.Visible = false;
            lblInstruction.Text = "Select BankAccountID from the dropdown list to delete:";
            lblInstruction.Visible = true;
            dropListChange.Visible = false;
            dropListID.Visible = true;
            ClearControls();
            btnChange.Visible = false;
            btnAdd.Visible = false;
            btnYes.Visible = false;
            btnNo.Visible = false;
            BindGridView();
            populateDropdownLists();
            btnDelete.Visible = true;
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            fieldTypeConfirm.Value = "Delete";
            lblWarning.Text = "Are you sure you want to delete bank account details?";
            lblWarning.Visible = true;
            btnYes.Visible = true;
            btnNo.Visible = true;
            btnDelete.Visible = false;
        }

        protected void dropListChange_SelectedIndexChanged(object sender, EventArgs e)
        {
            populateInputControls();
            btnYes.Visible = false;
            btnNo.Visible = false;
            btnChange.Visible = true;
            lblWarning.Visible = false;
            lblMessage.Visible = false;
        }

        protected void dropListID_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnYes.Visible = false;
            btnNo.Visible = false;
            btnDelete.Visible = true;
            lblWarning.Visible = false;
            lblMessage.Visible = false;
        }

        protected void btnNo_Click(object sender, EventArgs e)
        {

        }

        protected void btnReturnDashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("dashboardUser.aspx");
        }
    }
}