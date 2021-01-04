var status = true;

$(document).ready(function () {
    //confirm check
    $("#checkId").click(function () {
        if ($("#enterId").val()) {
            var query = {enterId:$("#enterId").val()};

            $.ajax({
                type:"post",
                url:"./isConfirmed.jsp",
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


       }
    });

    function checkIt() {

    };
})