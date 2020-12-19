<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>

    <%--Meta Tags--%>
    <meta name="viewport" content="width=device-height, initial-scale=1, shrink-to-fit=no"/>

    <link rel="stylesheet" href="../bootstrap-4.5.3-dist/css/bootstrap-grid.min.css"/>
    <link rel="stylesheet" href="../bootstrap-4.5.3-dist/css/bootstrap-reboot.min.css"/>
    <link rel="stylesheet" href="../bootstrap-4.5.3-dist/css/bootstrap.min.css"/>

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

    <title>Register</title>
</head>
<body>

<div class="container mt-5">
    <div class="card">
        <h5 class="card-header text-center">Information</h5>
        <div class="card-body">
            <form action="r_request_view.jsp" method="post" role="form" data-toggle="validator">

                <div class="form-group">
                    <label for="Name">Name</label>
                    <input type="text" class="form-control" data-error="You must have a Name" id="Name" name="Name"
                           placeholder="Name" required>

                    <div class="help-block with-errors"></div>
                </div>
                <div class="form-group">
                    <label for="Id">Id</label>
                    <input type="text" class="form-control item" name="Id" id="Id" minlength="3" maxlength="10"
                           placeholder="id" required pattern="^[a-zA-Z0-9_.-]*$">

                    <div class="help-block with-errors"></div>
                </div>
                <div class="form-group">
                    <label for="Email">Email</label>
                    <input type="email" id="Email" name="Email" class="form-control" placeholder="email" required>

                    <div class="help-block with-errors"></div>
                </div>
                <div class="form-group">
                    <label for="Password">Password</label>
                    <input type="password" name="Password" id="Password" class="form-control" data-minlength="4"
                    data-error="minlength = 4 characters." placeholder="Passwd" required>

                    <div class="help-block with-errors"></div>
                </div>
                <div class="form-group">
                    <label for="Address">Address</label>
                    <select name="Address" id="Address" class="custom-select" required>
                        <option selected>Open this</option>
                        <option value="Whiterun">Whiterun</option>
                        <option value="Winterhold">Winterhold</option>
                        <option value="Solitude">Solitude</option>
                        <option value="Markarth">Markarth</option>
                        <option value="I’m…I’m from Rorikstead">I’m…I’m from Rorikstead</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="Message">Message</label>
                    <textarea class="form-control" name="Message" id="Message" data-error="Please enter Messages."
                    placeholder="Message" required=""></textarea>

                    <div class="help-block with-errors"></div>
                </div>

                <div class="form-group">
                    <button class="btn btn-primary btn-block" type="submit">Send</button>
                </div>

            </form>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
        crossorigin="anonymous"></script>
<script src="../bootstrap-4.5.3-dist/js/bootstrap.js"></script>
<script src="../bootstrap-4.5.3-dist/js/bootstrap.bundle.js"></script>
</body>
</html>
