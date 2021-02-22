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
    <div id="status">
        <ul>
            <li>
                <label for="id">Id</label>
                <input type="email" id="id" name="id" size="20" maxlength="50" placeholder="example@com.com">
                <label for="pwd">Pwd</label>
                <input type="password" id="pwd" name="pwd" placeholder="6 ~ 16">
                <button id="login">Login</button>
        </ul>
    </div>
</c:if>

<c:if test="${!empty sessionScope.id}">
    <div id="status">
        <ul>
            <li>Login Success. Now on working...</li>
            <button id="logout">Logout</button>
        </ul>
    </div>
</c:if>

<script defer src="/webjars/jquery/3.5.1/jquery.js"></script>
<script defer src="/webjars/bootstrap/4.5.3/js/bootstrap.js"></script>
<script type="text/javascript" defer src="./mLogin.js"></script>
</body>
</html>