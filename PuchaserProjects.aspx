<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PuchaserProjects.aspx.cs" Inherits="PurchaserPortal1.PuchaserProjects" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/deskapp.css" rel="stylesheet" />
    <style>

.Grid
{
background-color: #fff;
margin: 5px 0 10px 0; 
border: solid 1px #525252;
border-collapse:collapse;
font-family:Calibri;
color: #474747;
text-align:center;
}
.Grid td 
{
padding: 2px;
border: solid 1px #c1c1c1;
}
.Grid th
{
padding : 4px 2px;
color: #fff;
background: #205928;
border-left: solid 1px #525252;
font-size: 0.9em;
text-align:center;
}
.Grid .alt 
{
background: #fcfcfc;
}
.Grid .pgr 
{
background: #205928;
}
.Grid .pgr table 
{
margin: 3px 0;
}
.Grid .pgr td 
{
border-width: 0;
padding: 0 6px;
border-left: solid 1px #666;
font-weight: bold;
color: #fff;
line-height: 12px;
text-align: center;
}
.Grid .pgr a
{
color: Gray;
text-decoration: none;
text-align:center;
}
.Grid .pgr a:hover
{
color: #000;
text-decoration: none;
text-align:center;
}

</style>

    <%--<h2><%: Title %>.</h2>--%>
    <h3>Available Projects</h3>
    <br />
    <br />
    <p>
       <%-- <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>--%>
        <asp:Table ID="Table1" runat="server"></asp:Table>
        <asp:GridView 
            ID="GridView1" 
            runat="server" 
            AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1" 
            Width="92%"
            AllowPaging="True" 
            PageSize="20"
            CssClass="Grid"                    
            AlternatingRowStyle-CssClass="alt"
            PagerStyle-CssClass="pgr">

<AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>

            <Columns>
                <asp:BoundField DataField="Project_ID" HeaderText="Project ID" SortExpression="Project_ID" />
                <asp:BoundField DataField="Deal_Type" HeaderText="Deal Type" SortExpression="Deal_Type" />
                <asp:BoundField DataField="Bussiness_Type" HeaderText="Bussiness Type" SortExpression="Bussiness_Type" />
                <asp:BoundField DataField="Project_Name" HeaderText="Project Name" SortExpression="Project_Name" />
                <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" />
                <asp:BoundField DataField="Purchase_Cost" HeaderText="Purchase Cost" SortExpression="Purchase_Cost" />
                <asp:BoundField DataField="ITC_Value" HeaderText="ITC Value" SortExpression="ITC_Value" />
                <asp:CheckBoxField DataField="" HeaderText="Select" SortExpression="select" />
            </Columns>

<PagerStyle CssClass="pgr"></PagerStyle>

        </asp:GridView>
        <asp:SqlDataSource 
            ID="SqlDataSource1" 
            runat="server" 
            ConnectionString="<%$ ConnectionStrings:PurchasersConnectionString %>" 
            OnSelecting="SqlDataSource1_Selecting" 
            SelectCommand="SELECT * FROM [purchaser2020demo]">
        </asp:SqlDataSource>

    </p>
    <address>
        395 Second Street<br />
        Laguna Beach, CA 92651<br />
        <abbr title="Phone">Phone:</abbr>
        714.509.0238
    </address>

    <address>
        <strong>Marketing:</strong>   <a href="mailto:Support@example.com">infot@greenpacecapital.com</a><br />
        <strong>Support:</strong> <a href="mailto:Marketing@example.com">purchasers@greenpacecapital.com</a>
    </address>
</asp:Content>

