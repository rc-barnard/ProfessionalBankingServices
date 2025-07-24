<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="requestReportsPage.aspx.cs" Inherits="_45096600_Individual_Webpages.requestReportsPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="background-image: url('Properties/banking.jpg'); background-repeat: no-repeat; background-attachment: fixed">
<head runat="server">
    <title>Request Reports</title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style6 {
            width: 480px;
        }
        .auto-style8 {
            width: 191px;
        }
        .auto-style4 {
            text-align: center;
        }
        .auto-style7 {
            width: 480px;
            text-align: center;
        }
        .auto-style10 {
            width: 100%;
        }
        .auto-style12 {
            width: 700px;
            text-align: center;
        }
        .auto-style13 {
            width: 700px;
        }
        .auto-style14 {
            width: 700px;
            text-align: left;
        }
        .auto-style15 {
            text-align: center;
            width: 423px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Properties/logo.png" />
        </div>
        <table class="auto-style10">
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4" colspan="3">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="False" Font-Size="30pt" Text="Request reports here," Font-Names="Garamond" ForeColor="White"></asp:Label>
                    &nbsp;<asp:Label ID="lblUsersName" runat="server" Font-Bold="True" Font-Size="30pt" Font-Names="Garamond" ForeColor="White"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
            </tr>
        </table>
        <table style="width:100%;">
            <tr>
                <td class="auto-style15" rowspan="5">
                    <asp:Image ID="Image2" runat="server" Height="357px" ImageUrl="~/Properties/reports.png" Width="342px" />
                </td>
                <td class="auto-style14">
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="16pt" Text="Select the report you would like to request:"></asp:Label>
                </td>
                <td class="auto-style1" rowspan="5">
                    <asp:Image ID="Image3" runat="server" Height="357px" ImageUrl="~/Properties/reports.png" Width="342px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style12">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style13">
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt">
                        <asp:ListItem>Client statements per time period</asp:ListItem>
                        <asp:ListItem>Top 10 clients per time period based on the number of transactions</asp:ListItem>
                        <asp:ListItem>Transactions per transaction type per time period</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td class="auto-style12">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style12">
                    <asp:Button ID="Button1" runat="server" BackColor="#33CC33" BorderColor="Black" BorderStyle="Double" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" Height="53px" OnClick="Button1_Click" Text="Submit" Width="277px" TabIndex="1" />
                    <br />
                    <asp:Label ID="lblConfirm" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" Text="An option from the list should be selected!" Visible="False"></asp:Label>
                    <br />
                    <asp:Button ID="Button2" runat="server" BackColor="#33CC33" BorderColor="Black" BorderStyle="Double" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" Height="53px" OnClick="Button2_Click" TabIndex="2" Text="Return to Dashboard" Width="277px" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
