<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="_45096600_Individual_Webpages.dafault" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="background-image: url('Properties/banking.jpg'); background-repeat: no-repeat; background-attachment: fixed">
<head runat="server">
    <title>Welcome & Login</title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 68px;
        }
        .auto-style2 {
            text-align: center;
        }
        .auto-style3 {
            width: 874px;
        }
        .auto-style24 {
            width: 124px;
        }
        .auto-style40 {
            width: 130px;
        }
        .auto-style53 {
            width: 255px;
        }
        .auto-style54 {
            width: 152px;
        }
        .auto-style55 {
            width: 152px;
            height: 23px;
            text-align: right;
        }
        .auto-style56 {
            width: 255px;
            height: 23px;
        }
        .auto-style57 {
            height: 23px;
            text-align: left;
        }
        .auto-style58 {
            text-align: left;
        }
        .auto-style59 {
            width: 152px;
            text-align: right;
        }
        .auto-style60 {
            width: 152px;
            height: 13px;
            text-align: right;
        }
        .auto-style61 {
            width: 255px;
            height: 13px;
        }
        .auto-style62 {
            height: 13px;
            text-align: left;
        }
        .auto-style63 {
            width: 152px;
            height: 8px;
        }
        .auto-style64 {
            width: 255px;
            height: 8px;
        }
        .auto-style65 {
            height: 8px;
        }
        .auto-style66 {
            text-align: center;
            height: 115px;
        }
        .auto-style67 {
            width: 104%;
        }
    </style>
</head>
<body>
    <form id="formWelcome" runat="server">
        <div>
            <br />
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Properties/logo.png" />
                        <br />
                    </td>
                </tr>
            </table>
        </div>
        <table class="auto-style3" align="center">
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="False" Font-Size="56pt" ForeColor="White" Text="Welcome!" BorderColor="#666666" Font-Names="Engravers MT"></asp:Label>
                </td>
                <td class="auto-style40">&nbsp;</td>
                <td class="auto-style24">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2" rowspan="2">
                    <table class="auto-style67">
                        <tr>
                            <td class="auto-style54">&nbsp;</td>
                            <td class="auto-style53">
                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="16pt" Text="Enter your username:" ForeColor="Black" Font-Names="Garamond"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style55">
                    <asp:Label ID="lblUsernameNotFound" runat="server" ForeColor="Black" Text="Username not found!" Visible="False" Font-Bold="True" Font-Names="Garamond"></asp:Label>
                            </td>
                            <td class="auto-style56"><asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style57">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUsername" ErrorMessage="Please enter a username!" ForeColor="Black" Font-Bold="True" Font-Names="Garamond"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style59">&nbsp;</td>
                            <td class="auto-style53">&nbsp;</td>
                            <td class="auto-style58">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style54">&nbsp;</td>
                            <td class="auto-style53">
                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="16pt" Text="Enter your password:" ForeColor="Black" Font-Names="Garamond"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style59">
                    <asp:Label ID="lblPasswordIncorrect" runat="server" ForeColor="Black" Text="Password incorrect!" Visible="False" Font-Bold="True" Font-Names="Garamond"></asp:Label>
                            </td>
                            <td class="auto-style53">
                    <asp:TextBox ID="txtPassword" runat="server" TabIndex="1" TextMode="Password"></asp:TextBox>
                            </td>
                            <td class="auto-style58">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="Please enter a password!" ForeColor="Black" Font-Bold="True" Font-Names="Garamond"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style60">
                    <asp:LinkButton ID="lbtnForgotPassword" runat="server" Visible="False" Font-Bold="True" OnClick="lbtnForgotPassword_Click" TabIndex="4" Font-Names="Garamond">Forgot Password?</asp:LinkButton>
                            </td>
                            <td class="auto-style61"></td>
                            <td class="auto-style62">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style59">&nbsp;</td>
                            <td class="auto-style53">&nbsp;</td>
                            <td class="auto-style58">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style54">&nbsp;</td>
                            <td class="auto-style53">
                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="16pt" ForeColor="Black" Text="Login as:" Font-Names="Garamond"></asp:Label>
                            </td>
                            <td class="auto-style58">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style63"></td>
                            <td class="auto-style64"></td>
                            <td class="auto-style65"></td>
                        </tr>
                        <tr>
                            <td class="auto-style54">&nbsp;</td>
                            <td class="auto-style53">
                    <asp:Button ID="btnClientLogin" runat="server" BackColor="#33CC33" BorderColor="#003300" BorderStyle="Double" Font-Bold="True" Font-Italic="False" Font-Underline="False" ForeColor="Black" Height="42px" OnClick="Button1_Click" TabIndex="2" Text="Client" Width="123px" Font-Names="Garamond" Font-Size="13pt" />
                    &nbsp;<asp:Button ID="btnEmployeeLogin" runat="server" BackColor="#33CC33" BorderColor="#003300" BorderStyle="Double" Font-Bold="True" ForeColor="Black" Height="42px" OnClick="Button2_Click" Text="Employee" Width="116px" TabIndex="3" Font-Names="Garamond" Font-Size="13pt" />
                            </td>
                            <td class="auto-style58">
                    <asp:Label ID="lblError" runat="server" Font-Bold="True" Visible="False" Font-Names="Garamond"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
                <td class="auto-style66" colspan="2">
                    <br />
                    <asp:Image ID="Image2" runat="server" Height="224px" ImageUrl="~/Properties/money.png" Width="220px" />
                    <br />
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="2">
                    &nbsp;</td>
            </tr>
            </table>
    </form>
</body>
</html>
