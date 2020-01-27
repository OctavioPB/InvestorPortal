<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminView.aspx.cs" Inherits="PurchaserPortal1.AdminView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/style.css" rel="stylesheet" />
    <script src="Scripts/Deskapp/script.js"></script>
    <title>Admin</title>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="position:fixed; width:100%; z-index: +1;">
  <a class="navbar-brand" href="PurchaserPortal.aspx">Purchaser Portal</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>x
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
		<br />
		<br />
		<br />

<div class="container" style="max-width:75%; align-content:center; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
align-self:center; padding-top:25px; background-color:#fff;">
    

    <div class="form-group">
		<label>Purchaser Name</label>
		<asp:DropDownList ID="purchaser" runat="server"></asp:DropDownList>
		<input class="form-control" type="text" placeholder="Andrew Gold"/>
	</div>
	<div class="form-group">
		<label>Purchaser Probability</label>
		<input class="form-control" value="" type="text"/>
	</div>
	<div class="form-group">
		<label>Email</label>
		<input class="form-control" value="" type="email"/>
	</div>
	<div class="form-group">
		<label>Telephone</label>
		<input class="form-control" value="1-(111)-111-1111" type="tel"/>
	</div>
	<div class="form-group">
		<label>Entity</label>
		<input class="form-control" type="text" placeholder=""/>
	</div>

<div class="row">
<div class="col-md-6 col-sm-12">

	<div class="form-group">
		<label>Purchase Amount</label>
		<input class="form-control" value="" type="text"/>
</div>
	<div class="form-group">
		<label>Cash Amount</label>
		<input class="form-control" type="text" placeholder=""/>
	</div>
		<div class="form-group">
		<label>Allocated ITC</label>
		<input class="form-control" type="text" placeholder=""/>
</div>
</div>
<div class="col-md-4 col-sm-12">

	<div class="form-group">
		<label>Pending ITC to Allocate</label>
		<input class="form-control" type="text" plac3eholder=""/>
</div>

	<div class="form-group">
		<label>Weighted Avg. Unallocated ITC</label>
		<input class="form-control" type="text" placeholder=""/>
	</div>
	</div>
	</div>
	<br />
	<div class="form-group">
		<br />
		<div class="row">
			<br />
			<div class="col-md-6 col-sm-12">
				<label class="weight-600">Banners</label>
				<div class="custom-control custom-checkbox mb-5">
					<input type="checkbox" class="custom-control-input" id="customCheck1-1"/>
					<label class="custom-control-label" for="customCheck1-1">Payment Pending</label>
				</div>
				<div class="custom-control custom-checkbox mb-5">
					<input type="checkbox" class="custom-control-input" id="customCheck2-1"/>
					<label class="custom-control-label" for="customCheck2-1">Documents Pending</label>
				</div>
				<div class="custom-control custom-checkbox mb-5">
					<input type="checkbox" class="custom-control-input" id="customCheck3-1"/>
					<label class="custom-control-label" for="customCheck3-1">Call Scheduled</label>
				</div>
				<div class="custom-control custom-checkbox mb-5">
					<input type="checkbox" class="custom-control-input" id="customCheck4-1"/>
					<label class="custom-control-label" for="customCheck4-1">Check this custom checkbox</label>
				</div>
			</div>
		</div>
	<div class="form-group">
<input type="file" class="form-control-file form-control height-auto"/>
	</div>
	<div class="form-group">
		<label>Custom file input</label>

</div>
        </div>
	</div>
    </form>
</body>
</html>
