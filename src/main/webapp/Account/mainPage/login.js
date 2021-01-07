
$(document).ready(function () {
    $("#register").click(function () {
        $("#main_auth").load("../registerPage/registerForm.jsp");
    });
});
//document ready -> #register object click -> load jsp page.