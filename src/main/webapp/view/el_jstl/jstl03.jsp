<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>

    <%--Meta Tags--%>
    <meta name="viewport" content="width=device-height, initial-scale=1, shrink-to-fit=no"/>
    <link rel="stylesheet" href="/webjars/bootstrap/4.5.3/css/bootstrap.css"/>

    <title>Title</title>
</head>
<body>


<h3>Header Info</h3>

<c:forEach var="head" items="${headerValues}">
    <p>param : <c:out value="${head.key}"/></p>
    <p>values :
    <c:forEach var="val" items="${head.value}">
        <c:out value="${val}"/>
        </c:forEach>
</c:forEach>
<!-- headerValues -> var head. and c:out head.key   head.value -> var val  c:out val.-->


<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.5.3/js/bootstrap.js"></script>

</body>
</html>