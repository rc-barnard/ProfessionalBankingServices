<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="accountInformationPage.aspx.cs" Inherits="_45096600_Individual_Webpages.accountInformationPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="background-image: url('Properties/banking.jpg'); background-repeat: no-repeat; background-attachment: fixed">
<head runat="server">
    <title>View Account Information</title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
            .auto-style5 {
                text-align: center;
                height: 49px;
            }
            .auto-style6 {
            width: 217px;
        }
        .auto-style7 {
            text-align: center;
            height: 28px;
        }
        .auto-style8 {
            width: 180px;
        }
        .auto-style9 {
            width: 160px;
        }
        .auto-style11 {
            width: 216px;
        }
        .auto-style16 {
            width: 137px;
        }
        .auto-style18 {
            width: 235px;
        }
        .auto-style19 {
            width: 239px;
        }
        .auto-style20 {
            width: 252px;
            height: 30px;
        }
        .auto-style21 {
            width: 239px;
            height: 30px;
        }
        .auto-style22 {
            width: 216px;
            height: 30px;
        }
        .auto-style23 {
            width: 137px;
            height: 30px;
        }
        .auto-style24 {
            width: 217px;
            height: 30px;
        }
        .auto-style25 {
            height: 30px;
        }
        .auto-style26 {
            width: 179px;
        }
        .auto-style27 {
            width: 179px;
            height: 30px;
        }
        .auto-style28 {
            width: 250px;
        }
        .auto-style29 {
            width: 252px;
        }
        .auto-style30 {
            width: 253px;
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
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="False" Font-Size="30pt" Text="View your account information here, " Font-Names="Garamond" ForeColor="White"></asp:Label>
                    <asp:Label ID="lblClientsName" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="30pt" ForeColor="White"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Button ID="btnReturnDashboard" runat="server" BackColor="#33CC33" BorderColor="Black" BorderStyle="Double" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" Height="53px" OnClick="btnReturnDashboard_Click" Text="Return to Dashboard" Width="277px" />
                </td>
            </tr>
        </table>
        <br />
        <table style="width:100%;">
            <tr>
                <td class="auto-style28">&nbsp;</td>
                <td colspan="2">
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="18pt" Text="Personal Information:"></asp:Label>
                </td>
                <td class="auto-style9">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style28">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style9">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style28">&nbsp;</td>
                <td class="auto-style8">
                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="14pt" Text="First name:"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:Label ID="lblFirstName" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="14pt"></asp:Label>
                </td>
                <td class="auto-style9">
                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="14pt" Text="Last name:"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:Label ID="lblLastname" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="14pt"></asp:Label>
                </td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style28">&nbsp;</td>
                <td class="auto-style8">
                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="14pt" Text="Contact number:"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:Label ID="lblContactNumber" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="14pt"></asp:Label>
                </td>
                <td class="auto-style9">
                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="14pt" Text="Email address:"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:Label ID="lblEmailAddress" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="14pt"></asp:Label>
                </td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style28">&nbsp;</td>
                <td class="auto-style8">
                    <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="14pt" Text="Date of birth:"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:Label ID="lblDOB" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="14pt"></asp:Label>
                </td>
                <td class="auto-style9">
                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="14pt" Text="Username:"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:Label ID="lblUsername" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="14pt"></asp:Label>
                </td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style28">&nbsp;</td>
                <td class="auto-style8" style="border-color: #000000; border-style: none;">
                    <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="14pt" Text="Password:"></asp:Label>
                </td>
                <td class="auto-style6" style="border-color: #000000; border-style: none;">
                    <asp:Label ID="lblPassword" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="14pt"></asp:Label>
                </td>
                <td class="auto-style9" style="border-color: #000000; border-style: none;">&nbsp;</td>
                <td class="auto-style6" style="border-color: #000000; border-style: none;">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <table style="width:100%;">
            <tr>
                <td class="auto-style29">&nbsp;</td>
                <td colspan="2" style="border-style: none none solid none; border-color: #000000">&nbsp;</td>
                <td class="auto-style16" style="border-style: none none solid none; border-color: #000000">&nbsp;</td>
                <td class="auto-style26" style="border-style: none none solid none; border-color: #000000">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style29">&nbsp;</td>
                <td colspan="2">&nbsp;</td>
                <td class="auto-style16">&nbsp;</td>
                <td class="auto-style26">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style29">&nbsp;</td>
                <td colspan="2">
                    <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="18pt" Text="Bank Account Information:"></asp:Label>
                </td>
                <td class="auto-style16">&nbsp;</td>
                <td class="auto-style26">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style29">&nbsp;</td>
                <td class="auto-style19">&nbsp;</td>
                <td class="auto-style11">&nbsp;</td>
                <td class="auto-style16">&nbsp;</td>
                <td class="auto-style26">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style20"></td>
                <td class="auto-style21">
                    <asp:Label ID="lblAccount1" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="14pt" Font-Underline="True" Text="Account Information:"></asp:Label>
                </td>
                <td class="auto-style22"></td>
                <td class="auto-style23"></td>
                <td class="auto-style27"></td>
                <td class="auto-style24"></td>
                <td class="auto-style25"></td>
            </tr>
            <tr>
                <td class="auto-style29">&nbsp;</td>
                <td class="auto-style19">&nbsp;</td>
                <td class="auto-style11">&nbsp;</td>
                <td class="auto-style16">&nbsp;</td>
                <td class="auto-style26">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style29">&nbsp;</td>
                <td class="auto-style19">
                    <asp:Label ID="Label14" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="14pt" Text="Account number:"></asp:Label>
                </td>
                <td class="auto-style11">
                    <asp:Label ID="lblAccountNumber" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="14pt"></asp:Label>
                </td>
                <td class="auto-style16">
                    <asp:Label ID="Label15" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="14pt" Text="Account type:"></asp:Label>
                </td>
                <td class="auto-style26">
                    <asp:Label ID="lblAccountType" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="14pt"></asp:Label>
                </td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style29">&nbsp;</td>
                <td class="auto-style19">
                    <asp:Label ID="Label16" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="14pt" Text="Balance:"></asp:Label>
                </td>
                <td class="auto-style11">
                    <asp:Label ID="lblBalance" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="14pt"></asp:Label>
                </td>
                <td class="auto-style16">&nbsp;</td>
                <td class="auto-style26">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <table style="width:100%;">
            <tr>
                <td class="auto-style30">&nbsp;</td>
                <td class="auto-style18">&nbsp;</td>
                <td class="auto-style11">&nbsp;</td>
                <td class="auto-style16">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style30">&nbsp;</td>
                <td class="auto-style18">
                    <asp:Label ID="lblAccount2" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="14pt" Font-Underline="True" Text="Account 2 Information:" Visible="False"></asp:Label>
                </td>
                <td class="auto-style11">&nbsp;</td>
                <td class="auto-style16">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style30">&nbsp;</td>
                <td class="auto-style18">&nbsp;</td>
                <td class="auto-style11">&nbsp;</td>
                <td class="auto-style16">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style30">&nbsp;</td>
                <td class="auto-style18">
                    <asp:Label ID="lblAN" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="14pt" Text="Account number:" Visible="False"></asp:Label>
                </td>
                <td class="auto-style11">
                    <asp:Label ID="lblAccountNumber2" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="14pt" Visible="False"></asp:Label>
                </td>
                <td class="auto-style16">
                    <asp:Label ID="lblAT" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="14pt" Text="Account type:" Visible="False"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:Label ID="lblAccountType2" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="14pt" Visible="False"></asp:Label>
                </td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style30">&nbsp;</td>
                <td class="auto-style18">
                    <asp:Label ID="lblB" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="14pt" Text="Balance:" Visible="False"></asp:Label>
                </td>
                <td class="auto-style11">
                    <asp:Label ID="lblBalance2" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="14pt" Visible="False"></asp:Label>
                </td>
                <td class="auto-style16">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
