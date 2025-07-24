using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace _45096600_Individual_Webpages
{
    public partial class clientMaintenancePage : System.Web.UI.Page
    {
        //DECLARATION OF THE CONNECTION STRING
        private readonly string connectionString = @"Server=RUAN_BARNARD\SQLEXPRESS;Database=ProfessionalBankingServices; Trusted_Connection=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            string name = Session["Name"].ToString();
            lblUsersName.Text = name;
            btnDisplayClients.Focus();
        }

        protected void btnDisplayClients_Click(object sender, EventArgs e)
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
            gridViewData.Height = Unit.Pixel(400);
            gridViewData.Width = Unit.Pixel(700);
            gridViewData.Attributes["style"] = "overflow-y: auto; display: block;";
            string query = "SELECT * FROM Clients";
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
            lblDOB.Visible = true;
            lblEmail.Visible = true;
            lblName.Visible = true;
            lblNumber.Visible = true;
            lblPassword.Visible = true;
            lblRole.Visible = true;
            lblSurname.Visible = true;
            lblUserName.Visible = true;
            txtDOB.Visible = true;
            txtEmail.Visible = true;
            txtName.Visible = true;
            txtNumber.Visible = true;
            txtPassword.Visible = true;
            txtSurname.Visible = true;
            txtUserName.Visible = true;
            dropListRole.Visible = true;
        }

        public void ClearControls()
        {
            lblDOB.Visible = false;
            lblEmail.Visible = false;
            lblName.Visible = false;
            lblNumber.Visible = false;
            lblPassword.Visible = false;
            lblRole.Visible = false;
            lblSurname.Visible = false;
            lblUserName.Visible = false;
            txtDOB.Visible = false;
            txtEmail.Visible = false;
            txtName.Visible = false;
            txtNumber.Visible = false;
            txtPassword.Visible = false;
            txtSurname.Visible = false;
            txtUserName.Visible = false;
            dropListRole.Visible = false;
        }

        protected void btnChangeClient_Click(object sender, EventArgs e)
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
            lblInstruction.Text = "Select ClientID from the dropdown list and provide client details to change:";
            lblInstruction.Visible = true;
            dropListChange.Visible = true;
            dropListID.Visible = false;
            populateDropdownLists();
            btnChange.Visible = true;
        }

        private bool validateInput()
        {
            if (string.IsNullOrEmpty(txtName.Text) || string.IsNullOrEmpty(txtSurname.Text) || string.IsNullOrEmpty(txtPassword.Text) || string.IsNullOrEmpty(txtUserName.Text) || string.IsNullOrEmpty(txtDOB.Text) || string.IsNullOrEmpty(txtEmail.Text) || string.IsNullOrEmpty(txtNumber.Text))
            {
                lblWarning.Text = "All fields must have values entered!";
                lblWarning.Visible = true;
                btnYes.Visible = false;
                btnNo.Visible = false;
                return false;
            }

            else if (txtName.Text.Length > 30)
            {
                lblWarning.Visible = true;
                lblWarning.Text = "First name should be 30 characters or less!";
                btnYes.Visible = false;
                btnNo.Visible = false;
                return false;
            }

            else if (txtSurname.Text.Length > 30)
            {
                lblWarning.Visible = true;
                lblWarning.Text = "Surname should be 30 characters or less!";
                btnYes.Visible = false;
                btnNo.Visible = false;
                return false;
            }

            else if (txtNumber.Text.Length != 10 || !txtNumber.Text.All(char.IsDigit))
            {
                lblWarning.Visible = true;
                lblWarning.Text = "Contact number should be 10 digits!";
                btnYes.Visible = false;
                btnNo.Visible = false;
                return false;
            }

            else if (txtDOB.Text.Length != 6 || !txtDOB.Text.All(char.IsDigit))
            {
                lblWarning.Visible = true;
                lblWarning.Text = "DoB should be 6 characters in format yymmdd!";
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
                string populateDroplist = "SELECT ClientID FROM Clients";
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
            int clientID = int.Parse(dropListChange.SelectedValue.ToString());
            string query = "SELECT FirstName FROM Clients WHERE ClientID = @clientID";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@ClientID", clientID);
                conn.Open();

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        Session["ChangeName"] = reader["FirstName"].ToString();
                    }
                }

            }
            lblWarning.Text = "Are you sure you want to change client's details?";
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
                    string query = "SELECT FirstName, Surname, ContactNumber, EmailAddress, DateOfBirth, UserName, Password, Role FROM Clients WHERE ClientID = @ClientID";
                    using (var cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@ClientID", dropListChange.SelectedValue);
                        using (var reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                txtName.Text = reader["FirstName"].ToString();
                                txtSurname.Text = reader["Surname"].ToString();
                                txtNumber.Text = reader["ContactNumber"].ToString();
                                txtEmail.Text = reader["EmailAddress"].ToString();
                                txtDOB.Text = reader["DateOfBirth"].ToString();
                                txtUserName.Text = reader["UserName"].ToString();
                                txtPassword.Text = reader["Password"].ToString();
                                dropListRole.SelectedValue = reader["Role"].ToString();
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblWarning.Text = "An error occured loading client's details: " + ex;
                    lblWarning.Visible = true;
                }
            }
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            if (fieldTypeConfirm.Value == "Change")
            {
                if (validateInput())
                {
                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        try
                        {
                            conn.Open();

                            string sql = "UPDATE Clients SET FirstName = @FirstName, Surname = @Surname, ContactNumber = @ContactNumber, EmailAddress = @EmailAddress, DateOfBirth = @DateOfBirth, UserName = @UserName, Password = @Password, Role = @Role WHERE ClientID = @ClientID";
                            SqlCommand cmd = new SqlCommand(sql, conn);

                            // This needs to use the selected value from `dropListChange`
                            cmd.Parameters.AddWithValue("@ClientID", dropListChange.SelectedValue);

                            // Add parameters
                            cmd.Parameters.AddWithValue("@FirstName", txtName.Text);
                            cmd.Parameters.AddWithValue("@Surname", txtSurname.Text);
                            cmd.Parameters.AddWithValue("@ContactNumber", txtNumber.Text);
                            cmd.Parameters.AddWithValue("@EmailAddress", txtEmail.Text);
                            cmd.Parameters.AddWithValue("@DateOfBirth", txtDOB.Text);
                            cmd.Parameters.AddWithValue("@UserName", txtUserName.Text);
                            cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                            cmd.Parameters.AddWithValue("@Role", dropListRole.SelectedItem.Text);

                            int executedRows = cmd.ExecuteNonQuery();
                            if (executedRows > 0)
                            {
                                lblMessage.Text = "Details for " + Session["ChangeName"].ToString() + " changed successfully!";
                                lblMessage.Visible = true;
                            }
                            else
                            {
                                lblMessage.Text = "Details for " + Session["ChangeName"].ToString() + " changed unsuccessfully! Please try again!";
                                lblMessage.Visible = true;
                            }
                        }
                        catch (SqlException ex)
                        {
                            lblWarning.Text = "An error occured changing client details: " + ex.Message;
                            lblWarning.Visible = true;
                        }
                    }
                    lblWarning.Visible = false;
                    btnYes.Visible = false;
                    btnNo.Visible = false;
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

                            DateTime date = DateTime.Today.Date;

                            sql = "INSERT INTO Clients (FirstName, Surname, ContactNumber, EmailAddress, DateOfBirth, UserName, Password, Role, DateJoined) " +
                                      "VALUES (@FirstName, @Surname, @ContactNumber, @EmailAddress, @DateOfBirth, @UserName, @Password, @Role, @DateJoined)";
                            cmd = new SqlCommand(sql, conn);

                            // Add parameters
                            cmd.Parameters.AddWithValue("@FirstName", txtName.Text);
                            cmd.Parameters.AddWithValue("@Surname", txtSurname.Text);
                            cmd.Parameters.AddWithValue("@ContactNumber", txtNumber.Text);
                            cmd.Parameters.AddWithValue("@EmailAddress", txtEmail.Text);
                            cmd.Parameters.AddWithValue("@DateOfBirth", txtDOB.Text);
                            cmd.Parameters.AddWithValue("@UserName", txtUserName.Text);
                            cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                            cmd.Parameters.AddWithValue("@Role", dropListRole.SelectedItem.Text);
                            cmd.Parameters.AddWithValue("@DateJoined", date);

                            int executedRows = cmd.ExecuteNonQuery();
                            if (executedRows > 0)
                            {
                                lblMessage.Text = "Client details added successfully!";
                                lblMessage.Visible = true;
                            }
                            else
                            {
                                lblMessage.Text = "Client details added unsuccesfully! Please try again.";
                                lblMessage.Visible = true;
                            }
                        }
                        catch (SqlException ex)
                        {
                            lblWarning.Text = "An error occured adding client details: " + ex;
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
                        string sql = $"DELETE FROM Clients WHERE ClientID = @id";
                        SqlCommand cmd = new SqlCommand(sql, conn);
                        cmd.Parameters.AddWithValue("@id", dropListID.SelectedValue);
                        int executedRows = cmd.ExecuteNonQuery();
                        if (executedRows > 0)
                        {
                            lblMessage.Text = "Client details removed successfully!";
                            lblMessage.Visible = true;
                        }
                        else
                        {
                            lblMessage.Text = "Client details removed unsuccesfully! Please try again.";
                            lblMessage.Visible = true;
                        }
                    }
                    catch (SqlException ex)
                    {
                        lblMessage.Text = "Failed to remove client details: " + ex.Message;
                    }
                }
            }
            
            populateDropdownLists();
            BindGridView();
        }

        public void clearTextboxes()
        {
            txtDOB.Text = txtEmail.Text = txtName.Text = txtNumber.Text = txtPassword.Text = txtSurname.Text = txtUserName.Text = null;
        }

        protected void btnAddClient_Click(object sender, EventArgs e)
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
            lblInstruction.Text = "Please provide client details to add:";
            lblInstruction.Visible = true;
            btnAdd.Visible = true;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            fieldTypeConfirm.Value = "Add";
            lblWarning.Text = "Are you sure you want to add client's details?";
            lblWarning.Visible = true;
            btnYes.Visible = true;
            btnNo.Visible = true;
            btnAdd.Visible = false;
        }

        protected void btnRemoveClient_Click(object sender, EventArgs e)
        {
            lblWarning.Visible = false;
            lblMessage.Visible = false;
            lblInstruction.Text = "Select ClientID from the dropdown list to delete:";
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
            lblWarning.Text = "Are you sure you want to delete client's details?";
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