<%@ Page Title="Edit Product" Language="C#" MasterPageFile="~/Lemon.Master" AutoEventWireup="true" CodeBehind="EditProduct.aspx.cs" Inherits="OluWebsite.Admin.EditProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>Select the product to edit</div>
    <asp:DropDownList ID="DdlProducts" runat="server" DataSourceID="SqlDataSource1" DataTextField="pname" DataValueField="pid" AutoPostBack="True" OnSelectedIndexChanged="DdlProducts_SelectedIndexChanged"></asp:DropDownList>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OluSiteDbConnectionString %>" SelectCommand="SELECT [pid], [pname] FROM [products]"></asp:SqlDataSource>

    <div>Product Selected</div>
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" AutoGenerateRows="False" DataKeyNames="pid" DataSourceID="SqlDataSource2" EmptyDataText="No product selected">
        <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        <Fields>
            <asp:BoundField DataField="pid" HeaderText="pid" InsertVisible="False" ReadOnly="True" SortExpression="pid" />
            <asp:BoundField DataField="pname" HeaderText="pname" SortExpression="pname" />
            <asp:BoundField DataField="pdescription" HeaderText="pdescription" SortExpression="pdescription" />
            <asp:BoundField DataField="pprice" HeaderText="pprice" SortExpression="pprice" />
            <asp:BoundField DataField="pimage" HeaderText="pimage" SortExpression="pimage" />
            <asp:BoundField DataField="stock" HeaderText="stock" SortExpression="stock" />
        </Fields>
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:OluSiteDbConnectionString %>" SelectCommand="SELECT * FROM [products] WHERE ([pid] = @pid)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DdlProducts" Name="pid" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    Product name: <asp:TextBox ID="TxtProductName" runat="server"></asp:TextBox>
</asp:Content>
