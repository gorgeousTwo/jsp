<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>

    <%--Meta Tags--%>
    <meta name="viewport" content="width=device-height, initial-scale=1, shrink-to-fit=no"/>

    <link rel="stylesheet" href="../../bootstrap-4.5.3-dist/css/bootstrap-grid.min.css"/>
    <link rel="stylesheet" href="../../bootstrap-4.5.3-dist/css/bootstrap-reboot.min.css"/>
    <link rel="stylesheet" href="../../bootstrap-4.5.3-dist/css/bootstrap.min.css"/>

    <title>JDBC_Objects</title>
</head>
<body>
    <%
        /*
        1.DriverManager class | 'CONNECTION'
        : try {
            //Use Class.forName()
            Class.forName("jdbc.here.Driver");
            //implement interface driver
        } catch (ClassNotFoundException e) {}

        try {
            Connection conn = DriverManager.getConnection(url,user,password);
            //implement Connection interface
        } catch (SQLException e) {}

        2.Connection interface
        : Connection conn = DriverManager.getConnection(url,user,passwd);
        //The Object(example/conn) implement Connection Interface is expression of DB Connection Object.

        The Object 'conn' is used get Statement/PreparedStatement/CallableStatement Object.

        For example:
            Statement stmt = conn.createStatement();
            PreparedStatement pstmt = conn.preparedStatement(sql);
            CallableStatement cstmt = conn.prepareCall();

        3.Statement Interface (RIP)
        : Connection Object conn = conn.createStatement();
        method 'createStatement' is causes SQLException.

        try {
            Statement stmt = conn.createStatement();
        } catch (SQLException e) {}

        4.PreparedStatement
        : prepare~ for prince ali~
        conn.preparedStatement(sql);
        The preparedStatement interface allows you to define SQLStatement using placeholder for each argument.

        try {
            String sql = "insert into member values(?,?,?,?)";
            PreparedStatement pstmt = conn.preparedStatement(sql);
            pstmt.setString(1,id);
            pstmt.setString(2,passwd);

            etc...
        } catch (SQLException e) {
            e.printStackTrace();
        }

        setXxx(num, var)
            num == placeholder(?)
            var == Stores data value in fields(allow to variable types)

        5.CallableStatement interface
        : SQLException AGAIN AGAIN AGAIN.

        try {
            CallableStatement cstmt = connection.preparedCall()
        } catch (SQLException e) { e.printStackTrace(); }

        conn.preparedCall(" {call query1} ");
            {call procedure_name([?,?,..])} Just Call
            {? = call procedure_name[(?,?,..)]} Call and return result
            {call procedure_name} Calling procedure(without Parameter)

       6.ResultSet interface
       : executeQuery() return ResultSet Object. have table.(Query result). yo. wow. yo yo.
       cursor = allow to reference Result Object
         */
    %>
    <div class="container">
        <div class="jumbotron">
            <p class="text-center text-primary display-1">Nothing but 'F12'</p>
        </div>
    </div>

<script src="bootstrap-4.5.3-dist/js/bootstrap.min.js"></script>
<script src="bootstrap-4.5.3-dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>