<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>

    <%--Meta Tags--%>
    <meta name="viewport" content="width=device-height, initial-scale=1, shrink-to-fit=no"/>

    <%--BootStrap/jquery/js files--%>
    <link rel="stylesheet" href="/webjars/bootstrap/4.5.3/css/bootstrap.css"/>
    <link rel="stylesheet" href="./mainStyle.css"/>
    <script defer src="/webjars/jquery/3.5.1/jquery.js"></script>
    <script defer src="/webjars/bootstrap/4.5.3/js/bootstrap.js"/>

    <script defer></script>

    <title>Register</title>
</head>
<body>
    <div class="container">
        <form action="/userRegisterServlet" method="post">
            <table class="table table-bordered table-hover mt-3">
                <thead>
                    <tr>
                        <th colspan="4"><h4>User Register Form</h4></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="2" style="width: 110px"><h5>ID</h5></td>
                        <td colspan="1"><input type="text" class="form-control" id="userId" name="userId" maxlength="20"></td>
                        <td><button class="btn btn-primary" onclick="idCheck();" type="button">Id Check</button></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="width: 110px"><h5>PWD</h5></td>
                        <td colspan="2"><input type="password" class="form-control" id="userPwd1" name="userPwd1" maxlength="20"></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="width: 110px"><h5>PWD Check</h5></td>
                        <td colspan="2"><input type="password" class="form-control" id="userPwd2" name="userPwd2" maxlength="20"></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="width: 110px"><h5>Name</h5></td>
                        <td colspan="2"><input type="text" class="form-control" id="userName" name="userName" maxlength="20"></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="width: 110px"><h5>Age</h5></td>
                        <td colspan="2"><input type="text" class="form-control" id="userAge" name="userAge" maxlength="20"></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="width: 110px"><h5>Gender</h5></td>
                        <td colspan="2">
                            <div class="form-group text-center">
                                <div class="btn-group" data-toggle="buttons">
                                    <label class="btn btn-primary active">
                                        <input type="radio" name="userGender" autocomplete="off" value="Airplane">Airplane
                                    </label>
                                    <label class="btn btn-primary">
                                        <input type="radio" name="userGender" autocomplete="off" value="Car">Car
                                    </label>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td  colspan="2" style="width: 110px"><h5>Email</h5></td>
                        <td colspan="2"><input type="email" class="form-control" id="userEmail" name="userEmail" maxlength="20"></td>
                    </tr>
                    <tr>
                        <td style="text-align: left" colspan="4">
                            <input type="submit" class="btn btn-primary float-right" value="Register">
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </div>
</body>
</html>