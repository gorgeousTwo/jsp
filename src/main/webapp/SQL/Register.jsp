<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>

    <%--Meta Tags--%>
    <meta name="viewport" content="width=device-height, initial-scale=1, shrink-to-fit=no"/>

        <link rel="stylesheet" href="../../bootstrap-4.5.3-dist/css/bootstrap-grid.min.css"/>
        <link rel="stylesheet" href="../../bootstrap-4.5.3-dist/css/bootstrap-reboot.min.css"/>
        <link rel="stylesheet" href="../../bootstrap-4.5.3-dist/css/bootstrap.min.css"/>

        <title>Register Form Review</title>
</head>
<body>
    <div class="container">
        <div class="jumbotron shadow-lg p-3 mb-5 rounded">
            <p class="text-center display-1 text-primary">Register Form Review</p>
            <hr class="my-4">

            <form action="Register_Processing.jsp" method="post">

                <div class="form-group">
                    <label for="enter_name" class="text-secondary">Name</label>
                    <input type="text" class="form-control" name="enter_name" id="enter_name" required>
                </div>

                <div class="form-group">
                    <label for="enter_email" class="text-secondary">Email</label>
                    <input type="email" class="form-control" name="enter_email" id="enter_email" required>
                </div>

                <div class="form-group">
                    <label for="enter_gender" class="text-secondary">Gender</label>
                    <input type="text" class="form-control" name="enter_gender" id="enter_gender" required>
                </div>

                <div class="form-group">
                    <label for="enter_local" class="text-secondary">Local</label>
                    <input type="text" class="form-control" name="enter_local" id="enter_local" required>
                </div>

                <p class="text-center"><button type="submit" class="btn btn-primary">Submit</button></p>
                <p class="text-center"><button type="reset" class="btn btn-primary">Reset</button></p>

            </form>
        </div>
    </div>

<script src="bootstrap-4.5.3-dist/js/bootstrap.min.js"></script>
<script src="bootstrap-4.5.3-dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>