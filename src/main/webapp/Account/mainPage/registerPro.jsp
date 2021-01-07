<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,javax.naming.*" %>
<%@ page import="view.jb.am.LoginProcessingBean" %>
<html>
<head>

    <%--Meta Tags--%>
    <meta name="viewport" content="width=device-height, initial-scale=1, shrink-to-fit=no"/>

    <link rel="stylesheet" href="../../bootstrap-4.5.3-dist/css/bootstrap-grid.min.css"/>
    <link rel="stylesheet" href="../../bootstrap-4.5.3-dist/css/bootstrap-reboot.min.css"/>
    <link rel="stylesheet" href="../../bootstrap-4.5.3-dist/css/bootstrap.min.css"/>

    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="member" class="view.jb.am.LoginDataBean">
    <jsp:setProperty name="member" property="*"/>
</jsp:useBean>

<%
    //set currentTime
    member.setReg_date(new Timestamp(System.currentTimeMillis()));

    LoginProcessingBean lpb = LoginProcessingBean.getInstance();
    //insertMember method
    lpb.insertMember(member);
%>


<script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
        crossorigin="anonymous"></script>
<script src="../../bootstrap-4.5.3-dist/js/bootstrap.js"></script>
<script src="../../bootstrap-4.5.3-dist/js/bootstrap.bundle.js"></script>
</body>
</html>
