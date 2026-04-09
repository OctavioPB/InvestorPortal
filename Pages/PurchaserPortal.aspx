<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PurchaserPortal.aspx.cs"
         Inherits="InvestorPortal.PurchaserPortal" MasterPageFile="~/Site.Master" %>

<asp:Content ID="head" ContentPlaceHolderID="head" runat="server">
    <title>OPB Capital — Mi Portal</title>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

<asp:Panel ID="pnlPaymentAlert" runat="server" Visible="false"
    CssClass="alert alert-danger"
    style="position:fixed; width:30%; top:55px; left:0; right:0; z-index:1;">
    You have a pending payment.
</asp:Panel>
<asp:Panel ID="pnlDocumentAlert" runat="server" Visible="false"
    CssClass="alert alert-warning"
    style="position:absolute; width:30%; top:105px;">
    You have a pending document to upload.
</asp:Panel>

<div class="container" style="text-align:center; padding-top:90px;">
    <img src="../Images/GPC_logo_black.png" class="img-fluid" style="max-height:180px" />
    <h2>Welcome <asp:Label ID="name" runat="server" Text=""></asp:Label></h2><br />
</div>

<div class="container" style="max-width:75%; align-content:center; box-shadow: 0 4px 8px 0 rgba(0,0,0,.2), 0 6px 20px 0 rgba(0,0,0,.19); padding-top:25px;">
    <div class="alert alert-success" style="text-align:center;">
        <strong>New projects are available for you</strong> Take action before someone else takes these deals.<br />
    </div>

    <div class="card-group">
        <asp:Repeater ID="rptProjects" runat="server" OnItemCommand="rptProjects_ItemCommand">
            <ItemTemplate>
                <div class="card">
                    <br />
                    <img src='<%# "../Images/" + Eval("ImageUrl") %>'
                         class="card-img-top"
                         style="width:400px; height:200px; text-align:center; align-items:center; align-self:center;" />
                    <div class="card-body">
                        <h5 class="card-title" style="text-align:center;">Project <%# Eval("ProjectId") %></h5>
                        <p class="card-text">
                            <b>Project Name:</b> <%# Eval("Name") %><br />
                            <b>Project Type:</b> <%# Eval("DealType") %><br />
                            <b>Location:</b>     <%# Eval("Location") %><br />
                            <b>ITC Value:</b>    <%# string.Format("{0:N0}", Eval("ITCValue")) %> $<br />
                        </p>
                        <div style="text-align:center;">
                            <asp:Button ID="btnGetProject" runat="server"
                                        Text="Get It"
                                        CommandName="Select"
                                        CommandArgument='<%# Eval("ProjectId") %>'
                                        style="background-color:#003366; color:#FFFFFF; text-align:center; font-weight:bold"
                                        class="btn btn-default" />
                        </div>
                    </div>
                    <div class="card-footer">
                        <small class="text-muted">Last updated <%: DateTime.Today.ToShortDateString() %></small>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <br /><br />
    <div class="row" style="text-align:center;">
        <div class="col-md-4" style="text-align:center;">
            <h2>Investor Portal</h2>
            <br />
            <img src="../Images/save-money.png" style="width:20%;" />
            <br /><br />
            <p>Welcome to OPB Capital Investor Portal</p>
            <p>
                <br />
                <a class="btn btn-default" href="PurchaseForm.aspx"
                   style="background-color:#003366; color:#FFFFFF; font-weight:bold">Upload documentation &raquo;</a>
            </p>
        </div>
        <div class="col-md-4" style="text-align:center;">
            <h2>Get more Projects</h2>
            <br />
            <img src="../Images/dollar.png" style="width:20%;" />
            <br /><br />
            <p>Look into OPB Capital available projects for purchase</p>
            <br />
            <p>
                <a class="btn btn-default" href="Projects.aspx"
                   style="background-color:#003366; color:#FFFFFF; font-weight:bold">See Available Projects &raquo;</a>
            </p>
        </div>
        <div class="col-md-4" style="text-align:center;">
            <h2>View important dates and messages</h2>
            <img src="../Images/calendar.png" style="width:20%;" />
            <br /><br />
            <p>You can now look into the status of your projects in real time</p>
            <br />
            <p>
                <a class="btn btn-default" href="PurchaserDashboard.aspx"
                   style="color:#FFFFFF; font-weight:bold; background-color:#003366">Learn more &raquo;</a>
            </p>
        </div>
    </div>
</div>
<br /><br />

</asp:Content>
