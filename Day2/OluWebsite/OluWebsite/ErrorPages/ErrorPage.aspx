<%@ Page Title="All Errors" Language="C#" MasterPageFile="~/Lemon.Master" AutoEventWireup="true" CodeBehind="ErrorPage.aspx.cs" Inherits="OluWebsite.ErrorPages.ErrorPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Oops a bad error occured, pls contact IT Support</h2>

    <p><%= Server.GetLastError() %></p>
</asp:Content>
