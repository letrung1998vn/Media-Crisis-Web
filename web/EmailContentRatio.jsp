<%@page import="MediaCrisis.Model.EmailContentListModel"%>
<%@page import="MediaCrisis.Model.EmailContentModel"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="java.util.List"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <link rel="icon" type="image/png" href="assets/img/favicon.ico">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

        <title>Light Bootstrap Dashboard by Creative Tim</title>

        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
        <meta name="viewport" content="width=device-width" />


        <!-- Bootstrap core CSS     -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" />

        <!-- Animation library for notifications   -->
        <link href="assets/css/animate.min.css" rel="stylesheet"/>

        <!--  Light Bootstrap Table core CSS    -->
        <link href="assets/css/light-bootstrap-dashboard.css?v=1.4.0" rel="stylesheet"/>


        <!--  CSS for Demo Purpose, don't include it in your project     -->
        <link href="assets/css/demo.css" rel="stylesheet" />


        <!--     Fonts and icons     -->
        <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
        <link href="assets/css/pe-icon-7-stroke.css" rel="stylesheet" />
        <%
            List<String> listRatioStr = (List<String>) request.getAttribute("listRatio");
            List<String> listDateStr = (List<String>) request.getAttribute("listDate");
        %>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
            google.charts.load('current', {'packages': ['corechart']});
            google.charts.setOnLoadCallback(drawVisualization);
            function drawVisualization() {
                var listRatio =<%=listRatioStr%>;
                var listDate = [];
            <% for (int i = 0; i < listDateStr.size(); i++) {
                    String date = listDateStr.get(i);
            %>
                listDate.push('<%=date%>');
            <%
                }
            %>
                var len = listRatio.length;
                var i;
                var formatDate = new google.visualization.DateFormat({
                    pattern: 'yyyy-MM-dd hh:mm:ss'
                });
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Time');
                data.addColumn('number', 'Percentage of Negative');
                for (i = 0; i < len; i++) {
                    console.log(listDate[i]);
                    var rowDate = new Date(listDate[i]);
                    data.addRow([formatDate.formatValue(rowDate), listRatio[i] * 100]);
                }
                var options = {chartArea: {left: 20, top: 10, width: '80%', height: '80%'}};
                var chart = new google.visualization.ColumnChart(document.getElementById('chart_ratio'));
                chart.draw(data, options);
            }
        </script>
    </head>

    <body>

        <div class="wrapper">
            <div class="sidebar" data-color="purple" data-image="assets/img/sidebar-5.jpg">

                <!--   you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple" -->
            </div>

            <div class="main-panel">
                <nav class="navbar navbar-default navbar-fixed">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="#">List Crisis</a>
                        </div>

                    </div>
                </nav>

                <div class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-8">
                                <div class="card">

                                    <div class="header">
                                        <h4 class="title">Ratio Chart</h4>
                                    </div>
                                    <div class="content">
                                        <div id="chart_ratio"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">Keyword: <%=request.getAttribute("keyword")%></h4>
                                    </div>
                                    <div class="content table-responsive table-full-width">
                                        <table class="table table-hover table-striped">
                                            <thead>
                                            <th>No</th>
                                            <th>Content</th>
                                            <th>Link Detail</th>
                                            </thead>
                                            <tbody>
                                                <%
                                                    List<EmailContentListModel> list = (List<EmailContentListModel>) request.getAttribute("listEmailContent");
                                                    if (list != null) {
                                                        for (int i = 0; i < list.size(); i++) {
                                                            EmailContentListModel eclm = list.get(i);
                                                            String content = eclm.getContent();
                                                            String linkDetail = eclm.getLink();
                                                %>
                                                <tr>
                                                    <td>
                                                        <%=i + 1%>
                                                    </td>
                                                    <td><p><%=content%></p></td>
                                                    <td><a href="<%=linkDetail%>" target='_blank'><%=linkDetail%></a></td>
                                                </tr>
                                                <%
                                                        }
                                                    }
                                                %>
                                            </tbody>
                                        </table>

                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>

                <footer class="footer">
                    <div class="container-fluid">
                        <nav class="pull-left">
                            <ul>
                                <li>
                                    <a href="mainPage_JSP.jsp">
                                        Home
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        Company
                                    </a>
                                </li>
                            </ul>
                        </nav>
                        <p class="copyright pull-right">
                            &copy; <script>document.write(new Date().getFullYear())</script> <a href="http://www.creative-tim.com">Media Crisis</a>, for your better business 
                        </p>
                    </div>
                </footer>


            </div>
        </div>


    </body>

    <!--   Core JS Files   -->
    <script src="assets/js/jquery.3.2.1.min.js" type="text/javascript"></script>
    <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

    <!--  Charts Plugin -->
    <script src="assets/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="assets/js/bootstrap-notify.js"></script>

    <!--  Google Maps Plugin    -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>

    <!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
    <script src="assets/js/light-bootstrap-dashboard.js?v=1.4.0"></script>

    <!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
    <script src="assets/js/demo.js"></script>
</html>
