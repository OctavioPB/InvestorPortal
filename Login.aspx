<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PurchaserPortal1.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <title></title>
    <script src="Scripts/Deskapp/script.js"></script>
    <link href="Content/style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <br />
        <br />
        <div class="container" style="max-width:75%; text-align:center; align-content:center; align-self:center; 
            background-color:lightgray; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); border-radius: 20px; padding-bottom:35px;">
            <img src="Images/GPC_logo_black.png" style="width:40%" />
            <br /> 
            <br />
            <asp:Label ID="Label1" runat="server" Text="USER" Font-Bold="True" Font-Size="X-Large"></asp:Label>
            <br />
            <asp:TextBox ID="user" runat="server" Width="320px" TextMode="Email" Height="35px" style="border-radius:10px;" CssClass="form-control-lg"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="PASSWORD" Font-Bold="True" Font-Size="X-Large"></asp:Label>
            <br />
            <asp:TextBox ID="pass" runat="server"  TextMode="Password" Height="35px" Width="320px" style="border-radius:10px;" CssClass="form-control-lg" ></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="XX-Large" Font-Strikeout="False" ></asp:Label>
            <br />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" CssClass="btn-lg" Text="Log in" style="color: #FFFFFF; font-weight: bold; background-color: #205928; border-radius:15px;" Height="74px" OnClick="Button1_Click" Width="167px" />
            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
