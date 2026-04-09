<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminView.aspx.cs"
         Inherits="InvestorPortal.AdminView" MasterPageFile="~/Site.Master" %>

<asp:Content ID="head" ContentPlaceHolderID="head" runat="server">
    <title>OPB Capital — Administración</title>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

<br /><br /><br />

<div class="container" style="max-width:80%; box-shadow:0 4px 8px 0 rgba(0,0,0,.2),0 6px 20px 0 rgba(0,0,0,.19); padding:25px 30px 30px; background-color:#fff;">

    <h4 class="mb-4">Purchaser Management</h4>

    <asp:Label ID="lblStatus" runat="server" CssClass="text-success font-weight-bold" Visible="false"></asp:Label>
    <asp:Label ID="lblError"  runat="server" CssClass="text-danger  font-weight-bold" Visible="false"></asp:Label>
    <br />

    <div class="form-group row align-items-end">
        <div class="col-md-6">
            <label>Select Purchaser</label>
            <asp:DropDownList ID="ddlPurchaser" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>
        <div class="col-md-3 mt-2">
            <asp:Button ID="btnLoad" runat="server" Text="Load" CssClass="btn btn-secondary btn-block"
                        OnClick="btnLoad_Click" />
        </div>
    </div>

    <hr />

    <div class="form-group">
        <label>Full Name</label>
        <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="Andrew Gold"></asp:TextBox>
    </div>
    <div class="form-group">
        <label>Email</label>
        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
    </div>
    <div class="form-group">
        <label>Telephone</label>
        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="1-(111)-111-1111"></asp:TextBox>
    </div>
    <div class="form-group">
        <label>Entity</label>
        <asp:TextBox ID="txtEntity" runat="server" CssClass="form-control"></asp:TextBox>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <label>Purchase Amount ($)</label>
                <asp:TextBox ID="txtPurchaseAmount" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Cash Amount ($)</label>
                <asp:TextBox ID="txtCashAmount" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Allocated ITC ($)</label>
                <asp:TextBox ID="txtAllocatedITC" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <label>Pending ITC to Allocate ($)</label>
                <asp:TextBox ID="txtPendingITC" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Weighted Avg. Unallocated ITC</label>
                <asp:TextBox ID="txtWeightedITC" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Purchaser Probability (%)</label>
                <asp:TextBox ID="txtProbability" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
    </div>

    <div class="form-group">
        <label class="font-weight-bold">Notification Banners</label>
        <div class="custom-control custom-checkbox mb-2">
            <asp:CheckBox ID="chkPaymentPending"  runat="server" CssClass="custom-control-input" />
            <label class="custom-control-label" for="chkPaymentPending">Payment Pending</label>
        </div>
        <div class="custom-control custom-checkbox mb-2">
            <asp:CheckBox ID="chkDocumentPending" runat="server" CssClass="custom-control-input" />
            <label class="custom-control-label" for="chkDocumentPending">Documents Pending</label>
        </div>
        <div class="custom-control custom-checkbox mb-2">
            <asp:CheckBox ID="chkCallScheduled"   runat="server" CssClass="custom-control-input" />
            <label class="custom-control-label" for="chkCallScheduled">Call Scheduled</label>
        </div>
    </div>

    <div class="form-group text-right">
        <asp:Button ID="btnSave" runat="server" Text="Save Changes" CssClass="btn btn-primary px-5"
                    OnClick="btnSave_Click" />
    </div>
</div>
<br /><br />

</asp:Content>
