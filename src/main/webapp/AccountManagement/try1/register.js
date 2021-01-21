let status = true;
const link = 'main.jsp';

$(document).ready(function () {

    $('#checkId').click(function () {
        $.ajax({
            url: 'isConfirmed.jsp',
            data: ({
                userId: $("input[name=enterId]").val()
            }),
            success: function (data) {
                if (data == 1) {
                    alert("X");
                    $('input[name=enterId]').val('');
                }else if (data == -1) {
                    alert("O");
                    $('input[name=enterId]').focus();
                }
            }
        });
    })

    $('#submit').click(function () {
        checkIt();

        if (status) {
            let query = {
                id: $('#enterId').val(),
                pwd: $('#enterPasswd').val(),
                name: $('#enterName').val(),
                address: $('#enterAddress').val(),
                tel: $('#enterTel').val()
            };

            $.ajax({
                type: 'POST',
                url: '/account/registerPro.jsp',
                data: query,
                success: function (data) {
                    window.location.href = link;
                }
            });
        }
    });

    $('#cancel').click(function () {
        window.location.href = link;
    });

    function checkIt() {
        status = true;

        if (!$('#enterId').val()) {
            alert('Please enter the Id');
            $('#enterId').focus();
            status = false;
            return false;
        }

        if ($('#enterPasswd').val() != $('#checkPwd').val()) {
            alert('Check PWD');
            $('#checkPwd').focus();
            status = false;
            return false;
        }

        if (!$('#enterName').val()) {
            alert('Please enter the Name');
            $('#enterName').focus();
            status = false;
            return false;
        }

        if (!$('#enterAddress').val()) {
            alert('Please enter the Address');
            $('#enterAddress').focus();
            status = false;
            return false;
        }

        if (!$('#enterTel').val()) {
            alert('Please enter the Tel');
            $('#enterTel').focus();
            status = false;
            return false;
        }
    }
})