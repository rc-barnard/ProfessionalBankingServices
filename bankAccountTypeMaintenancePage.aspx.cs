using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Globalization; //Used to format monthly admin fees input

namespace _45096600_Individual_Webpages
{
    public partial class bankAccountTypeMaintenancePage : System.Web.UI.Page
    {
        //DECLARATION OF THE CONNECTION STRING
        private readonly string connectionString = @"Server=RUAN_BARNARD\SQLEXPRESS;Database=ProfessionalBankingServices; Trusted_Connection=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            string name = Session["Name"].ToString();
            lblUsersName.Text = name;
            btnDisplayBankAccountTypes.Focus();
        }

        protected void btnDisplayBankAccountTypes_Click(object sender, EventArgs e)
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
            lblClient.Visible = true;
            gridViewData.Height = Unit.Pixel(200);
            gridViewData.Width = Unit.Pixel(500);
            gridViewData.Attributes["style"] = "overflow-y: auto; display: block;";
            string query = "SELECT * FROM BankAccountTypes";
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
            lblName.Visible = true;
            txtTypeName.Visible = true;
            lblDescription.Visible = true;
            txtDescription.Visible = true;
            lblMonthlyAdminFees.Visible = true;
            txtMonthlyAdminFees.Visible = true;
        }

        public void ClearControls()
        {
            lblName.Visible = false;
            txtTypeName.Visible = false;
            lblDescription.Visible = false;
            txtDescription.Visible = false;
            lblMonthlyAdminFees.Visible = false;
            txtMonthlyAdminFees.Visible = false;
        }

        protected void btnChangeBankAccountTypes_Click(object sender, EventArgs e)
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
            lblInstruction.Text = "Select BankAccountTypeID from the dropdown list and provide bank account type details to change:";
            lblInstruction.Visible = true;
            dropListChange.Visible = true;
            dropListID.Visible = false;
            populateDropdownLists();
            btnChange.Visible = true;
        }

        private bool validateInput()
        {
            if (string.IsNullOrEmpty(txtTypeName.Text) || string.IsNullOrEmpty(txtDescription.Text) || string.IsNullOrEmpty(txtMonthlyAdminFees.Text))
            {
                lblWarning.Text = "All fields must have values entered!";
                lblWarning.Visible = true;
                btnYes.Visible = false;
                btnNo.Visible = false;
                return false;
            }

            else if (txtTypeName.Text.Length > 7)
            {
                lblWarning.Visible = true;
                lblWarning.Text = "Type name should be 7 characters or less!";
                btnYes.Visible = false;
                btnNo.Visible = false;
                return false;
            }

            else if (txtDescription.Text.Length > 20)
            {
                lblWarning.Visible = true;
                lblWarning.Text = "Type description should be 20 characters or less!";
                btnYes.Visible = false;
                btnNo.Visible = false;
                return false;
            }


            else if (!decimal.TryParse(txtMonthlyAdminFees.Text, out decimal monthlyAdminFees))
            {
                lblWarning.Visible = true;
                lblWarning.Text = "Monthly admin fees should be a decimal value!";
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
                string populateDroplist = "SELECT BankAccountTypeID FROM BankAccountTypes";
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

        protected void btnChange_Click(object sender, EventArgs e)
        {
            dropListID.Visible = false;
            lblWarning.Visible = false;
            lblMessage.Visible = false;
            fieldTypeConfirm.Value = "Change";
            int bankAccountTypeID = int.Parse(dropListChange.SelectedValue.ToString());
            string query = "SELECT TypeName FROM BankAccountTypes WHERE BankAccountTypeID = @bankAccountTypeID";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@BankAccountTypeID", bankAccountTypeID);
                conn.Open();

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        Session["ChangeName"] = reader["TypeName"].ToString();
                    }
                }

            }
            lblWarning.Text = "Are you sure you want to change bank account type's details?";
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
                    string query = "SELECT TypeName, TypeDescription, TypeMonthlyAdminFees FROM BankAccountTypes WHERE BankAccountTypeID = @BankAccountTypeID";
                    using (var cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@BankAccountTypeID", dropListChange.SelectedValue);
                        using (var reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                txtTypeName.Text = reader["TypeName"].ToString();
                                txtDescription.Text = reader["TypeDescription"].ToString();
                                txtMonthlyAdminFees.Text = reader["TypeMonthlyAdminFees"].ToString();
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblWarning.Text = "An error occured loading bank account type's details: " + ex;
                    lblWarning.Visible = true;
                }
            }
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            CultureInfo southAfricanFormat = new CultureInfo("en-ZA");
            decimal.TryParse(txtMonthlyAdminFees.Text, NumberStyles.Number, southAfricanFormat, out decimal fees);
            string formattedMonthlyAdminFees = fees.ToString("0.00", CultureInfo.InvariantCulture);

            if (fieldTypeConfirm.Value == "Change")
            {
                if (validateInput())
                {
                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        try
                        {
                            conn.Open();

                            string sql = "UPDATE BankAccountTypes SET TypeName = @TypeName, TypeDescription = @TypeDescription, TypeMonthlyAdminFees = @TypeMonthlyAdminFees WHERE BankAccountTypeID = @BankAccountTypeID";
                            SqlCommand cmd = new SqlCommand(sql, conn);

                            // This needs to use the selected value from `dropListChange`
                            cmd.Parameters.AddWithValue("@BankAccountTypeID", dropListChange.SelectedValue);

                            // Add parameters
                            cmd.Parameters.AddWithValue("@TypeName", txtTypeName.Text);
                            cmd.Parameters.AddWithValue("@TypeDescription", txtDescription.Text);
                            cmd.Parameters.AddWithValue("@TypeMonthlyAdminFees", formattedMonthlyAdminFees);

                            int executedRows = cmd.ExecuteNonQuery();
                            if (executedRows > 0)
                            {
                                lblMessage.Text = "Details for bank account type " + Session["ChangeName"].ToString() + " changed successfully!";
                                lblMessage.Visible = true;
                            }
                            else
                            {
                                lblMessage.Text = "Details for bank account type " + Session["ChangeName"].ToString() + " changed unsuccessfully! Please try again!";
                                lblMessage.Visible = true;
                            }
                        }
                        catch (SqlException ex)
                        {
                            lblWarning.Text = "An error occured changing bank account type's details: " + ex.Message;
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

                            sql = "INSERT INTO BankAccountTypes (TypeName, TypeDescription, TypeMonthlyAdminFees) " +
                                      "VALUES (@TypeName, @TypeDescription, @TypeMonthlyAdminFees)";
                            cmd = new SqlCommand(sql, conn);

                            // Add parameters
                            cmd.Parameters.AddWithValue("@TypeName", txtTypeName.Text);
                            cmd.Parameters.AddWithValue("@TypeDescription", txtDescription.Text);
                            cmd.Parameters.AddWithValue("@TypeMonthlyAdminFees", formattedMonthlyAdminFees);

                            int executedRows = cmd.ExecuteNonQuery();
                            if (executedRows > 0)
                            {
                                lblMessage.Text = "Bank account type details added successfully!";
                                lblMessage.Visible = true;
                            }
                            else
                            {
                                lblMessage.Text = "Bank account type details added unsuccesfully! Please try again.";
                                lblMessage.Visible = true;
                            }
                        }
                        catch (SqlException ex)
                        {
                            lblWarning.Text = "An error occured adding Bank account type details: " + ex;
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
                        string sql = $"DELETE FROM BankAccountTypes WHERE BankAccountTypeID = @id";
                        SqlCommand cmd = new SqlCommand(sql, conn);
                        cmd.Parameters.AddWithValue("@id", dropListID.SelectedValue);
                        int executedRows = cmd.ExecuteNonQuery();
                        if (executedRows > 0)
                        {
                            lblMessage.Text = "Bank account type details removed successfully!";
                            lblMessage.Visible = true;
                        }
                        else
                        {
                            lblMessage.Text = "Bank account type removed unsuccesfully! Please try again.";
                            lblMessage.Visible = true;
                        }
                    }
                    catch (SqlException ex)
                    {
                        lblMessage.Text = "Failed to remove Bank account type details: " + ex.Message;
                    }
                }
            }
            populateDropdownLists();
            BindGridView();
        }

        public void clearTextboxes()
        {
            txtDescription.Text = txtMonthlyAdminFees.Text = txtTypeName.Text = null;
        }

        protected void btnAddBankAccountTypes_Click(object sender, EventArgs e)
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
            lblInstruction.Text = "Please provide bank account type details to add:";
            lblInstruction.Visible = true;
            btnAdd.Visible = true;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            fieldTypeConfirm.Value = "Add";
            lblWarning.Text = "Are you sure you want to add bank account type's details?";
            lblWarning.Visible = true;
            btnYes.Visible = true;
            btnNo.Visible = true;
            btnAdd.Visible = false;
        }

        protected void btnRemoveBankAccountTypes_Click(object sender, EventArgs e)
        {
            lblWarning.Visible = false;
            lblMessage.Visible = false;
            lblInstruction.Text = "Select BankAccountTypeID from the dropdown list to delete:";
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
            lblWarning.Text = "Are you sure you want to delete bank account type's details?";
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

        protected void btnNo_Click(object sender, EventArgs e)
        {

        }

        protected void dropListID_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnYes.Visible = false;
            btnNo.Visible = false;
            btnDelete.Visible = true;
            lblWarning.Visible = false;
            lblMessage.Visible = false;
        }

        protected void btnReturnDashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("dashboardUser.aspx");
        }
    }
}