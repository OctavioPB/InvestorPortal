<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PurchaseForm.aspx.cs" Inherits="PurchaserPortal1.PurchaseForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/deskapp2.css" rel="stylesheet" />
    <script src="Scripts/Deskapp/script.js"></script>
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
    

<div class="alert alert-danger" role="alert" style="position:fixed; width:30%; top: 55px;
  left: 0;
  right: 0;
  z-index: +1;" >
  You have a pending payment
</div >
	<div style="height:70px;">

	</div>
<form id="form2" runat="server">
	<div class="container" style="background-color:#fff; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); border-radius: 20px; padding-bottom:25px;">
        <h1 style="text-align:center;"><br /><asp:Label ID="Label1" runat="server" Text="Get the Project"></asp:Label><br /></h1>
		<br />
<%--		<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label><br />
		<br />
		<asp:Label ID="Label3" runat="server" Text="Label"></asp:Label><br />--%>
<%--		<br />--%>
	<div class="form-group row" >
		<label class="col-sm-12 col-md-2 col-form-label">Project Name</label>
		<div class="col-sm-12 col-md-10">
			<input class="form-control" type="text" value="Lux Art Institute" id="projectName" runat="server"/>
		</div>
	</div>
	<div class="form-group row" >
		<label class="col-sm-12 col-md-2 col-form-label">Project ID</label>
		<div class="col-sm-12 col-md-10">
			<input class="form-control" type="text" value="485" id="pID" runat="server"/>
		</div>
	</div>
	<div class="form-group row">
		<label class="col-sm-12 col-md-2 col-form-label">Location</label>
		<div class="col-sm-12 col-md-10">
			<input class="form-control" value="Encinitas, CA" type="text" id="location" runat="server"/>
		</div>
	</div>
	<div class="form-group row">
		<label class="col-sm-12 col-md-2 col-form-label">Deal Type</label>
		<div class="col-sm-12 col-md-10">
			<input class="form-control" value="PPA" type="text" id="dType" runat="server"/>
		</div>
	</div>
	<div class="form-group row">
		<label class="col-sm-12 col-md-2 col-form-label">Bussiness Type</label>
		<div class="col-sm-12 col-md-10">
			<input class="form-control" value="Commercial" type="text" id="bType" runat="server"/>
		</div>
	</div>
	<div class="form-group row">
		<label class="col-sm-12 col-md-2 col-form-label">Purchase Value</label>
		<div class="col-sm-12 col-md-10">
			<input class="form-control" value="220,115 $" type="text" id="purchaseValue" runat="server"/>
		</div>
	</div>
	<div class="form-group row">
		<label class="col-sm-12 col-md-2 col-form-label">ITC Value</label>
		<div class="col-sm-12 col-md-10">
			<input class="form-control" value="81,442 $" type="text" id="itcValue" runat="server"/>
		</div>
	</div>
<%--	<div class="form-group row">
		<label class="col-sm-12 col-md-2 col-form-label">Telephone</label>
		<div class="col-sm-12 col-md-10">
			<input class="form-control" value="1-(111)-111-1111" type="tel"/>
		</div>
	</div>
	<div class="form-group row">
		<label class="col-sm-12 col-md-2 col-form-label">Password</label>
		<div class="col-sm-12 col-md-10">
			<input class="form-control" value="password" type="password"/>
		</div>
	</div>--%>
<%--	<div class="form-group row">
		<label class="col-sm-12 col-md-2 col-form-label">Number</label>
		<div class="col-sm-12 col-md-10">
			<input class="form-control" value="100" type="number"/>
		</div>
	</div>--%>
		<br />
		<h1 style="text-align:center;">Schedule a call<br /><br /></h1>
<%--	<div class="form-group row">
		<label for="example-datetime-local-input" class="col-sm-12 col-md-2 col-form-label">Date and time</label>
		<div class="col-sm-12 col-md-10">
			<input class="form-control datetimepicker" placeholder="Choose Date anf time" type="text"/>
		</div>
	</div>--%>
	<div class="form-group row">
		<label class="col-sm-12 col-md-2 col-form-label">Date</label>
		<div class="col-sm-12 col-md-10">
			<input class="form-control date-picker" placeholder="Select Date" type="text" runat="server"/>
		</div>
	</div>
<%--	<div class="form-group row">
		<label class="col-sm-12 col-md-2 col-form-label">Month</label>
		<div class="col-sm-12 col-md-10">
			<input class="form-control month-picker" placeholder="Select Month" type="text"/>
		</div>
	</div>--%>
	<div class="form-group row">
		<label class="col-sm-12 col-md-2 col-form-label">Time</label>
		<div class="col-sm-12 col-md-10">
			<input class="form-control time-picker td-input" placeholder="Select time" type="text" readonly="" runat="server"/>
		</div>
        <br />
		<br />
		<br />
		<div class="container" style="max-width:75%; text-align:center; align-content:center; align-self:center;" >
        <asp:Button ID="submit" runat="server" Text="Submit" style="text-align:center; width:65%; background-color: #205928; border-color:#084012" class="btn btn-primary btn-lg" />
		</div>
		<br /><br />
	</div>
</div>
    </form>
             <footer>
                        <hr />
                &nbsp;&nbsp;
                <%--<img src="Images/facebook.png" Style="width:25px;" />--%>
                <%--<asp:ImageButton ID="ImageButton1" runat="server" PostBackUrl="https://www.facebook.com/Greenpacecapital/" ImageUrl="~/Images/facebook.png" Style="width:25px;"  />--%>
                <%--<img src="Images/linkedin.png" Style="width:25px;" />--%>
                &nbsp;&nbsp;
                <%--<asp:ImageButton ID="ImageButton2" runat="server" PostBackUrl="https://www.linkedin.com/company/greenpacecapital" ImageUrl="~/Images/linkedin.png" Style="width:25px;"  />--%>
<%--                <br />
                <p>&copy; <%: DateTime.Now.Year %> - GreenPACE Capital</p>--%>
            </footer>
</body>
</html>
