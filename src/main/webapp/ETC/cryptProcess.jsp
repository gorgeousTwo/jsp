<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,javax.naming.*" %>
<%@ page import="view.jb.section02.UpdateDataBean" %>
<%@ page import="java.util.List" %>
<%@ page import="view.jb.section02.UpdateDBBean" %>
<html>
<head>

    <%--Meta Tags--%>
    <meta name="viewport" content="width=device-height, initial-scale=1, shrink-to-fit=no"/>

    <link rel="stylesheet" href="../../bootstrap-4.5.3-dist/css/bootstrap-grid.min.css"/>
    <link rel="stylesheet" href="../../bootstrap-4.5.3-dist/css/bootstrap-reboot.min.css"/>
    <link rel="stylesheet" href="../../bootstrap-4.5.3-dist/css/bootstrap.min.css"/>

    <title>PWD hashing</title>
</head>
<body>

<%
    List<UpdateDataBean> memberList = null;
    UpdateDBBean dbPro = UpdateDBBean.getInstance();
    memberList = dbPro.getMembers();
%>

<table class="table">
    <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">PWD</th>
        </tr>
    </thead>
    <tbody>
        <%
            for (int i = 0; i < memberList.size(); i++) {
                UpdateDataBean member = (UpdateDataBean) memberList.get(i);
                String bId = member.getEnterId();
                String bPwd = member.getEnterPwd();

        %>
        <tr>
            <td><%=bId%></td>
            <td><%=bPwd%></td>
        </tr>
        <%}%>
    </tbody>
</table>


<script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
        crossorigin="anonymous"></script>
<script src="../../bootstrap-4.5.3-dist/js/bootstrap.js"></script>
<script src="../../bootstrap-4.5.3-dist/js/bootstrap.bundle.js"></script>
</body>
</html>
