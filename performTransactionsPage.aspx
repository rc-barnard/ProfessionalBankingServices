<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="performTransactionsPage.aspx.cs" Inherits="_45096600_Individual_Webpages.performTransactionsPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="background-image: url('Properties/banking.jpg'); background-repeat: no-repeat; background-attachment: fixed">
<head runat="server">
    <title>Perform Transactions</title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style7 {
            text-align: center;
            height: 28px;
        }
            .auto-style5 {
                text-align: center;
                height: 49px;
            }
            .auto-style8 {
            width: 982px;
        }
        .auto-style9 {
            width: 100%;
        }
        .auto-style10 {
            width: 982px;
            text-align: center;
            height: 89px;
        }
        .auto-style11 {
            height: 89px;
        }
        .auto-style12 {
            height: 44px;
        }
        .auto-style13 {
            width: 982px;
            text-align: center;
            height: 44px;
        }
        .auto-style14 {
            width: 982px;
            text-align: center;
        }
        .auto-style15 {
            height: 26px;
        }
        .auto-style16 {
            width: 982px;
            height: 26px;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Properties/logo.png" />
        </div>
        <table style="width:100%;">
            <tr>
                <td class="auto-style7">
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="False" Font-Size="30pt" Text="Perform transactions here, " Font-Names="Garamond" ForeColor="White"></asp:Label>
                    <asp:Label ID="lblClientsName" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="30pt" ForeColor="White"></asp:Label>
                </td>
            </tr>
        </table>
        <table class="auto-style9">
            <tr>
                <td class="auto-style12"></td>
                <td class="auto-style13"></td>
                <td class="auto-style12"></td>
            </tr>
            <tr>
                <td class="auto-style11"></td>
                <td class="auto-style10">
                    <asp:Button ID="btnTransferMoneyBetweenOwnAccounts" runat="server" BackColor="#33CC33" BorderColor="Black" BorderStyle="Double" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" Height="53px" OnClick="btnTransferMoneyBetweenOwnAccounts_Click" Text="Transfer money between your own accounts" Width="440px" />
&nbsp;
                    <asp:Button ID="btnTransferToExternalAccount" runat="server" BackColor="#33CC33" BorderColor="Black" BorderStyle="Double" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" Height="53px" OnClick="btnTransferToExternalAccount_Click" Text="Transfer money to an external account" Width="440px" TabIndex="1" />
&nbsp;
                    <asp:Button ID="btnReturnDashboard" runat="server" BackColor="#33CC33" BorderColor="Black" BorderStyle="Double" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" Height="53px" OnClick="btnReturnDashboard_Click" Text="Return to Dashboard" Width="277px" TabIndex="2" />
                </td>
                <td class="auto-style11"></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style14">
                    <asp:Label ID="lblError" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style15"></td>
                <td class="auto-style16">
                    <asp:Image ID="Image2" runat="server" Height="464px" ImageUrl="~/Properties/moneyTransfer.png" Width="757px" />
                </td>
                <td class="auto-style15"></td>
            </tr>
        </table>
    </form>
</body>
</html>
