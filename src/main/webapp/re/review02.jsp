<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>

    <%--Meta Tags--%>
    <meta name="viewport" content="width=device-height, initial-scale=1, shrink-to-fit=no"/>

    <%--BootStrap/jquery/js files--%>
    <link rel="stylesheet" href="/webjars/bootstrap/4.5.3/css/bootstrap.css"/>
    <script defer src="/webjars/jquery/3.5.1/jquery.js"></script>
    <script defer src="/webjars/bootstrap/4.5.3/js/bootstrap.js"></script>

    <script defer></script>

    <title>Title</title>
</head>
<body>
    <sql:query var="rs" dataSource="jdbc/test">
        SELECT * FROM FORUSER
    </sql:query>

    <div class="container">
        <table class="table">
            <tr class="label2">
                <c:forEach var="columnNames" items="${rs.columnNames}">
                    <th><c:out value="${columnNames}"/></th>
                </c:forEach>
            </tr>
            <c:forEach var="row" items="${rs.rowsByIndex}">
                <tr>
                    <c:forEach var="column" items="${row}" varStatus="i">
                        <td>
                            <c:if test="${column != null}">
                                <c:out value="${column}"/>
                            </c:if>
                            <c:if test="${column == null}">
                                &nbsp;
                            </c:if>
                        </td>
                    </c:forEach>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>