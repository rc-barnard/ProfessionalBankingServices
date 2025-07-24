using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient; //USING SQL AS LANGUAGE FOR DATABASE

namespace _45096600_Individual_Webpages
{
    public partial class dafault : System.Web.UI.Page
    {
        //DECLARATION OF THE CONNECTION STRING
        private readonly string connectionString = @"Server=RUAN_BARNARD\SQLEXPRESS;Database=ProfessionalBankingServices; Trusted_Connection=True";


        protected void Page_Load(object sender, EventArgs e)
        {
            txtUsername.Focus();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            lblPasswordIncorrect.Visible = false;
            lblUsernameNotFound.Visible = false;
            lbtnForgotPassword.Visible = false;

            string password = txtPassword.Text;
            string username = txtUsername.Text;

            string query = "SELECT ClientID, FirstName, Surname, ContactNumber, EmailAddress, DateOfBirth, Username, Password, Role  FROM Clients WHERE Username LIKE @Username";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@USERNAME", "%" + username + "%");
                Session["Username"] = username;
                try
                {
                    conn.Open();
                    string storedPassword = null;

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            Session["Surname"] = reader["Surname"].ToString();
                            Session["ContactNumber"] = reader["ContactNumber"].ToString();
                            Session["EmailAddress"] = reader["EmailAddress"].ToString();
                            Session["DateOfBirth"] = reader["DateOfBirth"].ToString();
                            storedPassword = reader["Password"].ToString();
                            Session["Password"] = storedPassword;
                            Session["Name"] = reader["FirstName"].ToString();
                            Session["Role"] = reader["Role"].ToString();
                            Session["ClientID"] = reader["ClientID"].ToString();
                        }

                        if (storedPassword != null)
                        {
                            if (password == storedPassword)
                            {
                                Response.Redirect("dashboard.aspx");
                            }
                            else
                            {
                                lblPasswordIncorrect.Visible = true;
                                lbtnForgotPassword.Visible = true;
                                RequiredFieldValidator2.Enabled = false;
                            }
                        }
                        else
                        {
                            lblUsernameNotFound.Visible = true;
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblError.Text = "An error occured while loggin in: " + ex;
                    lblError.Visible = true;
                }

            }
        }

        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            lblPasswordIncorrect.Visible = false;
            lblUsernameNotFound.Visible = false;
            lbtnForgotPassword.Visible = false;

            string password = txtPassword.Text;
            string username = txtUsername.Text;
            string query = "SELECT Password,Role,FirstName,EmailAddress FROM Users WHERE Username LIKE @Username";
            string role = "";
            string name = "";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@USERNAME", "%" + username + "%");
                Session["Username"] = username;

                try
                {
                    conn.Open();
                    string storedPassword = null;

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            storedPassword = reader["Password"].ToString();
                            role = reader["Role"].ToString();
                            name = reader["FirstName"].ToString();
                            Session["Name"] = name;
                            Session["Role"] = role;
                            Session["EmailAddress"] = reader["EmailAddress"].ToString();
                        }

                        if (storedPassword != null)
                        {
                            if (password == storedPassword)
                            {
                                if (role == "User")
                                {
                                    Response.Redirect("dashboardUser.aspx");
                                }
                                else
                                {
                                    Response.Redirect("dashboardOwner.aspx");
                                }
                            }
                            else
                            {
                                lblPasswordIncorrect.Visible = true;
                                lbtnForgotPassword.Visible = true;
                                RequiredFieldValidator2.Enabled = false;
                            }
                        }
                        else
                        {
                            lblUsernameNotFound.Visible = true;
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblError.Text = "An error occured while loggin in: "+ex;
                    lblError.Visible = true;
                }

            }
        }

        protected void lbtnForgotPassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("resetPassword.aspx");
        }
    }
}
