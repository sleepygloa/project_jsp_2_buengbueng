$(document).ready(function() {
	window.setInterval("state()", 5000); // 5초에 한 번씩 좌석 이용 현황 확인
});

$(document).ready(function() {
	window.setInterval("bossstate()", 5000); // 5초에 한 번씩 좌석 이용 현황 확인
});

function state() {
   $.ajax({
      url : "userOrderForm.do",
      type : "post",
      data : {
         tf : "1",
         name: document.getElementById("name").value,
         id: document.getElementById("id").value
      },
      success : function(data) {
         $(".userMenuStatus").html(data);
      }
   });
}

function bossstate() {
   $.ajax({
      url : "menuOrderListForm.do",
      type : "post",
      data : {
         tf : "1",
         l_key : document.getElementById("l_key").value
      },
      success : function(data) {
         $(".bossMenuStatus").html(data);
      }
   });
}