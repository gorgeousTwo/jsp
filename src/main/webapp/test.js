//ECMA 6.1 +
'use strict';

let request = new XMLHttpRequest();

function searchFunction() {
    request.open("POST", "./UserSearchServlet?userName=" + encodeURIComponent(document.getElementById("userName").value),true);
    request.onreadystatechange = searchProcess;
    request.send(null);

}

function searchProcess() {
    let table = document.getElementById("ajaxTable");
    table.innerHTML = "";
    if (request.readyState = 4 && request.status == 200) {
        let object = eval('(' + request.responseText + ')');
        let result = object.result;
        for (let i = 0; i < result.length; i++) {
            let row = table.insertRow(0);
            for (let j = 0; j < result[i].length; j++) {
                let cell = row.insertCell(j);
                cell.innerHTML = result[i][j].value;
            }
        }
    }
}