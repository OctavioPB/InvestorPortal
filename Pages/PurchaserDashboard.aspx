<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PurchaserDashboard.aspx.cs"
         Inherits="InvestorPortal.PurchaserDashboard" MasterPageFile="~/Site.Master" %>

<asp:Content ID="head" ContentPlaceHolderID="head" runat="server">
    <title>OPB Capital — Dashboard</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
          integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
          crossorigin="anonymous" />
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

<div class="main-container">
    <h1><asp:Label ID="name" runat="server" Text=""></asp:Label> Portfolio Information</h1>
    <div class="pd-ltr-20 xs-pd-20-10">
        <div class="row clearfix progress-box">

            <%-- Portfolio Size --%>
            <div class="col-lg-3 col-md-6 col-sm-12 mb-30">
                <div class="bg-white pd-20 box-shadow border-radius-5 height-100-p">
                    <div class="project-info clearfix">
                        <div class="project-info-left">
                            <div class="icon box-shadow bg-blue text-white">
                                <i class="fa fa-dollar-sign"></i>
                            </div>
                        </div>
                        <div class="project-info-right">
                            <asp:Label ID="lblPortfolioSize" runat="server" Text="0 $"
                                       CssClass="no text-blue weight-500 font-24" />
                            <p class="weight-400 font-18">Portfolio Size</p>
                        </div>
                    </div>
                    <div class="project-info-progress">
                        <div class="row clearfix">
                            <div class="col-sm-6 text-muted weight-500">Target</div>
                            <div class="col-sm-6 text-right weight-500 font-14 text-muted">400,000 $</div>
                        </div>
                        <div class="progress" style="height:10px;">
                            <div class="progress-bar bg-blue progress-bar-striped progress-bar-animated"
                                 role="progressbar" style="width:40%;"></div>
                        </div>
                    </div>
                </div>
            </div>

            <%-- Amount Paid --%>
            <div class="col-lg-3 col-md-6 col-sm-12 mb-30">
                <div class="bg-white pd-20 box-shadow border-radius-5 height-100-p">
                    <div class="project-info clearfix">
                        <div class="project-info-left">
                            <div class="icon box-shadow bg-light-orange text-white">
                                <i class="fa fa-coins"></i>
                            </div>
                        </div>
                        <div class="project-info-right">
                            <asp:Label ID="lblAmountPaid" runat="server" Text="0 $"
                                       CssClass="no text-light-orange weight-500 font-24" />
                            <p class="weight-400 font-18">Amount Paid</p>
                        </div>
                    </div>
                    <div class="project-info-progress">
                        <div class="row clearfix">
                            <div class="col-sm-6 text-muted weight-500">Stage</div>
                            <div class="col-sm-6 text-right weight-500 font-14 text-muted"></div>
                        </div>
                        <div class="progress" style="height:10px;">
                            <div class="progress-bar bg-light-orange progress-bar-striped progress-bar-animated"
                                 role="progressbar" style="width:100%;"></div>
                        </div>
                    </div>
                </div>
            </div>

            <%-- Projects Reserved --%>
            <div class="col-lg-3 col-md-6 col-sm-12 mb-30">
                <div class="bg-white pd-20 box-shadow border-radius-5 height-100-p">
                    <div class="project-info clearfix">
                        <div class="project-info-left">
                            <div class="icon box-shadow bg-light-green text-white">
                                <i class="fa fa-list-alt"></i>
                            </div>
                        </div>
                        <div class="project-info-right">
                            <asp:Label ID="lblProjectCount" runat="server" Text="0 Projects"
                                       CssClass="no text-light-green weight-500 font-24" />
                            <p class="weight-400 font-18">Projects Reserved</p>
                        </div>
                    </div>
                    <div class="project-info-progress">
                        <div class="row clearfix">
                            <div class="col-sm-6 text-muted weight-500">Review</div>
                            <div class="col-sm-6 text-right weight-500 font-14 text-muted">Good</div>
                        </div>
                        <div class="progress" style="height:10px;">
                            <div class="progress-bar bg-light-green progress-bar-striped progress-bar-animated"
                                 role="progressbar" style="width:80%;"></div>
                        </div>
                    </div>
                </div>
            </div>

            <%-- Amount Due --%>
            <div class="col-lg-3 col-md-6 col-sm-12 mb-30">
                <div class="bg-white pd-20 box-shadow border-radius-5 margin-5 height-100-p">
                    <div class="project-info clearfix">
                        <div class="project-info-left">
                            <div class="icon box-shadow bg-light-purple text-white">
                                <i class="fa fa-file-invoice-dollar"></i>
                            </div>
                        </div>
                        <div class="project-info-right">
                            <asp:Label ID="lblAmountDue" runat="server" Text="0 $"
                                       CssClass="no text-light-purple weight-500 font-24" />
                            <p class="weight-400 font-18">Amount Due</p>
                        </div>
                    </div>
                    <div class="project-info-progress">
                        <div class="row clearfix">
                            <div class="col-sm-6 text-muted weight-500">Review</div>
                            <div class="col-sm-6 text-right weight-500 font-14 text-muted">Average</div>
                        </div>
                        <div class="progress" style="height:10px;">
                            <div class="progress-bar bg-light-purple progress-bar-striped progress-bar-animated"
                                 role="progressbar" style="width:75%;"></div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <%-- Portfolio chart --%>
        <div class="bg-white pd-20 box-shadow border-radius-5 mb-30">
            <h4 class="mb-30">Portfolio Detail</h4>
            <div class="row">
                <div class="col-sm-12 col-md-8 col-lg-9 xs-mb-20">
                    <div id="areaspline-chart" style="min-width:210px; height:400px; margin:0 auto;"></div>
                </div>
                <div class="col-sm-12 col-md-4 col-lg-3">
                    <h5 class="mb-30 weight-500">Investment</h5>
                    <div class="mb-30">
                        <p class="mb-5 font-18">Prepay</p>
                        <div class="progress border-radius-0" style="height:10px;">
                            <div class="progress-bar bg-orange" role="progressbar" style="width:40%;"></div>
                        </div>
                    </div>
                    <div class="mb-30">
                        <p class="mb-5 font-18">PPA</p>
                        <div class="progress border-radius-0" style="height:10px;">
                            <div class="progress-bar bg-light-purple" role="progressbar" style="width:50%;"></div>
                        </div>
                    </div>
                    <div class="mb-30">
                        <p class="mb-5 font-18">Target</p>
                        <div class="progress border-radius-0" style="height:10px;">
                            <div class="progress-bar bg-light-green" role="progressbar" style="width:70%;"></div>
                        </div>
                    </div>
                    <div class="mb-30 font-18">
                        <p class="mb-5">Liability</p>
                        <div class="progress border-radius-0" style="height:10px;">
                            <div class="progress-bar bg-light-orange" role="progressbar" style="width:80%;"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

</asp:Content>

<asp:Content ID="scripts" ContentPlaceHolderID="scripts" runat="server">
    <script src="../Scripts/Deskapp/script.js"></script>
    <script src="../Scripts/Deskapp/highcharts.js"></script>
    <script src="../Scripts/Deskapp/highcharts-more.js"></script>
    <script type="text/javascript">
        Highcharts.chart('areaspline-chart', {
            chart: { type: 'areaspline' },
            title: { text: '' },
            legend: {
                layout: 'vertical', align: 'left', verticalAlign: 'top',
                x: 70, y: 20, floating: true, borderWidth: 1,
                backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'
            },
            xAxis: {
                categories: ['January','February','March','April','May','June',
                             'July','August','September','October','November','December'],
                plotBands: [{ from: 4.5, to: 6.5 }],
                gridLineDashStyle: 'longdash', gridLineWidth: 1, crosshair: true
            },
            yAxis: { title: { text: '' }, gridLineDashStyle: 'longdash' },
            tooltip: { shared: true, valueSuffix: ' DOLLARS' },
            credits: { enabled: false },
            plotOptions: { areaspline: { fillOpacity: 0.6 } },
            series: [
                { name: 'LIABILITY', color: '#f56767',
                  data: [10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000] },
                { name: 'PREPAY',    color: '#f5956c',
                  data: [8000,7000,10000,11000,3000,6000,8000,5000,7000,0,0,0] },
                { name: 'PPA',       color: '#41ccba',
                  data: [2000,3000,0,0,8000,5000,7000,6000,3000,0,0,0] },
                { name: 'TARGET',    color: '#a683eb',
                  data: [8000,11000,6000,9000,13000,8000,7000,6000,8000,8000,7000,10000] }
            ]
        });
    </script>
</asp:Content>
