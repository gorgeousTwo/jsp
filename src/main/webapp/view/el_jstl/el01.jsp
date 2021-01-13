<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>

    <%--Meta Tags--%>
    <meta name="viewport" content="width=device-height, initial-scale=1, shrink-to-fit=no"/>
    <link rel="stylesheet" href="/webjars/bootstrap/4.5.3/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/webjars/bootstrap/4.5.3/css/bootstrap-grid.min.css"/>
    <link rel="stylesheet" href="/webjars/bootstrap/4.5.3/css/bootstrap-reboot.min.css"/>

        <style>
            body {
                margin-top: 30px;
            }
        </style>

    <title>EL01</title>
</head>
<body>

    <div class="container col-8">
        <div class="jumbotron shadow-lg">
            <div class="card">
                <p class="text-center display-2 text-primary">EL example</p>
                <div class="card-body">
                    <p><h3 class="text-center">Expression = Value</h3></p>
                    <hr class="my-4">

                    <p><h4 class="text-center">\${2 + 5} = ${2+5}</h4></p>
                    <hr class="my-4">

                    <p><h4 class="text-center">\${4 / 5} = ${4/5}</h4></p>
                    <hr class="my-4">

                    <p><h4 class="text-center">\${7 mod 5} = ${7 mod 5}</h4></p>
                    <hr class="my-4">

                    <p><h4 class="text-center">\${2 < 3} = ${2 < 3}</h4></p>
                    <hr class="my-4">

                    <p><h4 class="text-center">\${3.1 le 3.2} = ${3.1 le 3.2}</h4></p>
                    <hr class="my-4">

                    <p><h4 class="text-center">\${(5 > 3) ? 5 : 3} = ${(5 > 3) ? 5 : 3}</h4></p>
                    <hr class="my-4">
                </div>
            </div>
        </div>
    </div>



<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.5.3/js/bootstrap.min.js"></script>
<script src="/webjars/bootstrap/4.5.3/js/bootstrap.bundle.min.js"></script>

</body>
</html>