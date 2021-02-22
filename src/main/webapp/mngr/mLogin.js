//ECMA 6.1 +
'use strict';

window.onload = function () {
    document.getElementById("login").addEventListener('click',function () {
        let query = {
            id : document.getElementById("ld").value,
            pwd : document.getElementById('pwd').value
        };

        let request = new XMLHttpRequest();
        request.open('POST','/shoppingmall/mg/managerLoginPro.do');
        request.setRequestHeader("Content-Type","application/json;charset=UTF-8");
        request.send(JSON.stringify(query));
    });
}