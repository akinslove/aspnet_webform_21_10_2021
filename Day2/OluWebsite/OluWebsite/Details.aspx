<%@ Page Title="Details" Language="C#" MasterPageFile="~/Lemon.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="OluWebsite.Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-left: 40px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <p>
        <asp:Label ID="LblMessage" runat="server"></asp:Label>
        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="pid" DataSourceID="SqlDataSource1" EmptyDataText="No product found" Height="50px" Width="125px">
            <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" AlternateText='<%# Eval("pimage") %>' Width="500px" Height="500px" ImageUrl='<%# "~/ProductImages/" +  Eval("pimage") %>' />
                        <br />
                        <asp:Label ID="Label1" runat="server" CssClass="productName" Text='<%# Eval("pname") %>'></asp:Label>
                        <br />
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("pdescription") %>'></asp:Label>
                        <br />
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("pprice", "{0:C}") %>'></asp:Label>
                        <br />
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("stock") %>'></asp:Label>
                        &nbsp;available<br />
                        <asp:ImageButton ID="ImgBtnAddToBasket" runat="server" CommandArgument='<%# Eval("pid") %>' ImageUrl="~/ProductImages/addtobasket.jpg" OnClick="ImgBtnAddToBasket_Click" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Fields>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OluSiteDbConnectionString %>" SelectCommand="SELECT * FROM [products] WHERE ([pid] = @pid)">
            <SelectParameters>
                <asp:QueryStringParameter Name="pid" QueryStringField="pid" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>

</asp:Content>
