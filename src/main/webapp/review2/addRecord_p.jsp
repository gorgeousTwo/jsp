<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<html>
<head>

    <%--Meta Tags--%>
    <meta name="viewport" content="width=device-height, initial-scale=1, shrink-to-fit=no"/>

    <link rel="stylesheet" href="../bootstrap-4.5.3-dist/css/bootstrap-grid.min.css"/>
    <link rel="stylesheet" href="../bootstrap-4.5.3-dist/css/bootstrap-reboot.min.css"/>
    <link rel="stylesheet" href="../bootstrap-4.5.3-dist/css/bootstrap.min.css"/>

    <title>result</title>
</head>
<body>

    <%
        request.setCharacterEncoding("utf-8");

        String Id = request.getParameter("Id");
        String Password = request.getParameter("Password");
        String Name = request.getParameter("Name");
        String Gender = request.getParameter("Gender");
        String Birthday = request.getParameter("Birthday");
        String Phone = request.getParameter("Phone");
        String Email = request.getParameter("Email");

        Timestamp Regdate = new Timestamp(System.currentTimeMillis());

        Connection conn = null;
        PreparedStatement pstmt = null;
        String str ="";

        try {
            String url = "jdbc:oracle:thin:@localhost:1521:XE";
            String id = "sys as sysdba";
            String passwd = "akqjqthsuvkfnfn!";

            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(url, id, passwd);

            String sql = "INSERT INTO MEMBER VALUES (?,?,?,?,?,?,?,?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, Id);
            pstmt.setString(2, Password);
            pstmt.setString(3, Name);
            pstmt.setString(4, Gender);
            pstmt.setString(5, Birthday);
            pstmt.setString(6, Phone);
            pstmt.setString(7, Email);
            pstmt.setTimestamp(8, Regdate);
            pstmt.executeUpdate();


            out.println("Success");
        } catch (Exception e) {
            e.printStackTrace();
            out.println("Failed");
        }finally{
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqle) {}
            }

            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException sqle) {}
            }
        }
    %>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
        crossorigin="anonymous"></script>
<script src="../bootstrap-4.5.3-dist/js/bootstrap.js"></script>
<script src="../bootstrap-4.5.3-dist/js/bootstrap.bundle.js"></script>
</body>
</html>
