<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>

    <%--Meta Tags--%>
    <meta name="viewport" content="width=device-height, initial-scale=1, shrink-to-fit=no"/>
    <link rel="stylesheet" href="/webjars/bootstrap/4.5.3/css/bootstrap.css"/>
    <link rel="stylesheet" href="./form.css"/>


        <title>Title</title>
</head>
<body>

<div class="container mt-5">
    <div class="card">
        <h5 class="card-header text-center">Register</h5>
        <div class="card-body">
            <form method="post" role="form" action="./registerPro.jsp">

                <div class="form-group">
                    <label for="enterId">ID</label>
                    <input type="text" class="form-control item" name="enterId" id="enterId" minlength="3"
                           maxlength="10"
                           placeholder="ID" required pattern="^[a-zA-Z0-9_.-]*$">

                    <button class="btn btn-primary btn-sm btn-block" id="checkId">Confirm Check</button>
                    <div class="help-block with-errors"></div>
                </div>

                <div class="form-group">
                    <label for="enterPasswd">Password</label>
                    <input type="password" name="enterPasswd" id="enterPasswd" class="form-control" data-minlength="4"
                           data-error="minlength = 4 characters." placeholder="PASSWORD" required>

                    <div class="help-block with-errors"></div>
                </div>

                <div class="form-group">
                    <label for="checkPwd">checkPwd</label>
                    <input type="password" name="checkPwd" id="checkPwd" class="form-control" data-minlength="4"
                           data-error="minlength = 4 characters." placeholder="PASSWORD" required>

                    <div class="help-block with-errors"></div>
                </div>

                <div class="form-group">
                    <label for="enterName">Name</label>
                    <input type="text" class="form-control" data-error="You must have a Name" id="enterName"
                           name="enterName"
                           placeholder="NAME" required>

                    <div class="help-block with-errors"></div>
                </div>

                <div class="form-group">
                    <label for="enterAddress">Address</label>
                    <input type="text" name="enterAddress" id="enterAddress" class="form-control" required
                           placeholder="WhiteRun">

                    <div class="help-block with-errors"></div>
                </div>

                <div class="form-group">
                    <label for="enterTel">Tel</label>
                    <input type="tel" name="enterTel" id="enterTel" class="form-control" placeholder="000-0000-0000"
                           required>

                    <div class="help-block with-errors"></div>
                </div>

            </form>
            <button class="btn btn-primary btn-block" id="submit">Submit</button>
            <button class="btn btn-primary btn-block" id="cancel">Cancel</button>
        </div>
    </div>
</div>


<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.5.3/js/bootstrap.js"></script>
<script src="./register.js"></script>

</body>
</html>