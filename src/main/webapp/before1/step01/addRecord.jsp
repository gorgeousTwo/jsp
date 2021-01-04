<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>

    <%--Meta Tags--%>
    <meta name="viewport" content="width=device-height, initial-scale=1, shrink-to-fit=no"/>

    <link rel="stylesheet" href="../../bootstrap-4.5.3-dist/css/bootstrap-grid.min.css"/>
    <link rel="stylesheet" href="../../bootstrap-4.5.3-dist/css/bootstrap-reboot.min.css"/>
    <link rel="stylesheet" href="../../bootstrap-4.5.3-dist/css/bootstrap.min.css"/>

    <title>Record</title>
</head>
<body>
    <div class="container col-4">
        <div class="jumbotron shadow-lg mb-5 p-3 rounded">
            <form action="addRecord_processing.jsp" method="post">
                <div class="form-group">
                    <label for="enterID" class="text-secondary display-4">ID</label>
                    <input type="email" id="enterID" name="enterID" class="form-control" required
                           placeholder="example@exam.com">
                </div>
                <div class="form-group">
                    <label for="enterPW" class="text-secondary display-4">PW</label>
                    <input type="password" id="enterPW" name="enterPW" class="form-control" required placeholder="**********">
                </div>
                <div class="form-group">
                    <label for="enterNAME" class="text-secondary display-4">NAME</label>
                    <input type="text" id="enterNAME" name="enterNAME" class="form-control" required placeholder="Falulu">
                </div>
                <div class="form-group">
                    <label for="enterADDRESS" class="text-secondary display-4">ADDRESS</label>
                    <input type="text" id="enterADDRESS" name="enterADDRESS" class="form-control" required placeholder="Seoul">
                </div>
                <div class="form-group">
                    <label for="enterTEL" class="text-secondary display-4">TEL</label>
                    <input type="tel" id="enterTEL" name="enterTEL" class="form-control" required placeholder="123-4567-8910">
                </div>
                <p class="text-center"><button type="submit" class="btn btn-primary">Submit</button></p>
                <p class="text-center"><button type="reset" class="btn btn-danger">Reset</button></p>
            </form>
        </div>
    </div>


<script src="bootstrap-4.5.3-dist/js/bootstrap.min.js"></script>
<script src="bootstrap-4.5.3-dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>