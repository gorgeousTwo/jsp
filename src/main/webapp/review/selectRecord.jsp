<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ page import="java.sql.*"%>
<html>
<head>

    <%--Meta Tags--%>
    <meta name="viewport" content="width=device-height, initial-scale=1, shrink-to-fit=no"/>

    <link rel="stylesheet" href="../bootstrap-4.5.3-dist/css/bootstrap-grid.min.css"/>
    <link rel="stylesheet" href="../bootstrap-4.5.3-dist/css/bootstrap-reboot.min.css"/>
    <link rel="stylesheet" href="../bootstrap-4.5.3-dist/css/bootstrap.min.css"/>

    <title>selectRecord</title>
</head>
<body>

<div class="container col-8">
    <table class="table">
        <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">PASSWORD</th>
                <th scope="col">NAME</th>
                <th scope="col">GENDER</th>
                <th scope="col">BIRTHDAY</th>
                <th scope="col">PHONE</th>
                <th scope="col">EMAIL</th>
                <th scope="col">REGDATE</th>
            </tr>
        </thead>
        <tbody>
            <%
                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;

                try {
                    String url = "jdbc:oracle:thin:@localhost:1521:XE";
                    String id = "sys as sysdba";
                    String passwd = "akqjqthsuvkfnfn!";

                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    conn = DriverManager.getConnection(url, id, passwd);
                } catch (ClassNotFoundException classEXCEPTION) {
                    classEXCEPTION.printStackTrace();
                }

                try {
                    String sql = "SELECT * FROM MEMBER";
                    pstmt = conn.prepareStatement(sql);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        String id = rs.getString(1);
                        String password = rs.getString(2);
                        String name = rs.getString(3);
                        String gender = rs.getString(4);
                        String birthday = rs.getString(5);
                        String phone = rs.getString(6);
                        String email = rs.getString(7);
                        Timestamp regdate = rs.getTimestamp(8);
            %>
            <tr>
                <th><%=id%></th>
                <th><%=password%></th>
                <th><%=name%></th>
                <th><%=gender%></th>
                <th><%=birthday%></th>
                <th><%=phone%></th>
                <th><%=email%></th>
                <th><%=regdate%></th>
            </tr>
            <% }
                } catch (SQLException sqlEXCEPTION) {
                    sqlEXCEPTION.printStackTrace();
                }finally {
                    if (rs != null) {
                        try {
                            rs.close();
                        } catch (SQLException sqlException) {
                        }
                    }

                    if (pstmt != null) {
                        try {
                            pstmt.close();
                        } catch (SQLException sqlException) {
                        }
                    }

                    if (conn != null) {
                        try {
                            conn.close();
                        } catch (SQLException sqlException) {
                        }
                    }
            }
            %>
        </tbody>
    </table>
</div>


<script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
        crossorigin="anonymous"></script>
<script src="../bootstrap-4.5.3-dist/js/bootstrap.js"></script>
<script src="../bootstrap-4.5.3-dist/js/bootstrap.bundle.js"></script>
</body>
</html>
