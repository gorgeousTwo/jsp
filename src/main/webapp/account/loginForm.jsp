<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>

    <%--Meta Tags--%>
    <meta name="viewport" content="width=device-height, initial-scale=1, shrink-to-fit=no"/>
    <link rel="stylesheet" href="/webjars/bootstrap/4.5.3/css/bootstrap.css"/>
    <link rel="stylesheet" href="./form.css"/>

        <title>LoginForm</title>
</head>
<body>

<c:catch var="exception">
    <c:set var="id" value="${sessionScope['id']}"/>
    <c:if test="${id == null || id.equals('')}">
        <div class="container">
              <div class="card">
                  <h5 class="card-header text-center">LOGIN</h5>
                  <div class="card-body">
                      <form action="./loginPro.jsp" method="post">
                          <div class="form-group">
                              <label for="enterId">ID</label>
                              <input type="text" class="form-control item" name="enterId" id="enterId" minlength="3"
                                     maxlength="12"
                                     placeholder="ID" required pattern="^[a-zA-Z0-9_.-]*$">

                              <div class="help-block with-errors"></div>
                          </div>

                          <div class="form-group">
                              <label for="enterPwd">Password</label>
                              <input type="password" name="enterPwd" id="enterPwd" class="form-control" data-minlength="4"
                                     data-error="minlength = 4 characters." placeholder="PASSWORD" required>

                              <div class="help-block with-errors"></div>
                          </div>

                          <div class="form-group">
                              <button class="btn btn-primary btn-block" id="login" type="submit">Login</button>
                          </div>
                      </form>
                      <button class="btn btn-primary btn-block" id="register">Register</button>
                  </div>
              </div>
        </div>
    </c:if>
    <c:if test="${id != null}">
        <div class="card-body" id="status">
            <button class="btn btn-primary btn-block" id="update">Update</button>
            <button class="btn btn-primary btn-block" id="logout">Logout</button>
        </div>
    </c:if>
</c:catch>


<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.5.3/js/bootstrap.js"></script>
<script src="./login.js"></script>

</body>
</html>