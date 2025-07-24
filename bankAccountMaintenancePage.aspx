<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bankAccountMaintenancePage.aspx.cs" Inherits="_45096600_Individual_Webpages.bankAccountMaintenancePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="background-image: url('Properties/banking.jpg'); background-repeat: no-repeat; background-attachment: fixed">
<head runat="server">
    <title>Bank Account Maintenance</title>
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
            .auto-style44 {
                width: 215px;
                text-align: left;
            }
            .auto-style34 {
            width: 216px;
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
            width: 62px;
        }
        .auto-style62 {
            width: 219px;
            text-align: right;
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
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="False" Font-Size="30pt" Text="Manage bank accounts here, " Font-Names="Garamond" ForeColor="White"></asp:Label>
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
                                <asp:Button ID="btnDisplayBankAccounts" runat="server" BackColor="#33CC33" BorderColor="Black" BorderStyle="Double" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" Height="53px" OnClick="btnDisplayBankAccounts_Click" Text="Display Bank Account Details" Width="290px" />
&nbsp;
                                <asp:Button ID="btnAddBankAccount" runat="server" BackColor="#33CC33" BorderColor="Black" BorderStyle="Double" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" Height="53px" OnClick="btnAddBankAccount_Click" Text="Add Bank Account Details" Width="290px" TabIndex="1" />
&nbsp;
                                <asp:Button ID="btnChangeBankAccount" runat="server" BackColor="#33CC33" BorderColor="Black" BorderStyle="Double" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" Height="53px" OnClick="btnChangeBankAccount_Click" Text="Change Bank Account Details" Width="290px" TabIndex="2" />
&nbsp;
                                <asp:Button ID="btnRemoveBankAccount" runat="server" BackColor="#33CC33" BorderColor="Black" BorderStyle="Double" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" Height="53px" OnClick="btnRemoveBankAccount_Click" Text="Delete Bank Account Details" Width="290px" TabIndex="3" />
&nbsp;
                                <asp:Button ID="btnReturnDashboard" runat="server" BackColor="#33CC33" BorderColor="Black" BorderStyle="Double" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black" Height="53px" OnClick="btnReturnDashboard_Click" Text="Return to Dashboard" Width="290px" TabIndex="4" />
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
                    <asp:Label ID="lblBankAccount" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="20pt" ForeColor="Black" Text="Bank Account Information" Visible="False"></asp:Label>
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
                                <asp:DropDownList ID="dropListChange" runat="server" Visible="False" AutoPostBack="True" OnSelectedIndexChanged="dropListChange_SelectedIndexChanged" Font-Bold="False" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black" Width="195px" TabIndex="5">
                    </asp:DropDownList>
                                <asp:DropDownList ID="dropListID" runat="server" AutoPostBack="True" OnSelectedIndexChanged="dropListID_SelectedIndexChanged" Visible="False" Font-Bold="False" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black" Width="197px" TabIndex="6">
                    </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1" colspan="5">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style62">
                    <asp:Label ID="lblBankAccountNumber" runat="server" Text="Bank account number:" Visible="False" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black"></asp:Label>
                            </td>
                            <td class="auto-style44">
                    <asp:TextBox ID="txtBankAccountNumber" runat="server" Visible="False" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black" Width="188px" TabIndex="7"></asp:TextBox>
                            </td>
                            <td class="auto-style61">&nbsp;</td>
                            <td class="auto-style34">
                    <asp:Label ID="lblBalance" runat="server" Text="Balance (R):" Visible="False" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black"></asp:Label>
                            </td>
                            <td class="auto-style43">
                    <asp:TextBox ID="txtBalance" runat="server" Visible="False" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black" Width="188px" TabIndex="8"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style62">
                    <asp:Label ID="lblClientID" runat="server" Text="Client ID:" Visible="False" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black"></asp:Label>
                            </td>
                            <td class="auto-style44">
                                <asp:DropDownList ID="dropdownListClientID" runat="server" Font-Bold="False" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black" Width="195px" Visible="False" TabIndex="9">
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style61">&nbsp;</td>
                            <td class="auto-style34">
                    <asp:Label ID="lblBankAccountTypeID" runat="server" Text="Bank account type ID:" Visible="False" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black"></asp:Label>
                            </td>
                            <td class="auto-style43">
                    <asp:DropDownList ID="dropdownListBankAccountTypeID" runat="server" Height="30px" Visible="False" Width="195px" Font-Bold="False" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black" TabIndex="10">
                    </asp:DropDownList>
                            </td>
                        </tr>
                        </table>
                    <div class="auto-style1">
                        <br />
                    <asp:Label ID="lblWarning" runat="server" Font-Size="13pt" Visible="False" Font-Bold="True" Font-Names="Garamond" ForeColor="Black"></asp:Label>
                        <br />
                        <br />
                                <asp:Button ID="btnAdd" runat="server" BackColor="#33CC33" BorderColor="Black" BorderStyle="Double" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black" Height="53px" Text="Add" Width="227px" OnClick="btnAdd_Click" Visible="False" TabIndex="11" />
                                <asp:Button ID="btnChange" runat="server" BackColor="#33CC33" BorderColor="Black" BorderStyle="Double" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black" Height="53px" Text="Change" Width="227px" OnClick="btnChange_Click" Visible="False" TabIndex="12" />
                                <asp:Button ID="btnDelete" runat="server" BackColor="#33CC33" BorderColor="Black" BorderStyle="Double" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black" Height="53px" Text="Delete" Width="227px" OnClick="btnDelete_Click" Visible="False" TabIndex="13" />
                    <asp:Button ID="btnYes" runat="server" OnClick="btnYes_Click" Text="Yes" Visible="False" Width="40px" TabIndex="14" BackColor="#33CC33" BorderColor="Black" BorderStyle="Double" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black" Height="53px" />
&nbsp;<asp:Button ID="btnNo" runat="server" OnClick="btnNo_Click" Text="No" Visible="False" Width="40px" TabIndex="15" BackColor="#33CC33" BorderColor="Black" BorderStyle="Double" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" ForeColor="Black" Height="53px" />
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
