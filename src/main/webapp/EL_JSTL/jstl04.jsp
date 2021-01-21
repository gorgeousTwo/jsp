<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>

    <%--Meta Tags--%>
    <meta name="viewport" content="width=device-height, initial-scale=1, shrink-to-fit=no"/>
    <link rel="stylesheet" href="/webjars/bootstrap/4.5.3/css/bootstrap.css"/>

    <title>Title</title>
</head>
<body>

<sql:query var="rs" dataSource="jdbc/test">
    select * from member
</sql:query>

<table class="table">
    <tr class="label2">
        <c:forEach var="columnName" items="${rs.columnNames}">
            <th><c:out value="${columnName}"/></th>
        </c:forEach>
    </tr>
    <c:forEach var="row" items="${rs.rowsByIndex}">
        <tr>
            <c:forEach var="colnmn" items="${row}" varStatus="i">
                <td>
                    <c:if test="${colnmn != null}">
                        <c:out value="${colnmn}"/>
                    </c:if>
                    <c:if test="${colnmn == null}">
                        &nbsp;
                    </c:if>
                </td>
            </c:forEach>
        </tr>
    </c:forEach>
</table>


<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.5.3/js/bootstrap.js"></script>

</body>
</html>