<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>

    <%--Meta Tags--%>
    <meta name="viewport" content="width=device-height, initial-scale=1, shrink-to-fit=no"/>

    <%--BootStrap/jquery/js files--%>
    <link rel="stylesheet" href="/webjars/bootstrap/4.5.3/css/bootstrap.css"/>
    <script defer src="/webjars/jquery/3.5.1/jquery.js"></script>
    <script defer src="/webjars/bootstrap/4.5.3/js/bootstrap.js"></script>
    <script src="test.js"></script>

    <title>Index Page</title>
</head>
<body>
    <div class="container">
        <div class="from-group row float-right">
            <div class="col-8">
                <input type="text" id="userName" onkeyup="searchFunction()" class="form-control" size="20" >
            </div>
            <div class="col-2">
                <button class="btn btn-primary" onclick="searchFunction();" type="button">Search</button>
            </div>

        </div>

        <table class="table" style="text-align: center; border: 1px solid #dddddd;">
            <thead>
                <tr>
                    <th style="background-color: #fafafa; text-align: center;">Age</th>
                    <th style="background-color: #fafafa; text-align: center;">Name</th>
                    <th style="background-color: #fafafa; text-align: center;">Gender</th>
                    <th style="background-color: #fafafa; text-align: center;">Email</th>
                </tr>
            </thead>
            <tbody id="ajaxTable">

            </tbody>
        </table>
    </div>
</body>
</html>