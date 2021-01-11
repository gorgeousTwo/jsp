<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>

    <%--Meta Tags--%>
    <meta name="viewport" content="width=device-height, initial-scale=1, shrink-to-fit=no"/>
    <link rel="stylesheet" href="/webjars/bootstrap/4.5.3/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/webjars/bootstrap/4.5.3/css/bootstrap-grid.min.css"/>
    <link rel="stylesheet" href="/webjars/bootstrap/4.5.3/css/bootstrap-reboot.min.css"/>

    <title>Account Management</title>
</head>
<body>
    <div class="container col-8">
        <div class="jumbotron shadow-lg">
            <div class="card">
                <img src="./resource/WEB_STANDARDS.png" alt="Container Image"
                     class="card-img-top img-fluid shadow-lg rounded">
                <div class="card-body" id="main_auth">
                    <jsp:include page="./loginForm.jsp"/>
                </div>
            </div>
        </div>
    </div>

<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.5.3/js/bootstrap.min.js"></script>
<script src="/webjars/bootstrap/4.5.3/js/bootstrap.bundle.min.js"></script>

</body>
</html>