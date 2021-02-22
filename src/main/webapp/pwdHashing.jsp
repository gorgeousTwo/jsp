<%@ page import="hashing.SHA256" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="hashing.to" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>

    <%--Meta Tags--%>
    <meta name="viewport" content="width=device-height, initial-scale=1, shrink-to-fit=no"/>
    <link rel="stylesheet" href="/webjars/bootstrap/4.5.3/css/bootstrap.css"/>

    <title>Index</title>
</head>
<body>
<%
    to to = hashing.to.getInstance();
    to.toHash();
%>
<script defer src="/webjars/jquery/3.5.1/jquery.js"></script>
<script defer src="/webjars/bootstrap/4.5.3/js/bootstrap.js"></script>

</body>
</html>