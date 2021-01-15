let status = true;
const link = 'main.jsp';

$(document).ready(function () {
    //check isConfirmed
    $('#checkId').click(function () {
        //not null,
        if ($('#enterId').val()) {
            let query = {
                //key enterId's property == enterId.val()
                enterId: $('#enterId').val()
            };

            $.ajax({
                type: 'POST',
                url: '/account/isConfirmed.jsp',
                data: query,
                success: function (data) {
                    if (data == 1) {
                        alert('Not available. initialize the Id you entered.');
                        $('#enterId').val('');
                    } else if (data == -1) {
                        alert('Available Id.');
                    }
                }
            });
        } else {
            alert('Please enter the Id');
            $('#enterId').focus();
        }
    });

    $('#submit').click(function () {
        checkIt();

        if (status) {
            let query = {
                enterId: $('#enterId').val(),
                enterPasswd: $('#enterPasswd').val(),
                enterName: $('#enterName').val(),
                enterAddress: $('#enterAddress').val(),
                enterTel: $('#enterTel').val()
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