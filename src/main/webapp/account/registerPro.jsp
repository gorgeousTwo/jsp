<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ page import="view.jb.am.LoginProcessingBean" %>
<%@ page import="java.sql.*" %>
<html>
<head>

    <%--Meta Tags--%>
    <meta name="viewport" content="width=device-height, initial-scale=1, shrink-to-fit=no"/>
    <link rel="stylesheet" href="/webjars/bootstrap/4.5.3/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/webjars/bootstrap/4.5.3/css/bootstrap-grid.min.css"/>
    <link rel="stylesheet" href="/webjars/bootstrap/4.5.3/css/bootstrap-reboot.min.css"/>

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

<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.5.3/js/bootstrap.min.js"></script>
<script src="/webjars/bootstrap/4.5.3/js/bootstrap.bundle.min.js"></script>

</body>
</html>