<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PurchaserDashboard.aspx.cs" Inherits="PurchaserPortal1.PurchaserDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <%--<link href="Content/deskapp2.css" rel="stylesheet" />--%>
    <link href="Content/style.css" rel="stylesheet" />
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous"/>
    <title></title>
</head>
<body>
     <nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="position:fixed; width:100%; z-index: +1;">
  <a class="navbar-brand" href="#">Purchaser Portal</a>
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
<div class="main-container">
	<h1><asp:Label ID="name" runat="server" Text=""></asp:Label> Portfolio Information</h1>
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="row clearfix progress-box">
				<div class="col-lg-3 col-md-6 col-sm-12 mb-30">
					<div class="bg-white pd-20 box-shadow border-radius-5 height-100-p">
						<div class="project-info clearfix">
							<div class="project-info-left">
								<div class="icon box-shadow bg-blue text-white">
									<i class="fa fa-dollar-sign"></i>
								</div>
							</div>
							<div class="project-info-right">
								<span class="no text-blue weight-500 font-24">400,000 $</span>
								<p class="weight-400 font-18">Portfolio Size</p>
							</div>
						</div>
						<div class="project-info-progress">
							<div class="row clearfix">
								<div class="col-sm-6 text-muted weight-500">Target</div>
								<div class="col-sm-6 text-right weight-500 font-14 text-muted">400,000 $</div>
							</div>
							<div class="progress" style="height: 10px;">
								<div class="progress-bar bg-blue progress-bar-striped progress-bar-animated" role="progressbar" style="width: 40%;" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 col-sm-12 mb-30">
					<div class="bg-white pd-20 box-shadow border-radius-5 height-100-p">
						<div class="project-info clearfix">
							<div class="project-info-left">
								<div class="icon box-shadow bg-light-orange text-white">
									<i class="fa fa-coins"></i>
								</div>
							</div>
							<div class="project-info-right">
								<span class="no text-light-orange weight-500 font-24">50,000 $</span>
								<p class="weight-400 font-18">Remaining Payment</p>
							</div>
						</div>
						<div class="project-info-progress">
							<div class="row clearfix">
								<div class="col-sm-6 text-muted weight-500">Stage</div>
								<div class="col-sm-6 text-right weight-500 font-14 text-muted">50,000 $</div>
							</div>
							<div class="progress" style="height: 10px;">
								<div class="progress-bar bg-light-orange progress-bar-striped progress-bar-animated" role="progressbar" style="width: 100%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 col-sm-12 mb-30">
					<div class="bg-white pd-20 box-shadow border-radius-5 height-100-p">
						<div class="project-info clearfix">
							<div class="project-info-left">
								<div class="icon box-shadow bg-light-green text-white">
									<i class="fa fa-list-alt"></i>
								</div>
							</div>
							<div class="project-info-right">
								<span class="no text-light-green weight-500 font-24">2 Projects</span>
								<p class="weight-400 font-18">Projects payed</p>
							</div>
						</div>
						<div class="project-info-progress">
							<div class="row clearfix">
								<div class="col-sm-6 text-muted weight-500">Review</div>
								<div class="col-sm-6 text-right weight-500 font-14 text-muted">Good</div>
							</div>
							<div class="progress" style="height: 10px;">
								<div class="progress-bar bg-light-green progress-bar-striped progress-bar-animated" role="progressbar" style="width: 80%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 col-sm-12 mb-30">
					<div class="bg-white pd-20 box-shadow border-radius-5 margin-5 height-100-p">
						<div class="project-info clearfix">
							<div class="project-info-left">
								<div class="icon box-shadow bg-light-purple text-white">
									<i class="fa fa-file-invoice-dollar"></i>
								</div>
							</div>
							<div class="project-info-right">
								<span class="no text-light-purple weight-500 font-24">50,000 $</span>
								<p class="weight-400 font-18">Amount Due</p>
							</div>
						</div>
						<div class="project-info-progress">
							<div class="row clearfix">
								<div class="col-sm-6 text-muted weight-500">Review</div>
								<div class="col-sm-6 text-right weight-500 font-14 text-muted">Average</div>
							</div>
							<div class="progress" style="height: 10px;">
								<div class="progress-bar bg-light-purple progress-bar-striped progress-bar-animated" role="progressbar" style="width: 75%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="bg-white pd-20 box-shadow border-radius-5 mb-30">
				<h4 class="mb-30">Portfolio Detail</h4>
				<div class="row">
					<div class="col-sm-12 col-md-8 col-lg-9 xs-mb-20">
						<div id="areaspline-chart" style="min-width: 210px; height: 400px; margin: 0 auto"></div>
					</div>
					<div class="col-sm-12 col-md-4 col-lg-3">
						<h5 class="mb-30 weight-500">Investment</h5>
						<div class="mb-30">
							<p class="mb-5 font-18">Prepay</p>
							<div class="progress border-radius-0" style="height: 10px;">
								<div class="progress-bar bg-orange" role="progressbar" style="width: 40%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
						</div>
						<div class="mb-30">
							<p class="mb-5 font-18">PPA</p>
							<div class="progress border-radius-0" style="height: 10px;">
								<div class="progress-bar bg-light-purple" role="progressbar" style="width: 50%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
						</div>
						<div class="mb-30">
							<p class="mb-5 font-18">Target</p>
							<div class="progress border-radius-0" style="height: 10px;">
								<div class="progress-bar bg-light-green" role="progressbar" style="width: 70%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
						</div>
						<div class="mb-30 font-18">
							<p class="mb-5">Liability</p>
							<div class="progress border-radius-0" style="height: 10px;">
								<div class="progress-bar bg-light-orange" role="progressbar" style="width: 80%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
    </form>
    
    <script src="Scripts/Deskapp/script.js"></script>
    <script src="Scripts/Deskapp/highcharts.js"></script>
    <script src="Scripts/Deskapp/highcharts-more.js"></script>
	<script type="text/javascript">
    Highcharts.chart('areaspline-chart', {
            chart: {
                type: 'areaspline'
            },
            title: {
                text: ''
            },
            legend: {
                layout: 'vertical',
                align: 'left',
                verticalAlign: 'top',
                x: 70,
                y: 20,
                floating: true,
                borderWidth: 1,
                backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'
            },
            xAxis: {
                categories: [
                    'January',
                    'February',
                    'March',
                    'April',
                    'May',
                    'June',
                    'July',
                    'August',
                    'September',
                    'October',
                    'November',
                    'December'
                ],
                plotBands: [{
                    from: 4.5,
                    to: 6.5,
                }],
                gridLineDashStyle: 'longdash',
                gridLineWidth: 1,
                crosshair: true
            },
            yAxis: {
                title: {
                    text: ''
                },
                gridLineDashStyle: 'longdash',
            },
            tooltip: {
                shared: true,
                valueSuffix: 'DOLLARS'
            },
            credits: {
                enabled: false
            },
            plotOptions: {
                areaspline: {
                    fillOpacity: 0.6
                }
            },

        series: [
            {
                name: 'LIABILITY',
                data: [10000, 10000, 10000, 10000, 10000, 10000, 10000, 10000, 10000, 10000, 10000, 10000],
                color: '#f56767'
            },
            {
                name: 'PREPAY',
                data: [8000, 7000, 10000, 11000, 3000, 6000, 8000, 5000, 7000, 0, 0, 0],
                color: '#f5956c'
            },
            {
                name: 'PPA',
                data: [2000, 3000, 0, 0, 8000, 5000, 7000, 6000, 3000, 0, 0, 0],
                color: '#41ccba'
            },
            {
                name: 'TARGET',
                data: [8000, 11000, 6000, 9000, 13000, 8000, 7000, 6000, 8000, 8000, 7000, 10000],
                color: '#a683eb'
            }]
        });


        // Device Usage chart
        Highcharts.chart('device-usage', {
            chart: {
                type: 'pie'
            },
            title: {
                text: ''
            },
            subtitle: {
                text: ''
            },
            credits: {
                enabled: false
            },
            plotOptions: {
                series: {
                    dataLabels: {
                        enabled: false,
                        format: '{point.name}: {point.y:.1f}%'
                    }
                },
                pie: {
                    innerSize: 127,
                    depth: 45
                }
            },

            tooltip: {
                headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
                pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>'
            },
            series: [{
                name: 'Brands',
                colorByPoint: true,
                data: [{
                    name: 'IE',
                    y: 10,
                    color: '#ecc72f'
                }, {
                    name: 'Chrome',
                    y: 40,
                    color: '#46be8a'
                }, {
                    name: 'Firefox',
                    y: 30,
                    color: '#f2a654'
                }, {
                    name: 'Safari',
                    y: 10,
                    color: '#62a8ea'
                }, {
                    name: 'Opera',
                    y: 10,
                    color: '#e14e50'
                }]
            }]
        });

        // gauge chart
        Highcharts.chart('ram', {

            chart: {
                type: 'gauge',
                plotBackgroundColor: null,
                plotBackgroundImage: null,
                plotBorderWidth: 0,
                plotShadow: false
            },
            title: {
                text: ''
            },
            credits: {
                enabled: false
            },
            pane: {
                startAngle: -150,
                endAngle: 150,
                background: [{
                    borderWidth: 0,
                    outerRadius: '109%'
                }, {
                    borderWidth: 0,
                    outerRadius: '107%'
                }, {
                }, {
                    backgroundColor: '#fff',
                    borderWidth: 0,
                    outerRadius: '105%',
                    innerRadius: '103%'
                }]
            },

            yAxis: {
                min: 0,
                max: 200,

                minorTickInterval: 'auto',
                minorTickWidth: 1,
                minorTickLength: 10,
                minorTickPosition: 'inside',
                minorTickColor: '#666',

                tickPixelInterval: 30,
                tickWidth: 2,
                tickPosition: 'inside',
                tickLength: 10,
                tickColor: '#666',
                labels: {
                    step: 2,
                    rotation: 'auto'
                },
                title: {
                    text: 'RAM'
                },
                plotBands: [{
                    from: 0,
                    to: 120,
                    color: '#55BF3B'
                }, {
                    from: 120,
                    to: 160,
                    color: '#DDDF0D'
                }, {
                    from: 160,
                    to: 200,
                    color: '#DF5353'
                }]
            },

            series: [{
                name: 'Speed',
                data: [80],
                tooltip: {
                    valueSuffix: '%'
                }
            }]
        });
        Highcharts.chart('cpu', {

            chart: {
                type: 'gauge',
                plotBackgroundColor: null,
                plotBackgroundImage: null,
                plotBorderWidth: 0,
                plotShadow: false
            },
            title: {
                text: ''
            },
            credits: {
                enabled: false
            },
            pane: {
                startAngle: -150,
                endAngle: 150,
                background: [{
                    borderWidth: 0,
                    outerRadius: '109%'
                }, {
                    borderWidth: 0,
                    outerRadius: '107%'
                }, {
                }, {
                    backgroundColor: '#fff',
                    borderWidth: 0,
                    outerRadius: '105%',
                    innerRadius: '103%'
                }]
            },

            yAxis: {
                min: 0,
                max: 200,

                minorTickInterval: 'auto',
                minorTickWidth: 1,
                minorTickLength: 10,
                minorTickPosition: 'inside',
                minorTickColor: '#666',

                tickPixelInterval: 30,
                tickWidth: 2,
                tickPosition: 'inside',
                tickLength: 10,
                tickColor: '#666',
                labels: {
                    step: 2,
                    rotation: 'auto'
                },
                title: {
                    text: 'CPU'
                },
                plotBands: [{
                    from: 0,
                    to: 120,
                    color: '#55BF3B'
                }, {
                    from: 120,
                    to: 160,
                    color: '#DDDF0D'
                }, {
                    from: 160,
                    to: 200,
                    color: '#DF5353'
                }]
            },

            series: [{
                name: 'Speed',
                data: [120],
                tooltip: {
                    valueSuffix: ' %'
                }
            }]
        });
	</script>



</body>
</html>
