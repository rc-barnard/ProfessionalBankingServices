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
    public partial class top10ClientStatementPage : System.Web.UI.Page
    {
        private readonly string connectionString = @"Server=RUAN_BARNARD\SQLEXPRESS;Database=ProfessionalBankingServices; Trusted_Connection=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            lblUsersName.Text = Session["Name"].ToString();
            //Ensuring that dates only set at first time usage.
            if (!Page.IsPostBack)
            {
                calenderEnd.TodaysDate = DateTime.Today;//Getting today's date.
                calenderEnd.SelectedDate = DateTime.Today;//Setting the selected date to today's date.
                calenderStart.TodaysDate = DateTime.Today;//Getting today's date.
                calenderStart.SelectedDate = DateTime.Today;//Setting the selected date to today's date.
            }
            calenderStart.Focus();
        }

        public void displayControls()
        {
            lblDate.Visible = true;
            lblPage.Visible = true;
            lblReportTitle.Visible = true;
            lblReportTitle0.Visible = true;
            lblStartPeriod.Visible = true;
            lblEndPeriod.Visible = true;
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
            lblReportTitle0.Visible = false;
            lblStartPeriod.Visible = false;
            lblEndPeriod.Visible = false;
            lblOrderByTitle.Visible = false;
            lblOrder.Visible = false;
            gridViewData.Visible = false;
            lblPageEnd.Visible = false;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            clearControls();
            if (dropListOrderBy.SelectedValue != null && (CheckBoxNo.Checked || CheckBoxYes.Checked))
            {
                string orderBy = "";
                DateTime startingPeriod = calenderStart.SelectedDate;
                DateTime endingPeriod = calenderEnd.SelectedDate;
                lblEndPeriod.Text = endingPeriod.ToString("yyyy-MM-dd");
                lblStartPeriod.Text = startingPeriod.ToString("yyyy-MM-dd");
                lblDate.Text = DateTime.Today.ToLongDateString();

                if (dropListOrderBy.SelectedIndex == 0)
                {
                    orderBy = "TransactionCount ASC";
                    lblOrder.Text = orderBy;
                }
                else if (dropListOrderBy.SelectedIndex == 1)
                {
                    orderBy = "TransactionCount DESC";
                    lblOrder.Text = orderBy;
                }

                string query = "WITH ClientTransactionCounts AS (SELECT c.FirstName, c.Surname, COUNT(t.TransactionID) AS TransactionCount FROM Clients c JOIN Transactions t ON c.ClientID = t.ClientID WHERE t.Date >= @startingPeriod AND t.Date <= @endingPeriod GROUP BY c.FirstName, c.Surname) SELECT TOP 10 FirstName, Surname, TransactionCount FROM ClientTransactionCounts ORDER BY " + orderBy;

                gridViewData.Attributes["style"] = "overflow-y: auto; display: block;";

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    try
                    {
                        conn.Open();

                        using (SqlDataAdapter sda = new SqlDataAdapter(query, conn))
                        {
                            sda.SelectCommand.Parameters.AddWithValue("@startingPeriod", startingPeriod);
                            sda.SelectCommand.Parameters.AddWithValue("@endingPeriod", endingPeriod);
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
                    string filePath = Path.Combine(Path.GetTempPath(), "Top10ClientStatement.txt");

                    try
                    {
                        using (StreamWriter writer = new StreamWriter(filePath))
                        {
                            int[] widths = { 20, 20, 20};
                            writer.WriteLine("Professional Banking Services: Top 10 Client Statement Per Time Period");
                            writer.WriteLine();
                            writer.WriteLine("Date: " + DateTime.Today.ToLongDateString());
                            writer.WriteLine();
                            writer.WriteLine(lblReportTitle.Text + lblStartPeriod.Text + " " + lblReportTitle0.Text + " " + lblEndPeriod.Text);
                            writer.WriteLine("Order by " + lblOrder.Text + "\t\t\t\t\t\t\t\t\t\t\t\tPage 1");
                            writer.WriteLine();
                            writer.WriteLine("First Name".PadRight(widths[0]) +
                                            "Surname".PadRight(widths[1]) +
                                            "Transactions Count".PadRight(widths[2]));
                            writer.WriteLine();

                            foreach (GridViewRow row in gridViewData.Rows)
                            {
                                if (row.RowType == DataControlRowType.DataRow)
                                {
                                    writer.Write(
                                        row.Cells[0].Text.PadRight(widths[0]) +
                                        row.Cells[1].Text.PadRight(widths[1]) +
                                        row.Cells[2].Text.PadRight(widths[2]) 
                                    );
                                    writer.WriteLine();
                                }
                            }

                            writer.WriteLine();
                            writer.WriteLine();
                            writer.WriteLine();
                            writer.WriteLine("--- Page 1 of 1 ---");
                        }
                        emailTop10ClientStatement();
                    }
                    catch (IOException ex)
                    {
                        lblReportTitle.Text = "An error occurred generating the top 10 client statement: " + ex.Message;
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

        public void emailTop10ClientStatement()
        {

            string filePath = Path.Combine(Path.GetTempPath(), "Top10ClientStatement.txt");

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
                    Subject = "Professional Banking Services - Top 10 Clients Per Time Period based on Number of Transactions Statement",
                    Body = "Please find attached your top 10 client statement as requested: ",
                    IsBodyHtml = false,
                };

                mailMessage.To.Add(Session["EmailAddress"].ToString());
                mailMessage.Attachments.Add(new Attachment(filePath));
                smtpClient.Send(mailMessage);
            }
            catch (SqlException ex)
            {
                lblReportTitle.Text = "An error occcured emailing the top 10 client statement: " + ex.Message;
                lblReportTitle.Visible = true;
            }
        }

        protected void btnReturnDashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("requestReportsPage.aspx");
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
    }
}