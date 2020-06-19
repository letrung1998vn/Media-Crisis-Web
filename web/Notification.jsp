<%-- 
    Document   : Notification
    Created on : Mar 25, 2020, 4:09:34 PM
    Author     : letru
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String url = "";
            if (session.getAttribute("USERID") == null) {
                url = "login_JSP.jsp";
                session.setAttribute("CREATE_MESSAGE", "Your session has been time out");
                session.setAttribute("RESULT", 3);
                session.setAttribute("SEND", true);
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            }
        %>
        <div class="wrapper">
            <div class="sidebar" data-color="purple" data-image="assets/img/sidebar-5.jpg">

                <!--   you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple" -->


                <div class="sidebar-wrapper">
                    <div class="logo">
                        <a href="#" class="simple-text">
                            Media Crisis Detect Application
                        </a>
                    </div>

                    <ul class="nav">
                        <li>
                            <a href="mainPage_JSP.jsp">
                                <i class="pe-7s-graph"></i>
                                <p>Dashboard</p>
                            </a>
                        </li>
                        <li class="active">
                            <a href="userProfile.jsp">
                                <i class="pe-7s-user"></i>
                                <p>User Profile</p>
                            </a>
                        </li>
                        <li>
                            <a href="Keyword_JSP.jsp">
                                <i class="pe-7s-note2"></i>
                                <p>Keyword</p>
                            </a>
                        </li>
                    </ul>
                </div>
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
                            <a class="navbar-brand" href="#">Notification</a>
                        </div>
                        <div class="collapse navbar-collapse">
                            <ul class="nav navbar-nav navbar-right">
                                <li>
                                    <a href="Notification.jsp">
                                        <p>Notification</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="webhook.jsp">
                                        <p>Webhook</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="changePassword.jsp">
                                        <p>Change password</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <p>Account</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <p>Log out</p>
                                    </a>
                                </li>
                                <li class="separator hidden-lg hidden-md"></li>
                            </ul>
                        </div>
                    </div>
                </nav>


                <div class="content">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-10">
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">Web Notification</h4>
                                    </div>
                                    <div class="content">
                                        <div class="col-md-12">
                                            <div class="col-md-12" style="visibility: hidden" id="warningText"><h4 class="title">You already block the notification of this page. Please allow it and refresh the page to enable notification</h4></div>
                                        </div>
                                        <form action="MainController" method="post" class="validate-form-update-profile" id="form-update-token">
                                            <input id="tokenString" type="hidden" name="txtToken">
                                            <%
                                                boolean exist = (boolean) session.getAttribute("isEnable");
                                                if (exist) {
                                            %>
                                            <input type="hidden" name="btnAction" value="EnableNotiBrowser">
                                            <button type="submit" class="btn btn-info btn-fill pull-left" id="Notibtn" onclick="getToken(event)">Enable Notification</button>
                                            <%
                                            } else {
                                            %>
                                            <button type="submit" class="btn btn-info btn-fill pull-left" name="btnAction" value="DisableNotiBrowser" >Disable Notification</button>
                                            <%
                                                }
                                            %>
                                            <div class="clearfix"></div>
                                        </form>
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
        <script src="https://www.gstatic.com/firebasejs/7.12.0/firebase-app.js"></script>
        <script src="https://www.gstatic.com/firebasejs/7.12.0/firebase-messaging.js"></script>
        <script>
                                $(document).ready(function () {
                                    if (<%=session.getAttribute("SEND")%>) {
                                        $.notify({
                                            icon: "pe-7s-bell",
                                            message: '<%=session.getAttribute("CREATE_MESSAGE")%>'

                                        }, {
                                            type: type[<%=session.getAttribute("RESULT")%>],
                                            timer: 4000,
                                            placement: {
                                                from: 'top',
                                                align: 'left'
                                            }
                                        });
                                    }
                                    if (Notification.permission === "denied") {
                                        document.getElementById('Notibtn').style.visibility = 'hidden';
                                        document.getElementById("warningText").style.visibility = 'visible';
                                    }
            <% session.removeAttribute("SEND"); %>
            <% session.removeAttribute("CREATE_MESSAGE"); %>
            <% session.removeAttribute("RESULT");%>
            <% session.removeAttribute("UPDATINGPOS");%>
            <% session.removeAttribute("UPDATINGVALUE");%>
                                })
                                function getToken(event) {
                                    event.preventDefault();
                                    var tokenForm = document.getElementById("form-update-token");
                                    var tokenString = document.getElementById("tokenString");
                                    var firebaseConfig = {
                                        apiKey: "AIzaSyDu0alR16fuDysOrsWMWF9bm-IkscLH4Zw",
                                        authDomain: "media-crisis.firebaseapp.com",
                                        databaseURL: "https://media-crisis.firebaseio.com",
                                        projectId: "media-crisis",
                                        storageBucket: "media-crisis.appspot.com",
                                        messagingSenderId: "721141867711",
                                        appId: "1:721141867711:web:b2ea06e0e59157b6ae520a",
                                        measurementId: "G-YBT6NGHPTL"
                                    };
                                    // Initialize Firebase
                                    firebase.initializeApp(firebaseConfig);
                                    const messaging = firebase.messaging();
                                    navigator.serviceWorker.register('./firebase-messaging-sw.js')
                                            .then((registration) => {
                                                messaging.useServiceWorker(registration);
                                                // Request permission and get token.....
                                                messaging
                                                        .requestPermission()
                                                        .then(function () {
                                                            console.log("Notification permission granted.");
                                                            // get the token in the form of promise
                                                            return messaging.getToken()
                                                        })
                                                        .then(function (token) {
                                                            // print the token on the HTML page
                                                            tokenString.value = token;
                                                            tokenForm.submit();
                                                            console.log("Token: " + token);
                                                        })
                                                        .catch(function (err) {
                                                            console.log("Unable to get permission to notify.", err);
                                                        });
                                                messaging.onMessage(function (payload) {
                                                    console.log("Message received. ", payload);
                                                });
                                            }
                                            );
                                }
        </script>
    </body>
</html>
