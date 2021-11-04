<%@ Page Title="About" Language="C#" MasterPageFile="~/Lemon.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="OluWebsite.About" %>

<asp:Content ContentPlaceHolderID="HeadContent" runat="server">
    <script src="Scripts/jquery-3.4.1.min.js"></script>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Products</h2>

    <table>
        <thead>
            <tr>
                <th>Name</th>
                <th>Description</th>
                <th>Price</th>
                <th>Stock</th>
            </tr>
        </thead>
        <tbody id="products">

        </tbody>
    </table>
  
    <h2>Find us at 5 bla bla road, london e16 8yy</h2>
    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d317718.69319292053!2d-0.3817765050863085!3d51.528307984912544!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47d8a00baf21de75%3A0x52963a5addd52a99!2sLondon!5e0!3m2!1sen!2suk!4v1634928043677!5m2!1sen!2suk" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>


    <script type="text/javascript">

        $(function () {
            $.getJSON("api/product",
                function (data) {
                    $('#products').empty();

                    //loop
                    $.each(data, function (key, val) {
                        //add row
                        var row = '<td>' + val.Pname + '</td><td>' + val.Pdescription + '</td>';

                        $('<tr />', { html: row }).appendTo($('#products'));
                    });
                })
        });
    </script>
</asp:Content>
