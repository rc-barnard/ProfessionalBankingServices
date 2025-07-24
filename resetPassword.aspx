<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="resetPassword.aspx.cs" Inherits="_45096600_Individual_Webpages.resetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="background-image: url('Properties/banking.jpg'); background-repeat: no-repeat; background-attachment: fixed">
<head runat="server">
    <title>Password Reset</title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style3 {
            width: 100%;
        }
        .auto-style4 {
            width: 300px;
            text-align: center;
        }
        .auto-style8 {
            width: 248px;
        }
        .auto-style10 {
            width: 255px;
        }
        .auto-style21 {
            width: 197px;
        }
        .auto-style22 {
            width: 341px;
        }
        .auto-style23 {
            width: 247px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Properties/logo.png" />
        </div>
        <table class="auto-style3">
            <tr>
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style8">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1" colspan="3">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="30pt" Font-Underline="False" ForeColor="White" Text="Reset your password" Font-Names="Garamond"></asp:Label>
                </td>
            </tr>
            </table>
        <table style="width:100%;">
            <tr>
                <td class="auto-style22" rowspan="10">
                    <asp:Image ID="Image2" runat="server" Height="342px" ImageUrl="~/Properties/moneybag.png" />
                </td>
                <td class="auto-style21">&nbsp;</td>
                <td class="auto-style23">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style21">
                    <asp:Label ID="lblUsername" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" Text="Enter your username:"></asp:Label>
                </td>
                <td class="auto-style23">
                    <asp:TextBox ID="txtUsername" runat="server" Width="152px"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="lblEmailIncorrect" runat="server" Font-Bold="True" ForeColor="Black" Text="Email is incorrect!" Visible="False" Font-Names="Garamond" Font-Size="13pt"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style21">
                    <asp:Label ID="lblEmail" runat="server" Font-Bold="True" Text="Confirm your email address:" Font-Names="Garamond"></asp:Label>
                </td>
                <td class="auto-style23">
                    <asp:TextBox ID="txtEmail" runat="server" TabIndex="1" Width="151px"></asp:TextBox>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email not in correct format! Format: johndoe89@gmail.com" Font-Bold="True" ForeColor="Black" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Font-Names="Garamond" Font-Size="13pt"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style21">&nbsp;</td>
                <td class="auto-style23">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style21">&nbsp;</td>
                <td class="auto-style23">
                    <asp:Button ID="Button1" runat="server" BackColor="#33CC33" BorderColor="Black" BorderStyle="Double" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black" Height="53px" OnClick="Button1_Click" TabIndex="2" Text="Confirm" Width="220px" />
                </td>
                <td class="auto-style1">
                    <asp:Button ID="btnBack" runat="server" BackColor="#33CC33" BorderColor="Black" BorderStyle="Double" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black" Height="53px" OnClick="Button2_Click" Text="Back" Width="220px" TabIndex="3" />
                </td>
            </tr>
            <tr>
                <td class="auto-style21">&nbsp;</td>
                <td class="auto-style23">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style21">
                    <asp:Label ID="lblEnterNew" runat="server" Font-Bold="True" ForeColor="Black" Text="Enter a new password:" Visible="False" Font-Names="Garamond" Font-Size="13pt"></asp:Label>
                </td>
                <td class="auto-style23">
                    <asp:TextBox ID="txtNewPassword" runat="server" TabIndex="4" TextMode="Password" Visible="False" Width="152px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style21">
                    <asp:Label ID="lblConfirmNew" runat="server" Font-Bold="True" ForeColor="Black" Text="Confirm new password:" Visible="False" Font-Names="Garamond" Font-Size="13pt"></asp:Label>
                </td>
                <td class="auto-style23">
                    <asp:TextBox ID="txtConfirmNewPassword0" runat="server" TabIndex="5" TextMode="Password" Visible="False" Width="152px"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="lblPasswordDontMatch" runat="server" Font-Bold="True" ForeColor="Black" Text="Passwords do not match!" Visible="False" Font-Names="Garamond" Font-Size="13pt"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style21">&nbsp;</td>
                <td class="auto-style23">&nbsp;</td>
                <td class="auto-style1">
                    <asp:Label ID="lblResetSuccessful" runat="server" Font-Bold="True" ForeColor="Black" Text="Password reset successful! " Visible="False" Font-Names="Garamond" Font-Size="11pt"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style21">&nbsp;</td>
                <td class="auto-style23">
                    <asp:Button ID="btnSubmit" runat="server" BorderStyle="Double" Font-Bold="True" OnClick="btnSubmit_Click" TabIndex="6" Text="Submit" Visible="False" Width="220px" BackColor="#33CC33" BorderColor="Black" Font-Names="Garamond" Font-Size="13pt" Height="53px" />
                </td>
                <td class="auto-style1"><asp:Button ID="btnProceedToLogin" runat="server" BorderStyle="Double" Font-Bold="True" OnClick="btnProceedToLogin_Click" TabIndex="7" Text="Proceed to login" Visible="False" BackColor="#33CC33" BorderColor="Black" Font-Names="Garamond" Font-Size="13pt" Height="53px" Width="220px" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
