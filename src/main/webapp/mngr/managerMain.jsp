<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>

    <%--Meta Tags--%>
    <meta name="viewport" content="width=device-height, initial-scale=1, shrink-to-fit=no"/>
    <link rel="stylesheet" href="/webjars/bootstrap/4.5.3/css/bootstrap.css"/>

    <title>Index</title>
</head>
<body>

<c:if test="${empty sessionScope.id}">
    <div id="mList">
        <p class="text-primary text-center">Please Login</p>
    </div>
</c:if>
<c:if test="${!empty sessionScope.id}">
    <div id="mList">
        <ul>
            <li><button id="registProduct">Insert</button></li>
            <li><button id="updateProduct">Update/Delete</button></li>
        </ul>
        <ul>
            <li><button id="orderedProduct">Check All Ordered Product</button></li>
            <li><button id="qna">QnA</button></li>
        </ul>
    </div>
</c:if>


<script src="/webjars/jquery/3.5.1/jquery.js"></script>
<script src="/webjars/bootstrap/4.5.3/js/bootstrap.js"></script>
<script type="text/javascript" defer src="./manageMain.js"></script>
</body>
</html>