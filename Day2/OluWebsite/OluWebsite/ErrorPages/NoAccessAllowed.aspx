<%@ Page Title="NoAccess" Language="C#" MasterPageFile="~/Lemon.Master" AutoEventWireup="true" CodeBehind="NoAccessAllowed.aspx.cs" Inherits="OluWebsite.ErrorPages.NoAccessAllowed" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>You are not allowed to view this page</h2>
    <p><a href="~/Account/Login" runat="server">Login</a></p>
</asp:Content>
