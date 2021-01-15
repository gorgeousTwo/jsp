$(document).ready(function () {
    $('#register').click(function () {
        $('#main_auth').load('/account/registerForm.jsp');
    });
});