using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace _45096600_Individual_Webpages
{
    public partial class resetPassword : System.Web.UI.Page
    {
        //DECLARATION OF THE CONNECTION STRING
        private readonly string connectionString = @"Server=RUAN_BARNARD\SQLEXPRESS;Database=ProfessionalBankingServices; Trusted_Connection=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            txtUsername.Text = Session["Username"].ToString();
            txtUsername.Focus();
        }

        protected void btnProceedToLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("default.aspx");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            
            string password = txtNewPassword.Text;
            string confirmPassword = txtConfirmNewPassword0.Text;
            string query = "";
            string username = Session["Username"].ToString();

            if (password == confirmPassword)
            {
                lblPasswordDontMatch.Visible = false;
                txtUsername.Text = null;
                txtEmail.Text = null;
                if (Session["Role"].ToString() == "Client")
                {
                    query = "UPDATE Clients SET Password = @password WHERE Username LIKE @Username";
                }
                else
                {
                    query = "UPDATE Users SET Password = @password WHERE Username LIKE @Username";
                }
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Password", password);
                        cmd.Parameters.AddWithValue("@Username", username);
                        try
                        {
                            conn.Open();
                            int executedRows = cmd.ExecuteNonQuery();
                            if (executedRows > 0)
                            {
                                lblResetSuccessful.Visible = true;
                                btnProceedToLogin.Visible = true;
                            }
                            else
                            {
                                lblResetSuccessful.Text = "Password could not update!";
                                lblResetSuccessful.Visible = true;
                            }
                        }
                        catch (SqlException ex)
                        {
                            lblResetSuccessful.Text = "An error occured resetting the password: " + ex;
                            lblResetSuccessful.Visible = true;
                        }
                    }
                }
            }
            else
            {
                lblPasswordDontMatch.Visible = true;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            btnBack.Visible = false;
            string username = Session["Username"].ToString();
            string query = "";
            string email = "";
            string enteredEmail = txtEmail.Text;

            if (Session["Role"].ToString() == "Client")
            {
                query = "SELECT EmailAddress FROM Clients WHERE Username LIKE @Username";
            }
            else
            {
                query = "SELECT EmailAddress FROM Users WHERE Username LIKE @Username";
            }

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@USERNAME", "%" + username + "%");
                try
                {
                    conn.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            email = reader["EmailAddress"].ToString();
                            if (email == enteredEmail)
                            {
                                lblEmailIncorrect.Visible = false;
                                lblEnterNew.Visible = true;
                                lblConfirmNew.Visible = true;
                                txtNewPassword.Visible = true;
                                txtConfirmNewPassword0.Visible = true;
                                btnSubmit.Visible = true;
                            }
                            else
                            {
                                lblEmailIncorrect.Visible = true;
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblResetSuccessful.Text = "An error occured while confirming the email: " + ex;
                    lblResetSuccessful.Visible = true;
                }

            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("default.aspx");
        }
    }
}