<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="_45096600_Individual_Webpages.dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="background-image: url('Properties/banking.jpg'); background-repeat: no-repeat; background-attachment: fixed">
<head runat="server">
    <title>Dashboard</title>
    <style type="text/css">
        .auto-style1 {
            width: 256px;
        }
        .auto-style4 {
            text-align: center;
        }
        .auto-style6 {
            width: 480px;
        }
        .auto-style7 {
            width: 480px;
            text-align: center;
        }
        .auto-style8 {
            width: 191px;
        }
        </style>
</head>
<body>
    <form id="formClientDashboard" runat="server">
        <p class="auto-style4">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Properties/logo.png" />
                    </p>
        <table style="width:100%;">
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4" colspan="3">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="False" Font-Size="30pt" Text="Welcome back to your Dashboard" Font-Names="Garamond" ForeColor="White"></asp:Label>
                    &nbsp;<asp:Label ID="lblName" runat="server" Font-Bold="True" Font-Size="30pt" Font-Names="Garamond" ForeColor="White"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style4" rowspan="6">
                    <asp:Image ID="Image2" runat="server" Height="342px" ImageUrl="~/Properties/coins.png" />
                </td>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
            </tr>
            <tr>
                <td style="width:33%; text-align: center;">
                    <asp:Button ID="btnViewAccountInformation" runat="server" BackColor="#33CC33" BorderStyle="Double" Font-Bold="True" ForeColor="Black" Height="53px" Text="View Account Information" Width="227px" BorderColor="Black" Font-Names="Garamond" Font-Size="13pt" OnClick="btnViewAccountInformation_Click" />
                </td>
                <td style="width:33%; text-align: center;">
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="width:33%; text-align: center;">
                    &nbsp;</td>
                <td style="width:33%; text-align: center;">
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="width:33%; text-align: center;">
                    <asp:Button ID="btnPerformTransactions" runat="server" BackColor="#33CC33" BorderStyle="Double" Font-Bold="True" ForeColor="Black" Height="53px" Text="Perform Transactions" Width="227px" TabIndex="1" BorderColor="Black" Font-Names="Garamond" Font-Size="13pt" OnClick="btnPerformTransactions_Click" />
                </td>
                <td style="width:33%; text-align: center;">
                    <asp:Label ID="lblConfirm" runat="server" Font-Bold="True" ForeColor="Black" Text="Are you sure you want to log out?" Visible="False"></asp:Label>
                    <br />
                    <br />
                    <asp:Button ID="btnYes" runat="server" OnClick="btnYes_Click" Text="Yes" Visible="False" Width="40px" TabIndex="4" BackColor="#33CC33" BorderColor="Black" BorderStyle="Double" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black" />
&nbsp;<asp:Button ID="btnNo" runat="server" OnClick="btnNo_Click" Text="No" Visible="False" Width="40px" TabIndex="5" BackColor="#33CC33" BorderColor="Black" BorderStyle="Double" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black" />
                </td>
            </tr>
            <tr>
                <td style="width:33%; text-align: center;">
                    &nbsp;</td>
                <td style="width:33%; text-align: center;">
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="width:33%; text-align: center;">
                    <asp:Button ID="btnRequestBankStatement" runat="server" BackColor="#33CC33" BorderStyle="Double" Font-Bold="True" ForeColor="Black" Height="53px" Text="Request Bank Statement" Width="227px" TabIndex="2" BorderColor="Black" Font-Names="Garamond" Font-Size="13pt" OnClick="btnRequestBankStatement_Click" />
                </td>
                <td style="width:33%; text-align: center;">
                    <asp:Button ID="btnLogOut" runat="server" BackColor="#33CC33" BorderStyle="Double" Font-Bold="True" ForeColor="Black" Height="53px" Text="Log out" Width="227px" OnClick="btnLogOut_Click1" TabIndex="3" BorderColor="Black" Font-Names="Garamond" Font-Size="13pt" />
                </td>
            </tr>
            </table>
    </form>
</body>
</html>
