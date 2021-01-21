<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<html>
<head>

    <%--Meta Tags--%>
    <meta name="viewport" content="width=device-height, initial-scale=1, shrink-to-fit=no"/>

    <link rel="stylesheet" href="../../bootstrap-4.5.3-dist/css/bootstrap-grid.min.css"/>
    <link rel="stylesheet" href="../../bootstrap-4.5.3-dist/css/bootstrap-reboot.min.css"/>
    <link rel="stylesheet" href="../../bootstrap-4.5.3-dist/css/bootstrap.min.css"/>

    <title>updateProcessing</title>
</head>
<body>

<%
    request.setCharacterEncoding("utf-8");
%>

<%
    String enterId = request.getParameter("enterId");
    String enterPasswd = request.getParameter("enterPasswd");
    String enterName = request.getParameter("enterName");
    String enterGender = request.getParameter("enterGender");
    String enterBirthday = request.getParameter("enterBirthday");
    String enterTel = request.getParameter("enterTel");
    String enterEmail = request.getParameter("enterEmail");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        String url = "jdbc:oracle:thin:@localhost:1521:XE";
        String id = "sys as sysdba";
        String passwd = "akqjqthsuvkfnfn!";

        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(url, id , passwd);

    } catch (ClassNotFoundException classEXCEPTION) {
        classEXCEPTION.printStackTrace();
    }

    try {
        pstmt = conn.prepareStatement("SELECT ID, PWD FROM MEMBER WHERE ID =?");
        pstmt.setString(1, enterId);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            String rId = rs.getString("ID");
            String rPassword = rs.getString("PWD");

            if (enterId.equals(rId) && enterPasswd.equals(rPassword)) {
                pstmt = conn.prepareStatement("UPDATE MEMBER SET NAME = ?, GENDER = ?, BIRTHDAY = ?, PHONE = ?, EMAIL = ? WHERE ID = ?");
                pstmt.setString(1, enterName);
                pstmt.setString(2, enterGender);
                pstmt.setString(3, enterBirthday);
                pstmt.setString(4, enterPasswd);
                pstmt.setString(5, enterEmail);
                pstmt.setString(6, enterId);
                pstmt.executeUpdate();
                out.println("UPDATE TABLE RECORD");
            } else
                out.println("PASSWD ERROR");
            } else
                out.println("ID ERROR");

    } catch (SQLException sqlEXCEPTION) {
        sqlEXCEPTION.printStackTrace();
    }finally{
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException sqle) {
            }
        }

        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException sqle) {
            }

        }

        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException sqle) {
            }
        }
    }
%>

<div class="container col-8">
    <div class="jumbotron shadow-lg p-3 mb-5 rounded">
        <h5 class="text-center text-primary display-1">Processing Result</h5>
    </div>
</div>


<script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
        crossorigin="anonymous"></script>
<script src="../../bootstrap-4.5.3-dist/js/bootstrap.js"></script>
<script src="../../bootstrap-4.5.3-dist/js/bootstrap.bundle.js"></script>
</body>
</html>
