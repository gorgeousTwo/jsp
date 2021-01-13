<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>

    <%--Meta Tags--%>
    <meta name="viewport" content="width=device-height, initial-scale=1, shrink-to-fit=no"/>
    <link rel="stylesheet" href="/webjars/bootstrap/4.5.3/css/bootstrap.css"/>
        <style>
            body {
                margin-top: 30px;
            }

            .container {
                max-width: 550px;
            }
        </style>

    <title>EL02</title>
</head>
<body>

<%
    request.setCharacterEncoding("utf-8");
%>

    <div class="container col-8">
        <div class="jumbotron shadow-lg">
                <form action="el02.jsp" method="post" class="text-center">
                    <div class="form-group">
                        <label for="test">Name</label>
                        <input class="form-control" type="text" name="test" id="test" required value="${param['test']}">
                    </div>
                    <div class="form-group">
                        <button class="btn btn-primary" type="submit">Submit</button>
                    </div>
                </form>
        </div>
                <p class="display-4 text-center text-primary">Name is ${param.test}</p>
    </div>


<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.5.3/js/bootstrap.js"></script>

</body>
</html>