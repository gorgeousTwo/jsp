<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ page import="view.jb.am.LoginProcessingBean" %>
<html>
<head>

    <%--Meta Tags--%>
    <meta name="viewport" content="width=device-height, initial-scale=1, shrink-to-fit=no"/>
    <link rel="stylesheet" href="/webjars/bootstrap/4.5.3/css/bootstrap.css"/>

    <title>isConfirmed?</title>
</head>
<body>

<c:set var="enterId" value="${param.enterId}" scope="request"/>
<jsp:useBean id="lpb" class="view.jb.am.LoginProcessingBean" scope="request"/>
<c:set var="check" value="${lpb.confirmId(enterId)}" scope="request"/>
<c:out value="${check}"/>


<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.5.3/js/bootstrap.js"></script>

</body>
</html>