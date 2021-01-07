var status = true;

$(document).ready(function () {
    //confirm check
    $("#checkId").click(function () {
        if ($("#enterId").val()) {
            var query = {enterId:$("#enterId").val()};

            $.ajax({
                type:"post",
                url:"isConfirmed.jsp",
                data:query,
                success:function (data) {
                    if (data == 1) {
                        alert("Fuck off");
                        $("#enterId").val("");
                    }else if (data == -1) {
                        alert("You can use that");
                    }
                }
            });
        } else {
            alert("Enter Id");
            $("#enterId").focus();
        }
    });

    //register submit
    $("#submit").click(function () {
       checkIt();

       if (status) {
           var query = {enterId:$("#enterId").val(),
               enterPwd:$("#enterPwd").val(),
               enterName:$("#enterName").val(),
               enterAddress:$("#enterAddress").val(),
               enterTel:$("#enterTel").val()};

           $.ajax({
               type:"post",
               url:"registerPro.jsp",
               data:query,
               success:function(data) {
                   window.location.href("main.jsp");
               }
           })
       }
    });

    $("#cancel").click(function () {
        window.location.href("src/main/webapp/index.jsp");
    });


    //alert("please enter ??...);
    function checkIt() {
        status = true;
        if (!$("#enterId").val() ) {
            alert("Please enter fucking Id");
            $("#enterId").focus();
            status = false;
            return false;
        };

        if (!$("#enterPasswd").val() ) {
            alert("Please enter pwd");
            $("#enterPasswd").focus();
            status = false;
            return false;
        }

        if (!$("#enterPasswd").val() != $("#checkPwd").val() ) {
            alert("Please check pwd");
            $("#checkPwd").focus();
            status = false;
            return false;
        }

        if (!$("#enterName").val() ) {
            alert("Please enter name");
            $("#enterName").focus();
            status = false;
            return false;
        }

        if (!$("#enterAddress").val() ) {
            alert("Please enter address");
            $("#enterAddress").focus();
            status = false;
            return false;
        }

        if (!$("#enterTEL").val() ) {
            alert("Please enter tel");
            $("#enterTEL").focus();
            status = false;
            return false;
        }
    };
})