<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Lemon.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="OluWebsite._Default" %>

<asp:Content ID="head" ContentPlaceHolderID="HeadContent" runat="server">

    </asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Label ID="LblMessage" runat="server" Text="Our products"></asp:Label>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="pid" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:TemplateField HeaderText="Products on sale">
                <ItemTemplate>
                    <table class="mainMenuWidth">
                        <tr>
                            <td>
                                <br />
                                <asp:Image ID="Image1" runat="server" AlternateText='<%# Eval("pimage") %>' Height="143px" ImageUrl='<%# "~/ProductImages/" + Eval("pimage") %>' Width="130px" />
                            </td>
                            <td>
                                <br />
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("pname") %>' CssClass="productName"></asp:Label>
                                <br />
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("pdescription") %>'></asp:Label>
                                <br />
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("pprice", "{0:C}") %>'></asp:Label>
                                <br />
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("stock") %>'></asp:Label>
                                &nbsp;available<br />
                                <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl='<%# "~/Details?pid=" + Eval("pid") %>'>View more</asp:LinkButton>
                                <br />
                                <asp:ImageButton ID="ImgBtnAddToBasket" runat="server" CommandArgument='<%# Bind("pid") %>' ImageUrl="~/ProductImages/addtobasket.jpg" OnClick="ImgBtnAddToBasket_Click" />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FFF1D4" />
        <SortedAscendingHeaderStyle BackColor="#B95C30" />
        <SortedDescendingCellStyle BackColor="#F1E5CE" />
        <SortedDescendingHeaderStyle BackColor="#93451F" />
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OluSiteDbConnectionString %>" SelectCommand="SELECT * FROM [products]"></asp:SqlDataSource>
</asp:Content>
