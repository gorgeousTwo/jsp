<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,javax.naming.*" %>
<html>
<head>

    <%--Meta Tags--%>
    <meta name="viewport" content="width=device-height, initial-scale=1, shrink-to-fit=no"/>

    <link rel="stylesheet" href="../../../bootstrap-4.5.3-dist/css/bootstrap-grid.min.css"/>
    <link rel="stylesheet" href="../../../bootstrap-4.5.3-dist/css/bootstrap-reboot.min.css"/>
    <link rel="stylesheet" href="../../../bootstrap-4.5.3-dist/css/bootstrap.min.css"/>

    <title>JSP Hell</title>
</head>
<body>
    <div class="container col-8">
        <div class="jumbotron shadow-lg">
            <div class="card">
                <img src="./resource/WEB_STANDARDS.png" class="card-img-top img-fluid shadow-lg rounded" alt="...">
                <div class="card-body" id="main_auth">
                    <jsp:include page="loginForm.jsp"/>
                    <!--will include loginForm and RegisterForm.-->
                </div>
            </div>

        </div> <!-- jumbotron -->
    </div> <!-- container -->

<script src="../../bootstrap-4.5.3-dist/js/jquery-3.5.1.min.js"></script>
<script src="../../bootstrap-4.5.3-dist/js/bootstrap.js"></script>
<script src="../../bootstrap-4.5.3-dist/js/bootst   rap.bundle.js"></script>
</body>
</html>

<%
    /*
    without session {
    main -> register button -> login.js -> registerForm -> isConfirmed -> registerPro

    -> LoginDataBean -> LoginProcessingBean -> DB
    }

     */
%>
