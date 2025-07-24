<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="transferToExternalAccountsPage.aspx.cs" Inherits="_45096600_Individual_Webpages.transferToExternalAccountsPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="background-image: url('Properties/banking.jpg'); background-repeat: no-repeat; background-attachment: fixed">
<head runat="server">
    <title>Transfer Money</title>
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
            width: 423px;
            text-align: center;
        }
        .auto-style9 {
            width: 1086px;
        }
        .auto-style14 {
            width: 1086px;
            text-align: center;
        }
        .auto-style11 {
            width: 194px;
        }
        .auto-style15 {
            text-align: left;
        }
        .auto-style17 {
            width: 440px;
        }
        .auto-style18 {
            width: 440px;
            text-align: right;
        }
        .auto-style19 {
            width: 90px;
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
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="False" Font-Size="30pt" Text="Transfer money to an external account here," Font-Names="Garamond" ForeColor="White"></asp:Label>
                    <asp:Label ID="lblClientsName" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="30pt" ForeColor="White"></asp:Label>
                </td>
            </tr>
        </table>
        <table style="width:100%;">
            <tr>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style9">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:Image ID="Image2" runat="server" Height="355px" ImageUrl="~/Properties/moneyTransfer.png" Width="414px" />
                </td>
                <td class="auto-style14">
                    <table style="width:100%;">
                        <tr>
                            <td class="auto-style19"></td>
                            <td class="auto-style18">
                                <asp:Label ID="lblAmount" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" Text="Enter the amount you wish to send:"></asp:Label>
                            </td>
                            <td class="auto-style11">
                                <asp:TextBox ID="txtAmount" runat="server" Width="172px"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style19">&nbsp;</td>
                            <td class="auto-style18">
                                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" Text="Enter the beneficiary account holder's name:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtBeneName" runat="server" Width="172px" TabIndex="1"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style19"></td>
                            <td class="auto-style18">
                                <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" Text="Enter the beneficiary's bank account number:"></asp:Label>
                            </td>
                            <td class="auto-style11">
                                <asp:TextBox ID="txtBeneAccountNum" runat="server" Width="172px" TabIndex="2"></asp:TextBox>
                            </td>
                            <td class="auto-style15">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style19">&nbsp;</td>
                            <td class="auto-style18">
                                <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" Text="Select account you want to transfer from:"></asp:Label>
                            </td>
                            <td class="auto-style11">
                                <asp:DropDownList ID="dropListAccounts" runat="server" Width="177px" TabIndex="3">
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style15">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style19">&nbsp;</td>
                            <td class="auto-style17">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                    <br />
                    <asp:Label ID="lblConfirm" runat="server"></asp:Label>
                    <br />
                    <br />
                    <asp:Button ID="btnTransfer" runat="server" BackColor="#33CC33" BorderColor="Black" BorderStyle="Double" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" Height="53px" OnClick="btnTransfer_Click" Text="Transfer" Width="277px" TabIndex="4" />
                    <asp:Button ID="btnYes" runat="server" BackColor="#33CC33" BorderColor="Black" BorderStyle="Double" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" Height="53px" OnClick="btnYes_Click" Text="Yes" Width="65px" TabIndex="5" />
&nbsp;
                    <asp:Button ID="btnNo" runat="server" BackColor="#33CC33" BorderColor="Black" BorderStyle="Double" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" Height="53px" OnClick="btnNo_Click" Text="No" Width="65px" TabIndex="6" />
                    <br />
                    <br />
                    <asp:Button ID="btnReturn" runat="server" BackColor="#33CC33" BorderColor="Black" BorderStyle="Double" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" Height="53px" OnClick="btnReturn_Click" Text="Return to Perform Transactions" Width="320px" TabIndex="7" />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                </td>
                <td>&nbsp;</td>
            </tr>
            </table>
    </form>
        </body>
</html>
