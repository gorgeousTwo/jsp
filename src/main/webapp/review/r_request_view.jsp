<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>

    <%--Meta Tags--%>
    <meta name="viewport" content="width=device-height, initial-scale=1, shrink-to-fit=no"/>

    <link rel="stylesheet" href="../bootstrap-4.5.3-dist/css/bootstrap-grid.min.css"/>
    <link rel="stylesheet" href="../bootstrap-4.5.3-dist/css/bootstrap-reboot.min.css"/>
    <link rel="stylesheet" href="../bootstrap-4.5.3-dist/css/bootstrap.min.css"/>

        <style>
            .profile-head {
                transform: translateY(5rem)
            }

            .cover {
                background-image: url(https://images.unsplash.com/photo-1530305408560-82d13781b33a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1352&q=80);
                background-size: cover;
                background-repeat: no-repeat
            }

            body {
                background: #654ea3;
                background: linear-gradient(to right, #e96443, #904e95);
                min-height: 100vh
            }
        </style>

    <title>User_Information</title>
</head>
<body>

    <%

        request.setCharacterEncoding("utf-8");

        String Name = request.getParameter("Name");
        String Id = request.getParameter("Id");
        String Address = request.getParameter("Address");
        String Message = request.getParameter("Message");
    %>

    <div class="row py-5 px-4">
        <div class="col-md-5 mx-auto">

            <div class="bg-white shadow rounded overflow-hidden">
                <div class="px-4 pt-0 pb-4 cover">
                    <div class="media align-items-end profile-head">
                        <div class="profile mr-3">
                            <img src="https://http.cat/404" alt="nothing here." width="130" class="rounded mb-2 img-thumbnail">
                            <a href="#" class="btn btn-outline-dark btn-sm btn-block">Edit profile</a>
                        </div>
                        <div class="media-body mb-5 text-white">
                            <h4 class="mt-0 mb-0"><%=Name%><small>(<%=Id%>)</small></h4>
                            <p class="small mb-4"><i class="fas fa-map-marker-alt mr-2"></i><%=Address%></p>
                        </div>
                    </div>
                </div>
                <div class="bg-light p-4 d-flex justify-content-end text-center">
                    <ul class="list-inline mb-0">
                        <li class="list-inline-item"><h5 class="font-weight-bold mb-0 d-block">21</h5><small
                        class="text-muted"><i class="fas fa fa-image mr-1"></i>PickPocket</small></li>
                        <li class="list-inline-item"><h5 class="font-weight-bold mb-0 d-block">7</h5><small
                        class="text-muted"><i class="fas fa fa-image mr-1"></i>Threat</small></li>
                        <li class="list-inline-item"><h5 class="font-weight-bold mb-0 d-block">54</h5><small
                        class="text-muted"><i class="fas fa fa-image mr-1"></i>Killing</small></li>
                    </ul>
                </div>
                <div class="px-4 py-3">
                    <h5 class="mb-0">Message</h5>
                    <div class="p-4 rounded shadow-sm bg-light">
                        <p class="font-italic mb-0"><%=Message%></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
        crossorigin="anonymous"></script>
<script src="../bootstrap-4.5.3-dist/js/bootstrap.js"></script>
<script src="../bootstrap-4.5.3-dist/js/bootstrap.bundle.js"></script>
</body>
</html>
