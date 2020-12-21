<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>

    <%--Meta Tags--%>
    <meta name="viewport" content="width=device-height, initial-scale=1, shrink-to-fit=no"/>

    <link rel="stylesheet" href="../bootstrap-4.5.3-dist/css/bootstrap-grid.min.css"/>
    <link rel="stylesheet" href="../bootstrap-4.5.3-dist/css/bootstrap-reboot.min.css"/>
    <link rel="stylesheet" href="../bootstrap-4.5.3-dist/css/bootstrap.min.css"/>

    <title>Title</title>
</head>
<body>

<%
    request.setCharacterEncoding("utf-8");

    /*

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    request.getParameter();

    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn = DriverManager.getConnection(url, id, pwd);

    pstmt = conn.prepareStatement("SELECT ID, PWD FROM MEMBER WHERE = ?");
    pstmt.setString(1, enterId);
    rs = pstmt.executeQuery();

    String rId = rs.getString(1, ID);
    String rPwd = rs.getString(2, PWD);

    if (enterId.equals(rID) && enterPassword.equals(rPwd) {
        ... getString * 7

        pstmt = conn.preparedStatement("UPDATE MEMBER SET NAME = ?, GENDER = ?, BIRTHDAY = ?, PHONE = ?, EMAIL = ? WHERE ID = ?");
        pstmt.setString();
        pstmt.executeUpdate();

        rs.close;
        pstmt.close;
        conn.close;
    }


     */
%>

<div class="container col-8">
    <div class="jumbotron shadow-lg p-3 mb-5 rounded">
        <h5 class="text-center text-primary display-1">Processing Result</h5>
        <p class="text-center text-primary">Result</p>
    </div>
</div>


<script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
        crossorigin="anonymous"></script>
<script src="../bootstrap-4.5.3-dist/js/bootstrap.js"></script>
<script src="../bootstrap-4.5.3-dist/js/bootstrap.bundle.js"></script>
</body>
</html>
