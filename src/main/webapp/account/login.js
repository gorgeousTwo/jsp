let status = true;

$(document).ready(function () {
    $('#register').click(function () {
        $('#main_auth').load('/account/registerForm.jsp');
    });

    $('#login').click(function () {
        checkIt();
        if (status) {
            let query = {
                id: $('#enterId').val(),
                pwd: $('#enterPasswd').val()
            };

            $.ajax({
                type: 'POST',
                url: 'loginPro.jsp',
                data: query,
                success: function (data) {
                    if (data == 1) {
                        $('#main_auth').load('loginForm.jsp');
                    }else if (data == 0) {
                        alert('PWD X');
                        $('#enterId').val('');
                        $('#enterPasswd').val('');
                    }else if (data == -1) {
                        alert('ID X');
                        $('#enterId').val('');
                        $('#enterPasswd').val('');
                    }
                }
            });
        };
    });

    $('#update').click(function () {
        $('#main_auth').load('modify.jsp');
    });

    $('#logout').click(function () {
        $.ajax({
            type: 'POST',
            url: 'logout.jsp',
            success: function (data) {
                $('#main_auth').load('loginForm.jsp');
            }
        })
    });

    function checkIt() {
        status = true;
        if (!$.trim($('#enterId').val())) {
            alert("Enter ID");
            $('#enterId').focus();
            status = false;
            return false;
        }

        if (!$.trim($('#enterPasswd').val())) {
            alert("enter PWD");
            $('#enterPasswd').focus();
            status = false;
            return false;
        }
    }
});