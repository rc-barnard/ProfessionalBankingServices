<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="requestBankStatementPage.aspx.cs" Inherits="_45096600_Individual_Webpages.requestBankStatementPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="background-image: url('Properties/banking.jpg'); background-repeat: no-repeat; background-attachment: fixed">
<head runat="server">
    <title>Bank Statement</title>
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
            width: 229px;
        }
        .auto-style9 {
            width: 1086px;
        }
        .auto-style10 {
            width: 522px;
            height: 29px;
        }
        .auto-style11 {
            width: 522px;
            text-align: right;
            height: 29px;
        }
        .auto-style12 {
            width: 229px;
            height: 29px;
        }
        .auto-style13 {
            height: 29px;
        }
        .auto-style14 {
            width: 1086px;
            text-align: center;
        }
        .auto-style15 {
            width: 1086px;
            text-align: right;
        }
        .auto-style16 {
            width: 229px;
            height: 17px;
        }
        .auto-style17 {
            width: 522px;
            text-align: right;
            height: 17px;
        }
        .auto-style18 {
            width: 522px;
            height: 17px;
        }
        .auto-style19 {
            height: 17px;
        }
        .auto-style20 {
            width: 666px;
        }
        .auto-style21 {
            width: 229px;
            text-align: right;
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
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="False" Font-Size="30pt" Text="Access your bank statement here, " Font-Names="Garamond" ForeColor="White"></asp:Label>
                    <asp:Label ID="lblClientsName" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="30pt" ForeColor="White"></asp:Label>
                </td>
            </tr>
        </table>
        <table style="width:100%;">
            <tr>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style9" colspan="2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style12"></td>
                <td class="auto-style11">
                    <asp:Label ID="lblTimePeriod" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt">Select time period:</asp:Label>
                </td>
                <td class="auto-style10">
                    <asp:DropDownList ID="DropDownList1" runat="server" Width="210px">
                        <asp:ListItem>Past 3 months</asp:ListItem>
                        <asp:ListItem>Past 6 months</asp:ListItem>
                        <asp:ListItem>Past 12 months</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style13"></td>
            </tr>
            <tr>
                <td class="auto-style12">&nbsp;</td>
                <td class="auto-style11">
                    <asp:Label ID="lblOrderBy" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt">Order by:</asp:Label>
                </td>
                <td class="auto-style10">
                    <asp:DropDownList ID="dropListOrderBy" runat="server" Width="210px" TabIndex="1">
                        <asp:ListItem>Date Ascending</asp:ListItem>
                        <asp:ListItem>Date Descending</asp:ListItem>
                        <asp:ListItem>Transaction Type Ascending</asp:ListItem>
                        <asp:ListItem>Transaction Type Descending</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style13">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style12">&nbsp;</td>
                <td class="auto-style11">
                    <asp:Label ID="lblEmail" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt">Send a copy to my email:</asp:Label>
                </td>
                <td class="auto-style10">
                    <asp:CheckBox ID="CheckBoxYes" runat="server" OnCheckedChanged="CheckBoxYes_CheckedChanged" Text="Yes" TabIndex="2" />
&nbsp;
                    <asp:CheckBox ID="CheckBoxNo" runat="server" OnCheckedChanged="CheckBoxYes_CheckedChanged" Text="No" TabIndex="3" />
                </td>
                <td class="auto-style13">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style16"></td>
                <td class="auto-style17"></td>
                <td class="auto-style18"></td>
                <td class="auto-style19"></td>
            </tr>
            <tr>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style14" colspan="2">
                    <asp:Button ID="btnSubmit" runat="server" BackColor="#33CC33" BorderColor="Black" BorderStyle="Double" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" Height="53px" OnClick="btnSubmit_Click" Text="Submit" Width="277px" TabIndex="4" />
&nbsp;
                    <asp:Button ID="btnReturnDashboard" runat="server" BackColor="#33CC33" BorderColor="Black" BorderStyle="Double" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" Height="53px" OnClick="btnReturnDashboard_Click" Text="Return to Dashboard" Width="277px" TabIndex="5" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style9" colspan="2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style21">
                    &nbsp;</td>
                <td class="auto-style9" colspan="2">
                    <asp:Label ID="lblDate" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" Visible="False"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblPage" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" Visible="False">Page: 1</asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style14" colspan="2">
                    <asp:Label ID="lblReportTitle" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" Visible="False">Bank Statement for </asp:Label>
&nbsp;<asp:Label ID="lblPeriod" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" Visible="False"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style15" colspan="2">
                    <asp:Label ID="lblOrderByTitle" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" Visible="False">ordered by </asp:Label>
&nbsp;<asp:Label ID="lblOrder" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" Visible="False"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style15" colspan="2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style9" colspan="2">
                    <table style="width:100%;">
                        <tr>
                            <td>&nbsp;</td>
                            <td class="auto-style20">
                                <asp:GridView ID="gridViewData" runat="server" BackColor="White" Height="342px" Visible="False" Width="670px">
                                </asp:GridView>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style14" colspan="2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style14" colspan="2">
                    <asp:Label ID="lblPageEnd" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" Visible="False">Page 1 of 1</asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
