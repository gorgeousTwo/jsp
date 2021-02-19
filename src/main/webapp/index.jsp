<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>

    <%--Meta Tags--%>
    <meta name="viewport" content="width=device-height, initial-scale=1, shrink-to-fit=no"/>

    <%--BootStrap/jquery/js files--%>
    <link rel="stylesheet" href="/webjars/bootstrap/4.5.3/css/bootstrap.css"/>

    <title>Index Page</title>
</head>
<body>

<header>
<div class="collapse bg-dark" id="navbarHeader">
    <div class="container">
        <div class="row">
            <div class="col-sm-8 col-md-7 py-4">
                <h4 class="text-white">Index</h4>
                <p class="text-muted">Account Management Page.</p>
            </div>
            <div class="con-sm-4 offset-md-1 py-4">
                <h4 class="text-white">Content List</h4>
                <ul class="list-unstyled">
                    <li><a href="#" class="text-white">Register</a></li>
                    <li><a href="#" class="text-white">Login</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="navbar navbar-dark bg-dark shadow-sm">
    <div class="container d-flex justify-content-between">
        <a href="index.jsp" class="navbar-brand d-flex align-items-center">
            <img src="./resources/cutie_seal.png" alt="navbar-brand" width="25" height="25" class="mr-2">
        <strong>Index</strong>
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarHeader"
        aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
    </div>
</div>
</header>

<main role="main">
    <section class="jumbotron text-center">
        <div class="container">
            <h1 id="top">Description</h1>
            <p class="lead text-muted">This page provide Register/Login/MyPage/Update/Delete function.</p>
        </div>
    </section>

    <div class="py-3 bg-light">
        <div class="container">
        <div class="row mb-4">
            <div class="col-md-6">
                <div class="card text-center">
                    <div class="card-header">
                        Function One
                    </div>
                    <div class="card-body">
                        <h4 class="card-title">Register</h4>
                        <p class="card-text">Ajax : Id duplicate check, Pwd check</p>
                        <a href="#" class="btn btn-primary">register</a>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card text-center">
                    <div class="card-header">
                        Function Two
                    </div>
                    <div class="card-body">
                        <h4 class="card-title">Login</h4>
                        <p class="card-text">Ajax? : Get Session Id</p>
                        <a href="#" class="btn btn-primary">login</a>
                    </div>
                </div>
            </div>
        </div>
            <div class="row mb-4">
                <div class="col-md-6">
                    <div class="card text-center">
                        <div class="card-header">
                            Function Three
                        </div>
                        <div class="card-body">
                            <h4 class="card-title">My Page</h4>
                            <p class="card-text">Check my information.</p>
                            <a href="#" class="btn btn-primary">my page</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card text-center">
                        <div class="card-header">
                            Function Four
                        </div>
                        <div class="card-body">
                            <h4 class="card-title">Update/Delete</h4>
                            <p class="card-text">Update/Delete my information. it's execute on My page</p>
                            <a href="#" class="btn btn-primary">my page</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>


<footer class="text-muted mt-2">
    <div class="container">
        <p class="float-right">
            <a href="#top">Back on Top</a>
        </p>
        <p>BootStrap example : <a href="https://getbootstrap.com/docs/4.5/examples/album/#" target="_blank">Album</a></p>
        <p>2021/02/10</p>
    </div>
</footer>

    <script defer src="/webjars/jquery/3.5.1/jquery.js"></script>
    <script defer src="/webjars/bootstrap/4.5.3/js/bootstrap.js"></script>

</body>
</html>