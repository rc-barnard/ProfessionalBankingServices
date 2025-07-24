<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bankAccountTypeMaintenancePage.aspx.cs" Inherits="_45096600_Individual_Webpages.bankAccountTypeMaintenancePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="background-image: url('Properties/banking.jpg'); background-repeat: no-repeat; background-attachment: fixed">
<head runat="server">
    <title>Bank Account Type Maintenance</title>
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
            .auto-style34 {
                width: 146px;
                text-align: right;
            }
            .auto-style43 {
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
            .auto-style61 {
            width: 42px;
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
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="False" Font-Size="30pt" Text="Manage bank account types here, " Font-Names="Garamond" ForeColor="White"></asp:Label>
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
                                &nbsp;<asp:Button ID="btnDisplayBankAccountTypes" runat="server" BackColor="#33CC33" BorderColor="Black" BorderStyle="Double" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black" Height="53px" OnClick="btnDisplayBankAccountTypes_Click" Text="Display Bank Account Types Details" Width="320px" />
&nbsp;
                                <asp:Button ID="btnAddBankAccountTypes" runat="server" BackColor="#33CC33" BorderColor="Black" BorderStyle="Double" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black" Height="53px" OnClick="btnAddBankAccountTypes_Click" Text="Add Bank Account Types Details" Width="320px" />
&nbsp;
                                <asp:Button ID="btnChangeBankAccountTypes" runat="server" BackColor="#33CC33" BorderColor="Black" BorderStyle="Double" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black" Height="53px" OnClick="btnChangeBankAccountTypes_Click" Text="Change Bank Account Types Details" Width="320px" />
&nbsp;
                                <asp:Button ID="btnRemoveBankAccountTypes" runat="server" BackColor="#33CC33" BorderColor="Black" BorderStyle="Double" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black" Height="53px" OnClick="btnRemoveBankAccountTypes_Click" Text="Delete Bank Account Types Details" Width="320px" />
&nbsp;
                                <asp:Button ID="btnReturnDashboard" runat="server" BackColor="#33CC33" BorderColor="Black" BorderStyle="Double" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black" Height="53px" OnClick="btnReturnDashboard_Click" Text="Return to Dashboard" Width="277px" />
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
                    <asp:Label ID="lblClient" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="20pt" ForeColor="Black" Text="Bank Account Type Information:" Visible="False"></asp:Label>
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
                            <td class="auto-style1" colspan="5">
                                <asp:DropDownList ID="dropListChange" runat="server" Visible="False" AutoPostBack="True" OnSelectedIndexChanged="dropListChange_SelectedIndexChanged" Font-Bold="False" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black" Width="195px">
                    </asp:DropDownList>
                                <asp:DropDownList ID="dropListID" runat="server" AutoPostBack="True" OnSelectedIndexChanged="dropListID_SelectedIndexChanged" Visible="False" Font-Bold="False" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black" Width="197px">
                    </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1" colspan="5">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style53">
                    <asp:Label ID="lblName" runat="server" Text="Name:" Visible="False" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black"></asp:Label>
                            </td>
                            <td class="auto-style44">
                    <asp:TextBox ID="txtTypeName" runat="server" Visible="False" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black" Width="188px"></asp:TextBox>
                            </td>
                            <td class="auto-style61">&nbsp;</td>
                            <td class="auto-style34">
                    <asp:Label ID="lblDescription" runat="server" Text="Description:" Visible="False" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black"></asp:Label>
                            </td>
                            <td class="auto-style43">
                    <asp:TextBox ID="txtDescription" runat="server" Visible="False" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black" Width="188px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style53">
                    <asp:Label ID="lblMonthlyAdminFees" runat="server" Text="Monthly admin fees (R):" Visible="False" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black"></asp:Label>
                            </td>
                            <td class="auto-style44">
                    <asp:TextBox ID="txtMonthlyAdminFees" runat="server" Visible="False" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black" Width="188px"></asp:TextBox>
                            </td>
                            <td class="auto-style61">&nbsp;</td>
                            <td class="auto-style34">
                                &nbsp;</td>
                            <td class="auto-style43">
                                &nbsp;</td>
                        </tr>
                        </table>
                    <div class="auto-style1">
                        <br />
                    <asp:Label ID="lblWarning" runat="server" Font-Size="13pt" Visible="False" Font-Bold="True" Font-Names="Garamond" ForeColor="Black"></asp:Label>
                        <br />
                        <br />
                                <asp:Button ID="btnAdd" runat="server" BackColor="#33CC33" BorderColor="Black" BorderStyle="Double" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black" Height="53px" Text="Add" Width="227px" OnClick="btnAdd_Click" Visible="False" />
                                <asp:Button ID="btnChange" runat="server" BackColor="#33CC33" BorderColor="Black" BorderStyle="Double" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black" Height="53px" Text="Change" Width="227px" OnClick="btnChange_Click" Visible="False" />
                                <asp:Button ID="btnDelete" runat="server" BackColor="#33CC33" BorderColor="Black" BorderStyle="Double" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black" Height="53px" Text="Delete" Width="227px" OnClick="btnDelete_Click" Visible="False" />
                    <asp:Button ID="btnYes" runat="server" OnClick="btnYes_Click" Text="Yes" Visible="False" Width="40px" TabIndex="4" BackColor="#33CC33" BorderColor="Black" BorderStyle="Double" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black" Height="53px" />
&nbsp;<asp:Button ID="btnNo" runat="server" OnClick="btnNo_Click" Text="No" Visible="False" Width="40px" TabIndex="5" BackColor="#33CC33" BorderColor="Black" BorderStyle="Double" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black" Height="53px" />
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
