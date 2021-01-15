<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>

    <%--Meta Tags--%>
    <meta name="viewport" content="width=device-height, initial-scale=1, shrink-to-fit=no"/>
    <link rel="stylesheet" href="/webjars/bootstrap/4.5.3/css/bootstrap.css"/>
    <link rel="stylesheet" href="./form.css"/>

    <title>Account Management</title>
</head>
<body>

    <div class="container col-8">
        <div class="jumbotron shadow-lg">
            <div class="card">
                <img src="./resource/CutieSeal.png" alt="Container Image"
                     class="card-img-top img-fluid shadow-sm rounded">
                <div class="card-body" id="main_auth">
                    <c:import url="./loginForm.jsp" var="url"/>
                    ${url}
                </div>
            </div>
        </div>
    </div>

<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.5.3/js/bootstrap.js"></script>

</body>
</html>