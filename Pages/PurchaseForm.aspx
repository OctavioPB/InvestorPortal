<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PurchaseForm.aspx.cs"
         Inherits="InvestorPortal.PurchaseForm" MasterPageFile="~/Site.Master" %>

<asp:Content ID="head" ContentPlaceHolderID="head" runat="server">
    <title>OPB Capital — Detalle de Proyecto</title>
    <link href="~/Content/deskapp2.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

<asp:Panel ID="pnlPaymentAlert" runat="server" Visible="false"
    CssClass="alert alert-danger"
    style="position:fixed; width:30%; top:55px; left:0; right:0; z-index:1;">
    You have a pending payment.
</asp:Panel>

<div style="height:70px;"></div>

<div class="container" style="background-color:#fff; box-shadow: 0 4px 8px 0 rgba(0,0,0,.2), 0 6px 20px 0 rgba(0,0,0,.19); border-radius:20px; padding-bottom:25px;">
    <h1 style="text-align:center;"><br /><asp:Label ID="Label1" runat="server" Text="Get the Project"></asp:Label><br /></h1>
    <br />
    <div class="form-group row">
        <label class="col-sm-12 col-md-2 col-form-label">Project Name</label>
        <div class="col-sm-12 col-md-10">
            <input class="form-control" type="text" id="projectName" runat="server" />
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-12 col-md-2 col-form-label">Project ID</label>
        <div class="col-sm-12 col-md-10">
            <input class="form-control" type="text" id="pID" runat="server" />
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-12 col-md-2 col-form-label">Location</label>
        <div class="col-sm-12 col-md-10">
            <input class="form-control" type="text" id="location" runat="server" />
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-12 col-md-2 col-form-label">Deal Type</label>
        <div class="col-sm-12 col-md-10">
            <input class="form-control" type="text" id="dType" runat="server" />
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-12 col-md-2 col-form-label">Business Type</label>
        <div class="col-sm-12 col-md-10">
            <input class="form-control" type="text" id="bType" runat="server" />
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-12 col-md-2 col-form-label">Purchase Value</label>
        <div class="col-sm-12 col-md-10">
            <input class="form-control" type="text" id="purchaseValue" runat="server" />
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-12 col-md-2 col-form-label">ITC Value</label>
        <div class="col-sm-12 col-md-10">
            <input class="form-control" type="text" id="itcValue" runat="server" />
        </div>
    </div>

    <br />
    <h1 style="text-align:center;">Schedule a call<br /><br /></h1>

    <div class="form-group row">
        <label class="col-sm-12 col-md-2 col-form-label">Date</label>
        <div class="col-sm-12 col-md-10">
            <input class="form-control date-picker" placeholder="Select Date" type="text" id="callDate" runat="server" />
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-12 col-md-2 col-form-label">Time</label>
        <div class="col-sm-12 col-md-10">
            <input class="form-control time-picker td-input" placeholder="Select time" type="text" id="callTime" readonly="" runat="server" />
        </div>
        <br /><br /><br />
        <div class="container" style="max-width:75%; text-align:center; align-content:center; align-self:center;">
            <asp:Label ID="lblResult" runat="server" Visible="false" CssClass="alert d-block mb-3" />
            <asp:Button ID="submit" runat="server" Text="Submit" OnClick="submit_Click"
                        style="text-align:center; width:65%; background-color:#003366; border-color:#002244"
                        class="btn btn-primary btn-lg" />
        </div>
        <br /><br />
    </div>
</div>
<br /><br />

</asp:Content>

<asp:Content ID="scripts" ContentPlaceHolderID="scripts" runat="server">
    <script src="../Scripts/Deskapp/script.js"></script>
</asp:Content>
