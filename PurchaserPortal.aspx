<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PurchaserPortal.aspx.cs" Inherits="PurchaserPortal1.PurchaserPortal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <%--<link href="Content/bootstrap2.css" rel="stylesheet" />--%>
    <%--<link href="Content/deskapp2.css" rel="stylesheet" />--%>
    <link href="Content/style.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="position:fixed; width:100%; z-index: +1;">
  <a class="navbar-brand" href="PurchaserPortal.aspx">Purchaser Portal</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarText">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="PurchaserPortal.aspx">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="PurchaserDashboard.aspx">Dashboard</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="Projects.aspx">Projects</a>
      </li>
    </ul>
    <span class="navbar-text">
      GreenPACE Capital
    </span>
  </div>
</nav>
    <form id="form1" runat="server">

<div class="alert alert-danger" role="alert" style="position:fixed; width:30%; top: 55px;
  left: 0;
  right: 0;
  z-index: +1;" >
  You have a pending payment
</div>
<div class="alert alert-warning" role="alert" style="position:absolute; width:30%; top: 105px;">
  You have a pending document to upload
</div>
        <%--Inicio--%>
        <%--Carousel--%>
<div class="container" style="text-align:center; align-content:center; align-self:center; text-align:center">
    <br /><br />
    <img src="Images/GPC_logo_black.png" class="img-fluid" style="max-height:180px"/>
    <h2>Welcome <asp:Label ID="name" runat="server" Text=""></asp:Label></h2><br />
</div>
        <%--Carousel End--%>
        <%--Cards--%>

        <div class="container" style="max-width:75%; align-content:center; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); align-self:center; padding-top:25px;">
<div class="alert alert-success" style="text-align:center;" <%--style="padding-bottom:0px"--%>>
  <strong>New projects are available for you</strong> Take action before someone else take these deals.<br />
</div>
            <div class="card-group">
  <div class="card">
      <br />
    <img src="Images/solar4.jpg" class="card-img-top" style="width:400px; height:200px; text-align:center; align-items:center; align-self:center;"/>
    <div class="card-body">
      <h5 class="card-title" style="text-align:center;">Project 485</h5>
      <p class="card-text">
          <b>Project Name:</b> Lux Art Institute <br />
          <b>Project Type:</b> PPA<br />
          <b>Location:</b> Encinitas, CA<br />
          <b>ITC Value:</b> 81,442 $<br />
      </p>
        <div style="text-align:center;">
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Get It" style="background-color: #205928; color: #FFFFFF; text-align:center; font-weight: bold" class="btn btn-default"/>
    </div>
    </div>
    <div class="card-footer">
      <small class="text-muted">Last updated <%: DateTime.Today.ToShortDateString() %></small>
    </div>
  </div>
  <div class="card">
      <br />
    <img src="Images/solar5.jpg" class="card-img-top" style="width:400px; height:200px; text-align:center; align-items:center; align-self:center;"/>
    <div class="card-body">
      <h5 class="card-title" style="text-align:center;">Project 462</h5>
      <p class="card-text">          
          
          <b>Project Name:</b> First Baptist Church of Chula Vista<br />
          <b>Project Type:</b> PPA<br />
          <b>Location:</b> Chula Vista, CA<br />
          <b>ITC Value:</b> 35,287 $ <br />

      </p>

        <div style="text-align:center;">
        <asp:Button ID="Button2" runat="server" Text="Get It" style="background-color: #205928; color: #FFFFFF; text-align:center; font-weight: bold" class="btn btn-default" OnClick="Button2_Click" />
    </div>
    </div>  
    <div class="card-footer">
      <small class="text-muted">Last updated <%: DateTime.Today.ToShortDateString() %></small>
    </div>
  </div>
  <div class="card">
      <br />
    <img src="Images/solar6.jpg" class="card-img-top" style="width:400px; height:200px; text-align:center; align-items:center; align-self:center;"/>
    <div class="card-body">
      <h5 class="card-title" style="text-align:center;">Project 468</h5>
      <p class="card-text">
          <b>Project Name:</b> New Life Community Adventist Church<br />
          <b>Project Type:</b> Prepay<br />
          <b>Location:</b> Napa<br />
          <b>ITC Value:</b> 10,860 $<br />

      </p>

        <div style="text-align:center;">
        <asp:Button ID="Button3" runat="server" Text="Get It" style="background-color: #205928; color: #FFFFFF; text-align:center; font-weight: bold" class="btn btn-default" OnClick="Button3_Click"/>
    </div>
        </div>
    <div class="card-footer">
      <small class="text-muted">Last updated <%: DateTime.Today.ToShortDateString() %></small>
    </div>
  </div>
</div>
    <%--Cards end--%>
            <br />
            <br />
                <div class="row" style="text-align:center;">
        <div class="col-md-4" style="text-align: center;">
            <h2>Purchaser Portal</h2>
            <br/>
            <img src="Images/save-money.png" style="width: 20%;" />
            <br/><br/>
            <p>
                Welcome to GreenPACE Capital Purchaser Portal
            </p>
            <p>
                <br/>
                <a class="btn btn-default" href="PurchaseForm.aspx" 
                   style="background-color: #205928; color: #FFFFFF; font-weight: bold">Upload documentation &raquo;</a>
            </p>
            </div>
        <div class="col-md-4" style="text-align:center;">
            <h2>Get more Projects</h2>
            <br/>
            <img src="Images/dollar.png" style="width:20%;" />
            <br/><br/>
            <p>
                Look into GreenPACE Capital aviable projects for purchase
            </p>
            <br>
            <%--<img src="Images/money.png" />--%>
            <p>
                <a class="btn btn-default" href="PurchaseForm.aspx" 
                   style="background-color: #205928; color: #FFFFFF; font-weight: bold">See Aviable Projects &raquo;</a>
            </p>
        </div>
        <div class="col-md-4" style="text-align:center;">
            <h2>View important dates and messages</h2>
            <img src="Images/calendar.png" style="width:20%;" />
            <br/><br/>
            <%--<img src="Images/email.png" />--%>
            <p>
                You can now look into the status of your projects in real time
            </p>
            <br/>
            <p>
                <a class="btn btn-default" href="PurchaserDashboard.aspx" 
                   style="color: #FFFFFF; font-weight: bold; background-color: #205928">Learn more &raquo;</a>
            </p>
        </div>
    </div>
        </div>
        <br />
        <br />
                    <footer>
                        <hr />
                &nbsp;&nbsp;
                <%--<img src="Images/facebook.png" Style="width:25px;" />--%>
                <asp:ImageButton ID="ImageButton1" runat="server" PostBackUrl="https://www.facebook.com/Greenpacecapital/" ImageUrl="~/Images/facebook.png" Style="width:25px;"  />
                <%--<img src="Images/linkedin.png" Style="width:25px;" />--%>
                &nbsp;&nbsp;
                <asp:ImageButton ID="ImageButton2" runat="server" PostBackUrl="https://www.linkedin.com/company/greenpacecapital" ImageUrl="~/Images/linkedin.png" Style="width:25px;"  />
                <br />
                <p>&copy; <%: DateTime.Now.Year %> - GreenPACE Capital</p>
            </footer>
    </form>
</body>
</html>
