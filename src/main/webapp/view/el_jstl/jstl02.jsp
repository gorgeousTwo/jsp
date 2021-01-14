<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>

    <%--Meta Tags--%>
    <meta name="viewport" content="width=device-height, initial-scale=1, shrink-to-fit=no"/>
    <link rel="stylesheet" href="/webjars/bootstrap/4.5.3/css/bootstrap.css"/>

    <title>Title</title>
</head>
<body>

<div class="container col-8">
    <div class="jumbotron">
        <c:set var="country" value="${'Korea'}"/>
        <c:if test="${country != null}">
            Name : <c:out value="${country}"/><br>

        </c:if>

        <c:choose>
            <c:when test="${country == 'Korea'}">
                <p><c:out value="${country}"/> is suck.</p>
            </c:when>

            <c:when test="${country == 'Canada'}">
                <p><c:out value="${country}"/> is not bad.</p>
            </c:when>

            <c:otherwise>
                <p>I don know.</p>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.5.3/js/bootstrap.js"></script>

</body>
</html>