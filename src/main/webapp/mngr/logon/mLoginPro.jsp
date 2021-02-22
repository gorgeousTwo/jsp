<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>

    <title>Index</title>
</head>
<body>
    <c:if test="${check ==1}">
        <c:set var="id" value="${id}" scope="session"/>
    </c:if>
    <c:redirect url="mLoginPro.jsp"/>
</body>
</html>