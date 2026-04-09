<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error.aspx.cs"
         Inherits="InvestorPortal.ErrorPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>OPB Capital — Error</title>
    <link href="~/Content/style.css" rel="stylesheet" />
    <link href="~/Content/opb-brand.css" rel="stylesheet" />
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="position:fixed; width:100%; z-index:1;">
        <a class="navbar-brand" href="~/Pages/PurchaserPortal.aspx">OPB Capital</a>
    </nav>

    <div style="height:80px;"></div>

    <div class="container" style="max-width:600px; text-align:center; padding:60px 20px;">
        <img src="../Images/opb_logo.png" class="img-fluid" style="max-height:100px; margin-bottom:30px;" />
        <h2 style="color:#003366;">Something went wrong</h2>
        <p class="text-muted" style="font-size:1.1rem; margin:20px 0;">
            An unexpected error occurred. Please try again or contact support if the problem persists.
        </p>
        <a href="PurchaserPortal.aspx" class="btn btn-primary"
           style="background-color:#003366; border-color:#002244;">
            Return to Portal
        </a>
        &nbsp;
        <a href="mailto:info@opbcapital.com" class="btn btn-outline-secondary">
            Contact Support
        </a>
    </div>

    <footer style="text-align:center; margin-top:60px;">
        <hr />
        <p>&copy; <%: DateTime.Now.Year %> - OPB Capital</p>
    </footer>
</body>
</html>
