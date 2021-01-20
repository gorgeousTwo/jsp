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
        <h3>jstl - c:set out remove</h3>
        <hr class="my-4">

        <p>set browser variable
            <c:set var="browser" value="${header['User-Agent']}"/> <br>
            <c:out value="${browser}"/> 
        </p>

        <hr class="my-4">
        <br>

        <p>remove</p>
        <c:remove var="browser"/>
        <c:out value="${browser}"/>
    </div>
</div>


<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.5.3/js/bootstrap.js"></script>

</body>
</html>