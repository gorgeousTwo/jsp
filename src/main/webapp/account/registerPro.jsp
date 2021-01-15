<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ page import="view.jb.am.LoginProcessingBean" %>
<%@ page import="java.sql.*" %>
<html>
<head>

    <%--Meta Tags--%>
    <meta name="viewport" content="width=device-height, initial-scale=1, shrink-to-fit=no"/>
    <link rel="stylesheet" href="/webjars/bootstrap/4.5.3/css/bootstrap.css"/>

    <title>Title</title>
</head>
<body>
<fmt:requestEncoding value="utf-8"/>

<jsp:useBean id="member" class="view.jb.am.LoginDataBean">
    <jsp:setProperty name="member" property="*"/>
</jsp:useBean>
<jsp:useBean id="lpb" class="view.jb.am.LoginProcessingBean"/>
${member.reg_date}
${lpb.insertMember(member)}


<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.5.3/js/bootstrap.js"></script>

</body>
</html>