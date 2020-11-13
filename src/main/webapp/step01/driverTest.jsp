<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<html>
<head>

    <%--Meta Tags--%>
    <meta name="viewport" content="width=device-height, initial-scale=1, shrink-to-fit=no"/>

    <link rel="stylesheet" href="../bootstrap-4.5.3-dist/css/bootstrap-grid.min.css"/>
    <link rel="stylesheet" href="../bootstrap-4.5.3-dist/css/bootstrap-reboot.min.css"/>
    <link rel="stylesheet" href="../bootstrap-4.5.3-dist/css/bootstrap.min.css"/>

    <title>Driver Connection Test</title>
</head>
<body>
    <%
        Connection conn = null;
         try {
             String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:XE";
             String dbId = "sys as sysdba";
             String dbPw = "0Akqjqthsuvkfnfn!";

             Class.forName("oracle.jdbc.driver.OracleDriver");
             conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
             out.println("Connection.");
         }catch (Exception e) {
             e.printStackTrace();
         }
    %>


<script src="bootstrap-4.5.3-dist/js/bootstrap.min.js"></script>
<script src="bootstrap-4.5.3-dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>