<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ page import="java.sql.*"%>
<html>
<head>

    <%--Meta Tags--%>
    <meta name="viewport" content="width=device-height, initial-scale=1, shrink-to-fit=no"/>

    <link rel="stylesheet" href="../bootstrap-4.5.3-dist/css/bootstrap-grid.min.css"/>
    <link rel="stylesheet" href="../bootstrap-4.5.3-dist/css/bootstrap-reboot.min.css"/>
    <link rel="stylesheet" href="../bootstrap-4.5.3-dist/css/bootstrap.min.css"/>

    <title>select MEMBER</title>
</head>
<body>
    <div class="container col-8">
        <div class="jumbotron">
            <table class="table table-dark">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">PW</th>
                        <th scope="col">NAME</th>
                        <th scope="col">REG_DATE</th>
                        <th scope="col">ADDRESS</th>
                        <th scope="col">TEL</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Connection conn = null;
                        PreparedStatement pstmt = null;
                        ResultSet rs = null;
                        int line = 1;

                        try {
                            String uri = "jdbc:oracle:thin:@localhost:1521:XE";
                            String id = "sys as sysdba";
                            String pw = "0Akqjqthsuvkfnfn!";

                                Class.forName("oracle.jdbc.driver.OracleDriver");
                                conn = DriverManager.getConnection(uri, id, pw);

                                String sql =  "SELECT * FROM MEMBER";
                                pstmt = conn.prepareStatement(sql);
                                rs = pstmt.executeQuery();

                                while(rs.next()) {
                                    String ID = rs.getString("ID");
                                    String PW = rs.getString("PASSWD");
                                    String NAME = rs.getString("NAME");
                                    Timestamp REG_DATE = rs.getTimestamp("REG_DATE");
                                    String ADDRESS = rs.getString("ADDRESS");
                                    String TEL = rs.getString("TEL");
                                    %>
                                        <tr>
                                            <td><%=ID%></td>
                                            <td><%=PW%></td>
                                            <td><%=NAME%></td>
                                            <td><%=REG_DATE%></td>
                                            <td><%=ADDRESS%></td>
                                            <td><%=TEL%></td>
                                    <% }
                        }catch (Exception e) {
                            e.printStackTrace();
                        }finally{
                            if (rs != null) {
                                try {
                                    rs.close();
                                } catch (SQLException sqle) {}
                            }

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
                </tbody>
            </table>
        </div>
    </div>

<script src="bootstrap-4.5.3-dist/js/bootstrap.min.js"></script>
<script src="bootstrap-4.5.3-dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>