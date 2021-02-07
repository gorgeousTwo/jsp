<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>

    <%--Meta Tags--%>
    <meta name="viewport" content="width=device-height, initial-scale=1, shrink-to-fit=no"/>

    <%--BootStrap/jquery/js files--%>
    <link rel="stylesheet" href="/webjars/bootstrap/4.5.3/css/bootstrap.css"/>
    <link rel="icon" href="./resources/cutie_seal.png" sizes="32x32"/>

    <style>
        html,
        body {
            height: 100%;
        }

        body {
            display: -ms-flexbox;
            display: flex;
            -ms-flex-align: center;
            align-items: center;
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #f5f5f5;
        }

        .form-signin {
            width: 100%;
            max-width: 330px;
            padding: 15px;
            margin: auto;
        }

        .form-signin .form-control {
            position: relative;
            box-sizing: border-box;
            height: auto;
            padding: 10px;
            font-size: 16px;
        }

        .form-signin .form-control:focus {
            z-index: 2;
        }

        .form-signin input[type="email"] {
            margin-bottom: -1px;
            border-bottom-right-radius: 0;
            border-bottom-left-radius: 0;
        }
        .form-signin input[type="password"] {
            margin-bottom: 10px;
            border-top-left-radius: 0;
            border-top-right-radius: 0;
        }

        .form-signin input[type="text"] {
            margin-bottom: 10px;
            border-top-left-radius: 0;
            border-top-right-radius: 0;
        }

        .form-signin input[type="tel"] {
            margin-bottom: 10px;
            border-top-left-radius: 0;
            border-top-right-radius: 0;
        }
    </style>

    <script src="/webjars/jquery/3.5.1/jquery.js"></script>
    <script src="/webjars/bootstrap/4.5.3/js/bootstrap.js"></script>

    <script defer></script>

    <title>Template Form Page</title>
</head>
<body class="text-center">
<form action="#" class="form-signin" method="post" autocomplete="off">
    <img class="mb-4" src="./resources/cutie_seal.png" alt="logo" height="144" width="144">
    <h1 class="h3 mb-3 font-weight-normal">Template Form</h1>

    <!-- Login -->

    <label for="dbId" class="sr-only">Id</label>
    <input type="text" name="dbId" id="dbId" class="form-control" required placeholder="Id">

    <label for="dbPwd" class="sr-only">Pwd</label>
    <input type="password" name="dbPwd" id="dbPwd" class="form-control" required placeholder="Pwd">

    <!-- Register -->

    <!--

    <label for="dbEmail" class="sr-only">Email</label>
    <input type="email" name="dbEmail" id="dbEmail" class="form-control" required autofocus>

    <label for="dbId" class="sr-only">Id</label>
    <input type="text" name="dbId" id="dbId" class="form-control" required>

    <label for="dbPwd" class="sr-only">Pwd</label>
    <input type="password" name="dbPwd" id="dbPwd" class="form-control" required>

    <label for="dbPwd-2" class="sr-only">Pwd Check</label>
    <input type="password" name="dbPwd-2" id="dbPwd-2" class="form-control" required>

    <label for="dbTel" class="sr-only">Tel</label>
    <input type="tel" name="dbTel-2" id="dbTel" class="form-control" required>

    -->

    <div class="mt-5">
        <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
    </div>
    <p class="mt-5 mb-3 text-muted"><a href="https://getbootstrap.com/docs/4.5/examples/sign-in/" target="_blank">Original</a></p>
</form>

</body>
</html>