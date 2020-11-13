<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ page import="java.sql.Timestamp"%>
<html>
<head>

    <%--Meta Tags--%>
    <meta name="viewport" content="width=device-height, initial-scale=1, shrink-to-fit=no"/>

    <link rel="stylesheet" href="../bootstrap-4.5.3-dist/css/bootstrap-grid.min.css"/>
    <link rel="stylesheet" href="../bootstrap-4.5.3-dist/css/bootstrap-reboot.min.css"/>
    <link rel="stylesheet" href="../bootstrap-4.5.3-dist/css/bootstrap.min.css"/>

    <title>Register Response</title>
</head>
<body>
    <%request.setCharacterEncoding("utf-8");%>

    <jsp:useBean id="registerBean" class="view.jb.section1.RegisterBean">
        <jsp:setProperty name="registerBean" property="*"/>
    </jsp:useBean>

    <%
        registerBean.setReg_Date(new Timestamp(System.currentTimeMillis()));
    %>


    <div class="container">
        <div class="jumbotron shadow-lg p-3 mb-5 rounded">
            <p class="text-center display-1 text-primary">Account Information</p>
            <hr class="my-4">

            <div class="card">
                <div class="card-header">Information</div>
                <div class="card-body">
                    <h5 class="card-title">Name</h5>
                        <p class="card-text"><jsp:getProperty name="registerBean" property="enter_name"/></p>

                    <h5 class="card-title">Email</h5>
                        <p class="card-text"><jsp:getProperty name="registerBean" property="enter_email"/></p>

                    <h5 class="card-title">Gender</h5>
                        <p class="card-text"><jsp:getProperty name="registerBean" property="enter_gender"/></p>

                    <h5 class="card-title">Local</h5>
                        <p class="card-text"><jsp:getProperty name="registerBean" property="enter_local"/></p>

                    <h5 class="card-title">Reg_Date</h5>
                        <p class="card-text"><jsp:getProperty name="registerBean" property="reg_Date"/></p>
                </div>
            </div>

        </div>
    </div>

<script src="bootstrap-4.5.3-dist/js/bootstrap.min.js"></script>
<script src="bootstrap-4.5.3-dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>