<%@ Page Title="" Language="C#" MasterPageFile="~/Lemon.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="OluWebsite.Admin.AddProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
    .auto-style1 {
        width: 101px;
    }
    .auto-style2 {
        width: 101px;
        height: 22px;
    }
    .auto-style3 {
        height: 22px;
    }
    .auto-style4 {
        width: 210px;
    }
    .auto-style5 {
        height: 22px;
        width: 210px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
    <br />
    <asp:Label ID="LblMessage" runat="server" Text="Fill in the form below"></asp:Label>
</p>
<table class="mainMenuWidth">
    <tr>
        <td class="auto-style1" style="font-weight: bold">Product Name*:</td>
        <td class="auto-style4">
            <asp:TextBox ID="TxtName" runat="server"></asp:TextBox>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style1" style="font-weight: bold">Description:</td>
        <td class="auto-style4">
            <asp:TextBox ID="TxtDescription" runat="server" Height="72px" TextMode="MultiLine"></asp:TextBox>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style1" style="font-weight: bold">Price:</td>
        <td class="auto-style4">
            <asp:TextBox ID="TxtPrice" runat="server"></asp:TextBox>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style1" style="font-weight: bold">Image:</td>
        <td class="auto-style4">
            <asp:FileUpload ID="FileUploadImage" runat="server" />
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style2" style="font-weight: bold">Stock:</td>
        <td class="auto-style5">
            <asp:TextBox ID="TxtStock" runat="server" TextMode="Number"></asp:TextBox>
        </td>
        <td class="auto-style3"></td>
    </tr>
    <tr>
        <td class="auto-style1" style="font-weight: bold">&nbsp;</td>
        <td class="auto-style4">
            <asp:Button ID="BtnAddProduct" runat="server" OnClick="BtnAddProduct_Click" Text="Add Product" />
        </td>
        <td>&nbsp;</td>
    </tr>
</table>
</asp:Content>
