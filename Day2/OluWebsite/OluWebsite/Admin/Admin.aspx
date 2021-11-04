<%@ Page Title="Admin" Language="C#" MasterPageFile="~/Lemon.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="OluWebsite.Admin.Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>All Products</div>
    <div>Exercise: Create a search field that filters product displayed below<br />
        <asp:TextBox ID="TxtProductName" runat="server" AutoPostBack="True" OnTextChanged="TxtProductName_TextChanged"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Search" />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="pid" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="pid" HeaderText="pid" InsertVisible="False" ReadOnly="True" SortExpression="pid" />
                <asp:BoundField DataField="pname" HeaderText="pname" SortExpression="pname" />
                <asp:BoundField DataField="pdescription" HeaderText="pdescription" SortExpression="pdescription" />
                <asp:BoundField DataField="pprice" HeaderText="pprice" SortExpression="pprice" />
                <asp:BoundField DataField="pimage" HeaderText="pimage" SortExpression="pimage" />
                <asp:BoundField DataField="stock" HeaderText="stock" SortExpression="stock" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OluSiteDbConnectionString %>" DeleteCommand="DELETE FROM [products] WHERE [pid] = @pid" InsertCommand="INSERT INTO [products] ([pname], [pdescription], [pprice], [pimage], [stock]) VALUES (@pname, @pdescription, @pprice, @pimage, @stock)" SelectCommand="SELECT * FROM [products]" UpdateCommand="UPDATE [products] SET [pname] = @pname, [pdescription] = @pdescription, [pprice] = @pprice, [pimage] = @pimage, [stock] = @stock WHERE [pid] = @pid">
            <DeleteParameters>
                <asp:Parameter Name="pid" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="pname" Type="String" />
                <asp:Parameter Name="pdescription" Type="String" />
                <asp:Parameter Name="pprice" Type="Decimal" />
                <asp:Parameter Name="pimage" Type="String" />
                <asp:Parameter Name="stock" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="pname" Type="String" />
                <asp:Parameter Name="pdescription" Type="String" />
                <asp:Parameter Name="pprice" Type="Decimal" />
                <asp:Parameter Name="pimage" Type="String" />
                <asp:Parameter Name="stock" Type="Int32" />
                <asp:Parameter Name="pid" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>

    </asp:Content>
