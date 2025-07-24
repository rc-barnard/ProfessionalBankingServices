using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Data;

namespace _45096600_Individual_Webpages
{
    public partial class requestBankStatementPage : System.Web.UI.Page
    {
        private readonly string connectionString = @"Server=RUAN_BARNARD\SQLEXPRESS;Database=ProfessionalBankingServices; Trusted_Connection=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            lblClientsName.Text = Session["Name"].ToString();
            DropDownList1.Focus();
        }

        public void displayControls()
        {
            lblDate.Visible = true;
            lblPage.Visible = true;
            lblReportTitle.Visible = true;
            lblPeriod.Visible = true;
            lblOrderByTitle.Visible = true;
            lblOrder.Visible = true;
            gridViewData.Visible = true;
            lblPageEnd.Visible = true;
        }

        public void clearControls()
        {
            lblDate.Visible = false;
            lblPage.Visible = false;
            lblReportTitle.Visible = false;
            lblPeriod.Visible = false;
            lblOrderByTitle.Visible = false;
            lblOrder.Visible = false;
            gridViewData.Visible = false;
            lblPageEnd.Visible = false;
        }

        protected void CheckBoxYes_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBoxYes.Checked)
            {
                CheckBoxNo.Checked = false;
            }
            if (CheckBoxNo.Checked)
            {
                CheckBoxYes.Checked = false;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            clearControls();
            string clientID = Session["ClientID"].ToString();
            int months = 0;
            string orderBy = "";
            DateTime startingPeriod = DateTime.Today;
            if (DropDownList1.SelectedValue != null && dropListOrderBy.SelectedValue != null && (CheckBoxNo.Checked || CheckBoxYes.Checked))
            {
                if (DropDownList1.SelectedValue == "Past 3 months")
                {
                    lblPeriod.Text = "the past 3 months";
                    months = 3;
                    startingPeriod = DateTime.Now.AddMonths(-months);
                }
                else if (DropDownList1.SelectedValue == "Past 6 months")
                {
                    lblPeriod.Text = "the past 6 months";
                    months = 6;
                    startingPeriod = DateTime.Now.AddMonths(-months);
                }
                else if (DropDownList1.SelectedValue == "Past 12 months")
                {
                    lblPeriod.Text = "the past 12 months";
                    months = 12;
                    startingPeriod = DateTime.Now.AddMonths(-months);
                }

                if (dropListOrderBy.SelectedIndex == 0)
                {
                    orderBy = "Date ASC";
                    lblOrder.Text = orderBy;
                }
                else if (dropListOrderBy.SelectedIndex == 1)
                {
                    orderBy = "Date DESC";
                    lblOrder.Text = orderBy;
                }
                else if (dropListOrderBy.SelectedIndex == 2)
                {
                    orderBy = "TransactionType ASC";
                    lblOrder.Text = orderBy;
                }
                else if (dropListOrderBy.SelectedIndex == 3)
                {
                    orderBy = "TransactionType DESC";
                    lblOrder.Text = orderBy;
                }
                lblDate.Text = DateTime.Today.ToLongDateString();

                string query = "SELECT TransactionType, Date, Amount, BeneficiaryName, BenificiaryAccountNo, Successful FROM Transactions WHERE ClientID = @clientID AND Date >= @startingPeriod ORDER BY " + orderBy;

                gridViewData.Attributes["style"] = "overflow-y: auto; display: block;";

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    try
                    {
                        conn.Open();

                        using (SqlDataAdapter sda = new SqlDataAdapter(query, conn))
                        {
                            sda.SelectCommand.Parameters.AddWithValue("@clientID", clientID);
                            sda.SelectCommand.Parameters.AddWithValue("@startingPeriod", startingPeriod);
                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            gridViewData.DataSource = dt;
                            gridViewData.DataBind();
                        }
                    }
                    catch (SqlException ex)
                    {
                        lblReportTitle.Text = "An error occured loading the data: " + ex;
                        lblReportTitle.Visible = true;
                    }
                }

                if (CheckBoxYes.Checked)
                {
                    string filePath = Path.Combine(Path.GetTempPath(), "BankStatement.txt");

                    try
                    {
                        using (StreamWriter writer = new StreamWriter(filePath))
                        {
                            int[] widths = { 20, 23, 15, 25, 20,8 };
                            writer.WriteLine("Professional Banking Services: Bank Statement for " + Session["Name"].ToString());
                            writer.WriteLine(" ");
                            writer.WriteLine("Date: " + DateTime.Today.ToLongDateString());
                            writer.WriteLine(" ");
                            writer.WriteLine(lblReportTitle.Text + lblPeriod.Text);
                            writer.WriteLine("Order by " + lblOrder.Text + "\t\t\t\t\t\t\t\t\t\t\t\tPage 1");
                            writer.WriteLine(" ");
                            writer.WriteLine("Transaction Type".PadRight(20) + "Date".PadRight(23) + "Amount(R)".PadRight(15) + "Beneficiary Name".PadRight(25) + "Bank Account Number".PadRight(20));
                            writer.WriteLine(" ");
                            foreach (GridViewRow item in gridViewData.Rows)
                            {
                                if (item.RowType == DataControlRowType.DataRow)
                                {
                                    for (int i = 0; i < item.Cells.Count; i++)
                                    {
                                        writer.Write(item.Cells[i].Text.PadRight(widths[i]));
                                    }
                                    writer.WriteLine(" ");
                                }
                            }
                            writer.WriteLine(" ");
                            writer.WriteLine(" ");
                            writer.WriteLine(" ");
                            writer.WriteLine("--- Page 1 of 1 ---");
                        }
                        emailBankStatement();
                    }
                    catch (IOException ex)
                    {
                        lblReportTitle.Text = "An error occcured generating the bank statement: " + ex.Message;
                        lblReportTitle.Visible = true;
                    }
                }

                displayControls();
            }
            else
            {
                lblReportTitle.Text = "Ensure that values was selected and checked!";
                lblReportTitle.Visible = true;
            }
        }

        public void emailBankStatement()
        {

            string filePath = Path.Combine(Path.GetTempPath(), "BankStatement.txt");

            try
            {
                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com")
                {
                    Port = 587,
                    Credentials = new NetworkCredential(email, password),
                    EnableSsl = true,
                };

                MailMessage mailMessage = new MailMessage
                {
                    From = new MailAddress(email),
                    Subject = "Professional Banking Services - Bank Statement",
                    Body = "Please find attached your bank statement as requested: ",
                    IsBodyHtml = false,
                };

                mailMessage.To.Add("");
                mailMessage.Attachments.Add(new Attachment(filePath));
                smtpClient.Send(mailMessage);
            }
            catch (SqlException ex)
            {
                lblReportTitle.Text = "An error occcured emailing the bank statement: " + ex.Message;
                lblReportTitle.Visible = true;
            }
        }


        protected void btnReturnDashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("dashboard.aspx");
        }
    }
}