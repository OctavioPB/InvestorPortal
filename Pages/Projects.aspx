<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Projects.aspx.cs"
         Inherits="InvestorPortal.Projects" MasterPageFile="~/Site.Master" %>

<asp:Content ID="head" ContentPlaceHolderID="head" runat="server">
    <title>OPB Capital — Projects</title>
    <link href="~/Content/deskapp2.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

<div style="height:70px;"></div>

<div class="container" style="max-width:90%; margin-bottom:40px;">
    <h2 style="text-align:center; padding:25px 0;">Available Projects</h2>

    <div class="card-group">
        <asp:Repeater ID="rptProjects" runat="server" OnItemCommand="rptProjects_ItemCommand">
            <ItemTemplate>
                <div class="card">
                    <br />
                    <img src='<%# "../Images/" + Eval("ImageUrl") %>'
                         class="card-img-top"
                         style="width:400px; height:200px; object-fit:cover; align-self:center;" />
                    <div class="card-body">
                        <h5 class="card-title" style="text-align:center;">Project <%# Eval("ProjectId") %></h5>
                        <p class="card-text">
                            <b>Project Name:</b>  <%# Eval("Name") %><br />
                            <b>Deal Type:</b>      <%# Eval("DealType") %><br />
                            <b>Business Type:</b>  <%# Eval("BusinessType") %><br />
                            <b>Location:</b>       <%# Eval("Location") %><br />
                            <b>ITC Value:</b>      <%# string.Format("{0:N0}", Eval("ITCValue")) %> $<br />
                            <b>Purchase Cost:</b>  <%# string.Format("{0:N0}", Eval("PurchaseCost")) %> $<br />
                        </p>
                        <div style="text-align:center;">
                            <asp:Button ID="btnSelect" runat="server"
                                        Text="Get It"
                                        CommandName="Select"
                                        CommandArgument='<%# Eval("ProjectId") %>'
                                        style="background-color:#003366; color:#FFFFFF; font-weight:bold;"
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

    <asp:Label ID="lblNoProjects" runat="server" Visible="false"
               CssClass="alert alert-info d-block mt-3"
               Text="No projects are currently available. Please check back later." />
</div>

</asp:Content>
