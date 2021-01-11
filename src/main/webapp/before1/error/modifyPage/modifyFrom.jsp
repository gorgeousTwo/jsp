<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>

    <%--Meta Tags--%>
    <meta name="viewport" content="width=device-height, initial-scale=1, shrink-to-fit=no"/>

    <link rel="stylesheet" href="../../bootstrap-4.5.3-dist/css/bootstrap-grid.min.css"/>
    <link rel="stylesheet" href="../../bootstrap-4.5.3-dist/css/bootstrap-reboot.min.css"/>
    <link rel="stylesheet" href="../../bootstrap-4.5.3-dist/css/bootstrap.min.css"/>

    <style>
        body {
            background: #EECDA3;
            background: -webkit-linear-gradient(to top, #EF629F, #EECDA3);
            background: linear-gradient(to top, #EF629F, #EECDA3);
        }

        .container {
            max-width: 550px;
        }

        .has-error label,
        .has-error input,
        .has-error textarea {
            color: red;
            border-color: red;
        }

        .list-unstyled li {
            font-size: 13px;
            padding: 4px 0 0;
            color: red;
        }
    </style>

    <title>Title</title>
</head>
<body>

<div class="container mt-5">
    <div class="card">
        <h5 class="card-header text-center">Template</h5>
        <div class="card-body">
            <form action="modifyPro.jsp" method="post" role="form" data-toggle="validator">

                <div class="form-group">
                    <label for="enterId">ID</label>
                    <input type="text" class="form-control item" name="enterId" id="enterId" minlength="3"
                           maxlength="10"
                           placeholder="ID" required pattern="^[a-zA-Z0-9_.-]*$">

                    <div class="help-block with-errors"></div>
                </div>

                <div class="form-group">
                    <label for="enterPasswd">Password</label>
                    <input type="password" name="enterPasswd" id="enterPasswd" class="form-control" data-minlength="4"
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
                    <div class="custom-control custom-radio custom-control-inline">
                        <input type="radio" name="enterGender" id="enterGender1" class="custom-control-input" value="M">
                        <label for="enterGender1" class="custom-control-label">MALE</label>
                    </div>
                    <div class="custom-control custom-radio custom-control-inline">
                        <input type="radio" name="enterGender" id="enterGender2" class="custom-control-input" value="F">
                        <label for="enterGender2" class="custom-control-label">FEMALE</label>
                    </div>

                    <div class="help-block with-errors"></div>
                </div>

                <div class="form-group">
                    <label for="enterBirthday">Birthday</label>
                    <input type="text" name="enterBirthday" id="enterBirthday" class="form-control" maxlength="10"
                           required
                           placeholder="20000826">

                    <div class="help-block with-errors"></div>
                </div>


                <div class="form-group">
                    <label for="enterTel">Tel</label>
                    <input type="tel" name="enterTel" id="enterTel" class="form-control" placeholder="000-0000-0000"
                           required>

                    <div class="help-block with-errors"></div>
                </div>

                <div class="form-group">
                    <label for="enterEmail">Email</label>
                    <input type="email" id="enterEmail" name="enterEmail" class="form-control"
                           placeholder="rokir@skyrim.com" required>

                    <div class="help-block with-errors"></div>
                </div>

                <div class="form-group">
                    <button class="btn btn-primary btn-block" type="submit">SEND</button>
                </div>

            </form>
        </div>
    </div>
</div>


<script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
        crossorigin="anonymous"></script>
<script src="../../bootstrap-4.5.3-dist/js/bootstrap.js"></script>
<script src="../../bootstrap-4.5.3-dist/js/bootstrap.bundle.js"></script>
</body>
</html>
