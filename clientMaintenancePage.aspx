<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="clientMaintenancePage.aspx.cs" Inherits="_45096600_Individual_Webpages.clientMaintenancePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="background-image: url('Properties/banking.jpg'); background-repeat: no-repeat; background-attachment: fixed">
<head runat="server">
    <title>Client Maintenance</title>
    <style type="text/css">

            .auto-style1 {
                text-align: center;
            }
            .auto-style4 {
                width: 267px;
            }
            .auto-style3 {
                width: 490px;
            }
            .auto-style5 {
                text-align: center;
                height: 49px;
            }
            .auto-style9 {
                width: 100px;
            }
            .auto-style11 {
                width: 37px;
            }
            .auto-style10 {
                width: 58px;
            }
            .auto-style7 {
                width: 208px;
            }
            .auto-style13 {
                width: 466px;
            }
            .auto-style60 {
                text-align: center;
                width: 17px;
            }
            .auto-style46 {
                width: 466px;
                height: 41px;
            }
            .auto-style47 {
                width: 17px;
                text-align: center;
                height: 41px;
            }
            .auto-style48 {
                text-align: left;
                height: 41px;
            }
            .auto-style40 {
                width: 466px;
                height: 211px;
            }
            .auto-style41 {
                width: 17px;
                text-align: center;
                height: 211px;
            }
            .auto-style56 {
                text-align: center;
                height: 211px;
                width: 1046px;
            }
            .auto-style53 {
                width: 182px;
                text-align: right;
            }
            .auto-style44 {
                width: 215px;
                text-align: left;
            }
            .auto-style45 {
                width: 139px;
            }
            .auto-style34 {
                width: 146px;
                text-align: right;
            }
            .auto-style43 {
                text-align: left;
            }
            .auto-style32 {
                width: 120px;
                text-align: left;
            }
            .auto-style54 {
                height: 23px;
                width: 182px;
                text-align: right;
            }
            .auto-style27 {
                height: 23px;
                width: 215px;
                text-align: left;
            }
            .auto-style30 {
                height: 23px;
                width: 139px;
            }
            .auto-style35 {
                height: 23px;
                width: 146px;
                text-align: right;
            }
            .auto-style20 {
                height: 23px;
                text-align: left;
            }
            .auto-style57 {
                width: 466px;
                height: 38px;
            }
            .auto-style58 {
                width: 17px;
                text-align: center;
                height: 38px;
            }
            .auto-style59 {
                text-align: left;
                height: 38px;
                width: 1046px;
            }
            </style>
</head>
<body>
    <form id="form2" runat="server">
        <div class="auto-style1">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Properties/logo.png" />
        </div>
        <table style="width:100%;">
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5" colspan="3">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="False" Font-Size="30pt" Text="Manage clients here, " Font-Names="Garamond" ForeColor="White"></asp:Label>
                    <asp:Label ID="lblUsersName" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="30pt" ForeColor="White"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style5" colspan="3">
                    <table style="width:100%;">
                        <tr>
                            <td class="auto-style9">&nbsp;</td>
                            <td class="auto-style11">&nbsp;</td>
                            <td class="auto-style10">&nbsp;</td>
                            <td class="auto-style7">&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                &nbsp;<asp:Button ID="btnDisplayClients" runat="server" BackColor="#33CC33" BorderColor="Black" BorderStyle="Double" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black" Height="53px" OnClick="btnDisplayClients_Click" Text="Show Client Details" Width="277px" />
&nbsp;
                                <asp:Button ID="btnAddClient" runat="server" BackColor="#33CC33" BorderColor="Black" BorderStyle="Double" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black" Height="53px" OnClick="btnAddClient_Click" Text="Add Client Details" Width="277px" TabIndex="1" />
&nbsp;
                                <asp:Button ID="btnChangeClient" runat="server" BackColor="#33CC33" BorderColor="Black" BorderStyle="Double" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black" Height="53px" OnClick="btnChangeClient_Click" Text="Change Client Details" Width="277px" TabIndex="2" />
&nbsp;
                                <asp:Button ID="btnRemoveClient" runat="server" BackColor="#33CC33" BorderColor="Black" BorderStyle="Double" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black" Height="53px" OnClick="btnRemoveClient_Click" Text="Delete Client Details" Width="277px" TabIndex="3" />
&nbsp;
                                <asp:Button ID="btnReturnDashboard" runat="server" BackColor="#33CC33" BorderColor="Black" BorderStyle="Double" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black" Height="53px" OnClick="btnReturnDashboard_Click" Text="Return to Dashboard" Width="277px" TabIndex="4" />
                            </td>
                        </tr>
                        </table>
                </td>
            </tr>
        </table>
        <table style="width:100%;">
            <tr>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style60">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style46">
                    <asp:Label ID="lblClient" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="20pt" ForeColor="Black" Text="Client Information:" Visible="False"></asp:Label>
                </td>
                <td class="auto-style47" style="border-style: none; border-color: #000000; border-width: medium">
                </td>
                <td class="auto-style48">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style40">
                    <asp:GridView ID="gridViewData" runat="server" BackColor="#FFFFCC" Font-Bold="False" Font-Names="Garamond" Font-Size="12pt" ForeColor="Black" Width="690px" Height="364px">
                    </asp:GridView>
                </td>
                <td class="auto-style41" style="border-style: none; border-color: #000000; border-width: medium">
                </td>
                <td class="auto-style56">
                    <asp:Label ID="lblInstruction" runat="server" Font-Size="20pt" Visible="False" Font-Bold="True" Font-Names="Garamond" ForeColor="Black"></asp:Label>
                    <br />
                    <br />
                    <table style="width:100%;">
                        <tr>
                            <td class="auto-style1" colspan="6">
                                <asp:DropDownList ID="dropListChange" runat="server" Visible="False" AutoPostBack="True" OnSelectedIndexChanged="dropListChange_SelectedIndexChanged" Font-Bold="False" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black" Width="195px" TabIndex="5">
                    </asp:DropDownList>
                                <asp:DropDownList ID="dropListID" runat="server" AutoPostBack="True" OnSelectedIndexChanged="dropListID_SelectedIndexChanged" Visible="False" Font-Bold="False" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black" Width="197px" TabIndex="6">
                    </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1" colspan="6">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style53">
                    <asp:Label ID="lblName" runat="server" Text="First name:" Visible="False" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black"></asp:Label>
                            </td>
                            <td class="auto-style44">
                    <asp:TextBox ID="txtName" runat="server" Visible="False" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black" Width="188px" TabIndex="7"></asp:TextBox>
                            </td>
                            <td class="auto-style45">&nbsp;</td>
                            <td class="auto-style34">
                    <asp:Label ID="lblSurname" runat="server" Text="Surname:" Visible="False" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black"></asp:Label>
                            </td>
                            <td colspan="2" class="auto-style43">
                    <asp:TextBox ID="txtSurname" runat="server" Visible="False" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black" Width="188px" TabIndex="8"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style53">
                    <asp:Label ID="lblUserName" runat="server" Text="Username:" Visible="False" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black"></asp:Label>
                            </td>
                            <td class="auto-style44">
                    <asp:TextBox ID="txtUserName" runat="server" Visible="False" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black" Width="188px" TabIndex="9"></asp:TextBox>
                            </td>
                            <td class="auto-style45">&nbsp;</td>
                            <td class="auto-style34">
                    <asp:Label ID="lblPassword" runat="server" Text="Password:" Visible="False" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black"></asp:Label>
                            </td>
                            <td colspan="2" class="auto-style43">
                    <asp:TextBox ID="txtPassword" runat="server" Visible="False" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black" Width="188px" TabIndex="10"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style53">
                    <asp:Label ID="lblNumber" runat="server" Text="Contact number:" Visible="False" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black"></asp:Label>
                            </td>
                            <td class="auto-style44"><asp:TextBox ID="txtNumber" runat="server" Visible="False" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black" Width="188px" TabIndex="11"></asp:TextBox>
                            </td>
                            <td class="auto-style45">&nbsp;</td>
                            <td class="auto-style34">
                    <asp:Label ID="lblEmail" runat="server" Text="Email address:" Visible="False" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black"></asp:Label>
                            </td>
                            <td class="auto-style32">
                    <asp:TextBox ID="txtEmail" runat="server" Visible="False" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black" Width="188px" TabIndex="12"></asp:TextBox>
                            </td>
                            <td><asp:RegularExpressionValidator ID="valEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style54">
                    <asp:Label ID="lblDOB" runat="server" Text="Date of birth:" Visible="False" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black"></asp:Label>
                            </td>
                            <td class="auto-style27">
                    <asp:TextBox ID="txtDOB" runat="server" Visible="False" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black" Width="188px" TabIndex="13"></asp:TextBox>
                            </td>
                            <td class="auto-style30"></td>
                            <td class="auto-style35"><asp:Label ID="lblRole" runat="server" Text="Role:" Visible="False" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black"></asp:Label>
                            </td>
                            <td class="auto-style20" colspan="2">
                    <asp:DropDownList ID="dropListRole" runat="server" Height="30px" Visible="False" Width="195px" Font-Bold="False" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black" TabIndex="14">
                        <asp:ListItem>Client</asp:ListItem>
                    </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                    <div class="auto-style1">
                        <br />
                    <asp:Label ID="lblWarning" runat="server" Font-Size="13pt" Visible="False" Font-Bold="True" Font-Names="Garamond" ForeColor="Black"></asp:Label>
                        <br />
                        <br />
                                <asp:Button ID="btnAdd" runat="server" BackColor="#33CC33" BorderColor="Black" BorderStyle="Double" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black" Height="53px" Text="Add" Width="227px" OnClick="btnAdd_Click" Visible="False" TabIndex="15" />
                                <asp:Button ID="btnChange" runat="server" BackColor="#33CC33" BorderColor="Black" BorderStyle="Double" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black" Height="53px" Text="Change" Width="227px" OnClick="btnChange_Click" Visible="False" TabIndex="16" />
                                <asp:Button ID="btnDelete" runat="server" BackColor="#33CC33" BorderColor="Black" BorderStyle="Double" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black" Height="53px" Text="Delete" Width="227px" OnClick="btnDelete_Click" Visible="False" TabIndex="17" />
                    <asp:Button ID="btnYes" runat="server" OnClick="btnYes_Click" Text="Yes" Visible="False" Width="40px" TabIndex="18" BackColor="#33CC33" BorderColor="Black" BorderStyle="Double" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black" Height="53px" />
&nbsp;<asp:Button ID="btnNo" runat="server" OnClick="btnNo_Click" Text="No" Visible="False" Width="40px" TabIndex="19" BackColor="#33CC33" BorderColor="Black" BorderStyle="Double" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black" Height="53px" />
                        <br />
                        <br />
                    <asp:Label ID="lblMessage" runat="server" Font-Size="13pt" Visible="False" Font-Bold="True" Font-Names="Garamond" ForeColor="Black"></asp:Label>
                    </div>
                    </td>
            </tr>
            <tr>
                <td class="auto-style57"></td>
                <td class="auto-style58" style="border-style: none; border-color: #000000; border-width: medium">
                </td>
                <td class="auto-style59">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1" colspan="3">
                    <asp:Image ID="Image2" runat="server" Height="379px" ImageUrl="~/Properties/Maintenance.png" Width="563px" />
                    <br />
                    </td>
            </tr>
            </table>
        <asp:HiddenField ID="fieldTypeConfirm" runat="server" Visible="False" />
    </form>
</body>
</html>
