<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ page import="java.sql.*"%>
<html>
<head>

    <%--Meta Tags--%>
    <meta name="viewport" content="width=device-height, initial-scale=1, shrink-to-fit=no"/>

    <link rel="stylesheet" href="../../bootstrap-4.5.3-dist/css/bootstrap-grid.min.css"/>
    <link rel="stylesheet" href="../../bootstrap-4.5.3-dist/css/bootstrap-reboot.min.css"/>
    <link rel="stylesheet" href="../../bootstrap-4.5.3-dist/css/bootstrap.min.css"/>

    <title>Record_Processing</title>
</head>
<body>
    <%
        request.setCharacterEncoding("utf-8");
        String result = "";
    %>

    <%
        String enterID = request.getParameter("enterID");
        String enterPW = request.getParameter("enterPW");
        String enterNAME = request.getParameter("enterNAME");
        String enterADDRESS = request.getParameter("enterADDRESS");
        String enterTEL = request.getParameter("enterTEL");
        Timestamp REG_DATE = new Timestamp(System.currentTimeMillis());

        Connection conn = null;
        PreparedStatement pstmt = null;
        String str="";

        try {
            String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:XE";
            String dbId = "sys as sysdba";
            String dbPw = "0Akqjqthsuvkfnfn!";

            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);

            String sql = "INSERT INTO MEMBER VALUES (?,?,?,?,?,?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, enterID);
            pstmt.setString(2, enterPW);
            pstmt.setString(3, enterNAME);
            pstmt.setTimestamp(4, REG_DATE);
            pstmt.setString(5, enterADDRESS);
            pstmt.setString(6, enterTEL);
            pstmt.executeUpdate();

            result = "True";

        } catch (Exception e) {
            e.printStackTrace();
            result = "Fuck";
        }finally{
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqle) {}

                if (conn != null) {
                    try {
                        conn.close();
                    } catch (SQLException sqle) {}
                }
            }
        }
    %>

    <div class="container col-8">
        <div class="jumbotron shadow-lg p-3 mb-5 rounded">
            <h5 class="text-center text-primary display-1">Processing Result</h5>
            <p class="text-center text-primary"><%=result%></p>
        </div>
    </div>

<script src="bootstrap-4.5.3-dist/js/bootstrap.min.js"></script>
<script src="bootstrap-4.5.3-dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>