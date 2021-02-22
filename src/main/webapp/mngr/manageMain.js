//ECMA 6.1 +
'use strict';

let status = true;

window.onload = function () {
    document.getElementById('registProduct').addEventListener('click',function () {
        window.location.href("/shoppingmall/mg/bookRegisterForm.do");
    });

    document.getElementById('updateProduct').addEventListener('click',function () {
        window.location.href("/shoppingmall/mg/bookList.do?book_kind=all");
    });

    document.getElementById('orderedProduct').addEventListener('click',function () {
        window.location.href("/shoppingmall/mg/orderList.do");
    });

    document.getElementById('qna').addEventListener('click',function () {
        window.location.href("/shoppingmall/mg/qnaList.do");
    });

}