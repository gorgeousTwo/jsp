<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
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

    String enterId = request.getParameter("enterId");
    String enterPasswd = request.getParameter("enterPasswd");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String result = "";

    try {


        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "sys as sysdba", "akqjqthsuvkfnfn!");


    } catch (ClassNotFoundException classEX) {
        classEX.printStackTrace();
    }

    try {
        pstmt = conn.prepareStatement("SELECT ID, PWD FROM MEMBER WHERE ID =?");
        pstmt.setString(1, enterId);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            String rId = rs.getString("ID");
            String rPw = rs.getString("PWD");

            if (enterId.equals(rId) && enterPasswd.equals(rPw)) {
                pstmt = conn.prepareStatement("DELETE FROM MEMBER WHERE ID =?");
                pstmt.setString(1, enterId);
                pstmt.executeUpdate();
                result = "DELETE TABLE RECORD";
            } else
                result = "PASSWORD ERROR";
        } else
            result = "ID ERROR";
    } catch (SQLException sqlEX) {
        sqlEX.printStackTrace();
    }finally {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException sqlEX) {}
        }

        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException sqlEX) {}

        }

        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException sqlEX) {}

        }
    }
%>

<div class="container col-8">
    <div class="jumbotron shadow-lg p-3 mb-5 rounded">
        <h5 class="text-center text-primary display-1">Processing Result</h5>
        <p class="text-center text-secondary display-4"><%=result%></p>
    </div>
</div>


<script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
        crossorigin="anonymous"></script>
<script src="../bootstrap-4.5.3-dist/js/bootstrap.js"></script>
<script src="../bootstrap-4.5.3-dist/js/bootstrap.bundle.js"></script>
</body>
</html>
