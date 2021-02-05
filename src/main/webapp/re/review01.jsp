<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>

    <%--Meta Tags--%>
    <meta name="viewport" content="width=device-height, initial-scale=1, shrink-to-fit=no"/>

    <%--BootStrap/jquery/js files--%>
    <link rel="stylesheet" href="/webjars/bootstrap/4.5.3/css/bootstrap.css"/>
    <script defer src="/webjars/jquery/3.5.1/jquery.js"></script>
    <script defer src="/webjars/bootstrap/4.5.3/js/bootstrap.js"/>

    <script defer></script>

    <title>review01</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-lg-6">
            <form action="/review" method="post">
                <div class="form-group">
                    <label for="reName">Name</label>
                    <input type="text" class="form-control" name="reName" id="reName">
                </div>
                <div class="form-group">
                    <label for="rePwd">Pwd</label>
                    <input type="password" class="form-control" name="rePwd" id="rePwd">
                </div>
                <div class="form-group">
                    <label for="reTel">Name</label>
                    <input type="tel" class="form-control" name="reTel" id="reTel">
                </div>
                <div class="form-group">
                    <button class="btn btn-primary" type="submit">submit</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>