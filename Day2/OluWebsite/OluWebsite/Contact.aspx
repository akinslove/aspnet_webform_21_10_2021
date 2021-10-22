<%@ Page Title="Contact us page" Language="C#" MasterPageFile="~/Lemon.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="OluWebsite.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            width: 69px;
        }

        .auto-style3 {
            width: 69px;
            height: 22px;
        }

        .auto-style4 {
            height: 22px;
        }

        .red {
            color: #ff0000;
        }

        .auto-style5 {
            height: 22px;
            width: 309px;
        }

        .auto-style6 {
            width: 309px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Label ID="LblMessage" runat="server" Text="Please fill the form below"></asp:Label>
    <br />
    <table class="auto-style1">
        <tr>
            <td class="auto-style3" style="font-weight: bold">Name<span class="red">*</span>:</td>
            <td class="auto-style5">
                <asp:TextBox ID="TxtName" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style4"></td>
        </tr>
        <tr>
            <td class="auto-style2" style="font-weight: bold">Email:</td>
            <td class="auto-style6">
                <asp:TextBox ID="TxtEmail" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3" style="font-weight: bold">Subject:</td>
            <td class="auto-style5">
                <asp:DropDownList ID="DdlSubject" runat="server">
                    <asp:ListItem Selected="True">Business</asp:ListItem>
                    <asp:ListItem>Personal</asp:ListItem>
                    <asp:ListItem>Others</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style4"></td>
        </tr>
        <tr>
            <td class="auto-style2" style="font-weight: bold">Message:</td>
            <td class="auto-style6">
                <asp:TextBox ID="TxtMessage" runat="server" Height="142px" TextMode="MultiLine" Width="226px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2" style="font-weight: bold">&nbsp;</td>
            <td class="auto-style6">
                <asp:Button ID="BtnContactUs" runat="server" Text="Contact us" OnClick="BtnContactUs_Click" />
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
