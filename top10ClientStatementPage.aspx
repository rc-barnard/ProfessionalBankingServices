<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="top10ClientStatementPage.aspx.cs" Inherits="_45096600_Individual_Webpages.top10ClientStatementPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="background-image: url('Properties/banking.jpg'); background-repeat: no-repeat; background-attachment: fixed">
<head runat="server">
    <title>Top 10 Client Statement</title>
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
            .auto-style24 {
            width: 307px;
        }
        .auto-style26 {
            width: 44px;
        }
        .auto-style25 {
            width: 311px;
        }
        .auto-style27 {
            width: 307px;
            text-align: right;
        }
        .auto-style28 {
            text-align: left;
        }
        .auto-style34 {
            width: 324px;
            text-align: right;
        }
        .auto-style35 {
            width: 650px;
        }
        .auto-style29 {
            width: 324px;
        }
        .auto-style33 {
            width: 650px;
            text-align: right;
        }
        .auto-style20 {
            width: 580px;
        }
        .auto-style36 {
            width: 451px;
        }
        .auto-style37 {
            width: 580px;
            text-align: left;
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
                <td class="auto-style7">
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="False" Font-Size="30pt" Text="Access top 10 client statement here, " Font-Names="Garamond" ForeColor="White"></asp:Label>
                    <asp:Label ID="lblUsersName" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="30pt" ForeColor="White"></asp:Label>
                    <br />
                    <br />
                    <table style="width:100%;">
                        <tr>
                            <td>&nbsp;</td>
                            <td rowspan="3">
                                <table style="width:100%;">
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td class="auto-style24">
                                            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" Text="Select starting period:"></asp:Label>
                                        </td>
                                        <td class="auto-style26">&nbsp;</td>
                                        <td class="auto-style25">
                                            <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" Text="Select ending period:"></asp:Label>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td class="auto-style24">&nbsp;</td>
                                        <td class="auto-style26">&nbsp;</td>
                                        <td class="auto-style25">&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td class="auto-style24">
                                            <asp:Calendar ID="calenderStart" runat="server" BackColor="#CCCCCC"></asp:Calendar>
                                        </td>
                                        <td class="auto-style26">&nbsp;</td>
                                        <td class="auto-style25">
                                            <asp:Calendar ID="calenderEnd" runat="server" BackColor="#CCCCCC" TabIndex="1"></asp:Calendar>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td class="auto-style24">&nbsp;</td>
                                        <td class="auto-style26">&nbsp;</td>
                                        <td class="auto-style25">&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td class="auto-style27">
                    <asp:Label ID="lblOrderBy" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt">Order by:</asp:Label>
                                        </td>
                                        <td class="auto-style28" colspan="2">
                    <asp:DropDownList ID="dropListOrderBy" runat="server" Width="210px" TabIndex="2">
                        <asp:ListItem>Number of transactions Ascending</asp:ListItem>
                        <asp:ListItem>Number of transactions Descending</asp:ListItem>
                    </asp:DropDownList>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td class="auto-style27">
                    <asp:Label ID="lblEmail" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt">Send a copy to my email:</asp:Label>
                                        </td>
                                        <td class="auto-style28" colspan="2">
                    <asp:CheckBox ID="CheckBoxYes" runat="server" OnCheckedChanged="CheckBoxYes_CheckedChanged" Text="Yes" TabIndex="3" />
&nbsp;
                    <asp:CheckBox ID="CheckBoxNo" runat="server" OnCheckedChanged="CheckBoxYes_CheckedChanged" Text="No" TabIndex="4" />
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td class="auto-style27">&nbsp;</td>
                                        <td class="auto-style28" colspan="2">&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td class="auto-style27">
                    <asp:Button ID="btnSubmit" runat="server" BackColor="#33CC33" BorderColor="Black" BorderStyle="Double" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" Height="53px" OnClick="btnSubmit_Click" Text="Submit" Width="277px" TabIndex="5" />
                                        </td>
                                        <td class="auto-style28" colspan="2">
                    <asp:Button ID="btnReturnDashboard" runat="server" BackColor="#33CC33" BorderColor="Black" BorderStyle="Double" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" Height="53px" OnClick="btnReturnDashboard_Click" Text="Return to Request Reports" Width="277px" TabIndex="6" />
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td class="auto-style27">&nbsp;</td>
                                        <td class="auto-style28" colspan="2">&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td class="auto-style27">&nbsp;</td>
                                        <td class="auto-style28" colspan="2">&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                </table>
                                <table style="width:100%;">
                                    <tr>
                                        <td class="auto-style34">
                    <asp:Label ID="lblDate" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" Visible="False"></asp:Label>
                                        </td>
                                        <td class="auto-style35">&nbsp;</td>
                                        <td>
                    <asp:Label ID="lblPage" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" Visible="False">Page: 1</asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style29">&nbsp;</td>
                                        <td class="auto-style35">
                    <asp:Label ID="lblReportTitle" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" Visible="False">Top 10 Client Statement from </asp:Label>
                                            <asp:Label ID="lblStartPeriod" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" Visible="False"></asp:Label>
                &nbsp;<asp:Label ID="lblReportTitle0" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" Visible="False">to</asp:Label>
&nbsp;<asp:Label ID="lblEndPeriod" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" Visible="False"></asp:Label>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style29">&nbsp;</td>
                                        <td class="auto-style33">
                    <asp:Label ID="lblOrderByTitle" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" Visible="False">ordered by </asp:Label>
&nbsp;<asp:Label ID="lblOrder" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" Visible="False"></asp:Label>
                                        </td>
                                        <td class="auto-style28">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style29">&nbsp;</td>
                                        <td class="auto-style35">&nbsp;</td>
                                        <td class="auto-style28">&nbsp;</td>
                                    </tr>
                                </table>
                    <table style="width:100%;">
                        <tr>
                            <td class="auto-style36">&nbsp;</td>
                            <td class="auto-style37">
                                <asp:GridView ID="gridViewData" runat="server" BackColor="White" Height="171px" Visible="False" Width="472px">
                                </asp:GridView>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style36">&nbsp;</td>
                            <td class="auto-style20">
                                &nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style36">&nbsp;</td>
                            <td class="auto-style20">
                    <asp:Label ID="lblPageEnd" runat="server" Font-Bold="True" Font-Names="Garamond" Font-Size="13pt" Visible="False">Page 1 of 1</asp:Label>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                                <br />
                                <br />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
