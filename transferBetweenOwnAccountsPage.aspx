<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="transferBetweenOwnAccountsPage.aspx.cs" Inherits="_45096600_Individual_Webpages.transferBetweenOwnAccountsPage" %>

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
        .auto-style10 {
            width: 220px;
        }
        .auto-style11 {
            width: 194px;
        }
        .auto-style13 {
            width: 220px;
            text-align: left;
        }
        .auto-style14 {
            width: 1086px;
            text-align: center;
        }
        .auto-style15 {
            text-align: left;
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
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="False" Font-Size="30pt" Text="Transfer money between your own accounts here," Font-Names="Garamond" ForeColor="White"></asp:Label>
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
                            <td></td>
                            <td class="auto-style13">
                                <asp:Label ID="lblAccount" runat="server" Text="Select account money should be transferred from:"></asp:Label>
                            </td>
                            <td class="auto-style11">
                                <asp:DropDownList ID="dropListAccounts" runat="server" Width="190px">
                                </asp:DropDownList>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style10">&nbsp;</td>
                            <td class="auto-style11">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="auto-style13">
                                <asp:Label ID="lblAmount" runat="server" Text="Enter the amount (R):"></asp:Label>
                            </td>
                            <td class="auto-style11">
                                <asp:TextBox ID="txtAmount" runat="server" Width="181px" TabIndex="1"></asp:TextBox>
                            </td>
                            <td class="auto-style15">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style10">&nbsp;</td>
                            <td class="auto-style11">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                    <br />
                    <asp:Label ID="lblConfirm" runat="server"></asp:Label>
                    <br />
                    <br />
                    <asp:Button ID="btnTransfer" runat="server" BackColor="#33CC33" BorderColor="Black" BorderStyle="Double" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" Height="53px" OnClick="btnTransfer_Click" Text="Transfer" Width="277px" TabIndex="2" />
                    <asp:Button ID="btnYes" runat="server" BackColor="#33CC33" BorderColor="Black" BorderStyle="Double" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" Height="53px" OnClick="btnYes_Click" Text="Yes" Width="65px" TabIndex="3" />
&nbsp;
                    <asp:Button ID="btnNo" runat="server" BackColor="#33CC33" BorderColor="Black" BorderStyle="Double" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" Height="53px" OnClick="btnNo_Click" Text="No" Width="65px" TabIndex="4" />
                    <br />
                    <br />
                    <asp:Button ID="btnReturn" runat="server" BackColor="#33CC33" BorderColor="Black" BorderStyle="Double" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" Height="53px" OnClick="btnReturn_Click" Text="Return to Perform Transactions" Width="320px" TabIndex="5" />
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
