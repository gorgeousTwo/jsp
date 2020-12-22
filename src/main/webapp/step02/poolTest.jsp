<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,javax.naming.*"%>
<html>
<head>

    <%--Meta Tags--%>
    <meta name="viewport" content="width=device-height, initial-scale=1, shrink-to-fit=no"/>

    <link rel="stylesheet" href="../bootstrap-4.5.3-dist/css/bootstrap-grid.min.css"/>
    <link rel="stylesheet" href="../bootstrap-4.5.3-dist/css/bootstrap-reboot.min.css"/>
    <link rel="stylesheet" href="../bootstrap-4.5.3-dist/css/bootstrap.min.css"/>

    <title>Connection pool test</title>
</head>
<body>

    <table class="table">
        <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">PWD</th>
                <th scope="col">NAME</th>
                <th scope="col">GENDER</th>
                <th scope="col">BIRTHDAY</th>
                <th scope="col">PHONE</th>
                <th scope="col">EMAIL</th>
                <th scope="col">REG_DATE</th>
            </tr>
        </thead>
        <tbody>
            <%
                Connection conn = null;
                PreparedStatement preparedStatement = null;
                ResultSet rs = null;

                try {
                    Context initCtx = new InitialContext();
                    Context envCtx = (Context) initCtx.lookup("java:comp/env");
                    DataSource ds = (DataSource)envCtx.lookup("jdbc/test");
                    conn = ds.getConnection();
                } catch (SQLException sqlException1) {
                    sqlException1.printStackTrace();
                }

                try {
                    preparedStatement = conn.prepareStatement("SELECT * FROM MEMBER");
                    rs = preparedStatement.executeQuery();

                    while(rs.next()) {
                        String ID = rs.getString("ID");
                        String PWD = rs.getString("PWD");
                        String NAME = rs.getString("NAME");
                        String GENDER = rs.getString("GENDER");
                        String BIRTHDAY = rs.getString("BIRTHDAY");
                        String PHONE = rs.getString("PHONE");
                        String EMAIL = rs.getString("EMAIL");
                        Timestamp REG_DATE = rs.getTimestamp("REGDATE");
                        %>
                            <tr>
                                <th><%=ID%></th>
                                <th><%=PWD%></th>
                                <th><%=NAME%></th>
                                <th><%=GENDER%></th>
                                <th><%=BIRTHDAY%></th>
                                <th><%=PHONE%></th>
                                <th><%=EMAIL%></th>
                                <th><%=REG_DATE%></th>
                            </tr>

            <% }

                } catch (SQLException sqlException2) {
                    sqlException2.printStackTrace();
                }finally{
                    if (rs != null) {
                        try {
                            rs.close();
                        } catch (SQLException sqlException) {}
                    }

                    if (preparedStatement != null) {
                        try {
                            preparedStatement.close();
                        } catch (SQLException sqlException) {}

                    }

                    if (conn != null) {
                        try {
                            conn.close();
                        } catch (SQLException sqlException) {}

                    }
            }
            %>
        </tbody>
    </table>


<script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
        crossorigin="anonymous"></script>
<script src="../bootstrap-4.5.3-dist/js/bootstrap.js"></script>
<script src="../bootstrap-4.5.3-dist/js/bootstrap.bundle.js"></script>
</body>
</html>
