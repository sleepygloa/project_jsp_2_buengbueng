<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- HEADER TEMPLATE -->
<jsp:include page="../../header.jsp" />

<style>
#toast-container{
	width: 70%;
	margin:0 auto;
}

.ghost-btn-info{
color:#E0E2E3;
font-weight:800;
background-color:#319DBC;
border:white 1px solid;
width: 100px;
height:30px;
font-size:1.2em;
vertical-align:middle;
float:right;
margin-right:10px;
}
.ghost-btn-warning{
color:#E0E2E3;
font-weight:800;
background-color:#F79E1F;
border:white 1px solid;
width: 100px;
height:30px;
font-size:1.2em;
vertical-align:middle;
float:right;
margin-right:10px;
}
</style>

<style type="text/css">
    body {
        padding : 0;
        font-family : "Lucida Grande", Helvetica, Arial, Verdana,sans-serif;
        font-size : 14px;
        background-color:#fff;
    }
    #calendar {
        max-width : 900px;
        margin : 0 auto;
    }
.popup {
    position: absolute;
    display: inline-block;
    cursor: pointer;
    top:30%;
  	left:30%;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    margin:-50px 0 0 -50px;
}

/* The actual popup */
.popup .popuptext {
	display:none;
/*     visibility: hidden; */
    width: 300px;
    background-color: #555;
    color: #fff;
    text-align: center;
    border-radius: 6px;
    padding: 8px 0;
    position: relative;
    z-index: 99999;
    bottom: 125%;
    left: 50%;
    margin-left: -80px;
}

.popup .popuptext h2{
 text-decoration: underline;
 font-size:1.5em;
 font-weight:800;
 }

/* Popup arrow */
.popup .popuptext::after {
    content: "";
    position: absolute;
    top: 100%;
    left: 50%;
    margin-left: -5px;
    border-width: 5px;
    border-style: solid;
    border-color: #555 transparent transparent transparent;
}

/* Toggle this class - hide and show the popup */
.popup .show {
	display:block;
    /* visibility: visible; */
    -webkit-animation: fadeIn 1s;
    animation: fadeIn 1s;
}

/* The actual popup */
.popup .popuptext1 {
	display:none;
    /* visibility: hidden; */
    width: 300px;
    background-color: #555;
    color: #fff;
    text-align: center;
    border-radius: 6px;
    padding: 8px 0;
    position: relative;
    z-index: 99999;
    bottom: 125%;
    left: 50%;
    margin-left: -80px;
}

.popup .popuptext1 h2{
 text-decoration: underline;
 font-size:1.5em;
 font-weight:800;
 }

/* Popup arrow */
.popup .popuptext1::after {
    content: "";
    position: absolute;
    top: 100%;
    left: 50%;
    margin-left: -5px;
    border-width: 5px;
    border-style: solid;
    border-color: #555 transparent transparent transparent;
}

/* Toggle this class - hide and show the popup */
.popup .show {
	display:block;
    /* visibility: visible; */
    -webkit-animation: fadeIn 1s;
    animation: fadeIn 1s;
}

.date_selectbox{
background-color:#555;
color:#fff;
width:100px;
padding-left:15px;
letter-spacing:2px;
margin: 0 auto;
border-color:#555;
}
.date_button{
width:50px;
}
.date_minor_minor{
font-size:0.8em;
}
.date_submit{
background-color:#555;
}
.date_submit:hover{
background-color:#616161;
}
/* Add animation (fade in the popup) */
@-webkit-keyframes fadeIn {
    from {opacity: 0;} 
    to {opacity: 1;}
}

@keyframes fadeIn {
    from {opacity: 0;}
    to {opacity:1 ;}
}
input{
background-color:#555555;
color:#fff;
font-weight:500;
border:none;
outline: none;
width:125px;
}
.date_selectbox_blue,.date_selectbox_blue:hover{background-color:#7092BE;color:#7092BE;}
.date_selectbox_red{background-color:#FFAEC9;color:#FFAEC9;}
.date_selectbox_brown{background-color:#B97A57;color:#B97A57;}
.date_selectbox_yellow{background-color:#EFE4B0;color:#EFE4B0;}
.date_selectbox_green{background-color:#B5E61D;color:#B5E61D;}
</style>

<link href="/buengbueng/js/calender/fullcalendar.css" rel="stylesheet"/>
<link href="/buengbueng/js/calender/fullcalendar.print.css" rel="stylesheet" media="print"/>
<script type="text/javascript" src="/buengbueng/js/calender/lib/moment.min.js"></script>
<script type="text/javascript" src="/buengbueng/js/calender/fullcalendar.js" charset="utf-8"></script>
<script type="text/javascript">
backgroundCh = function() { 
    var sel = document.getElementById('sel'); 
    sel.style.backgroundColor = sel.value;
    sel.style.color = sel.value; 
};
  var eventInfoDateStart = "";
  var eventInfoDateEnd = ""; 
function moveConfirm(date){
	var date = date;
	$.ajax({
		url: "employeeCalenderEventDrop.do",
    	type:"post",
    	data:{date:date},
    	dataType : "json",
    	success:function(data){
    		history.go(0);
    	},
    	fail:function(){
    		history.go(0);
    	}
	})
}
function eventInsertCheck(start, end){
	var id = $('#id').val();
	var start = start;
	var end = end;
	$.ajax({
		url: "employeeCalenderEventInsertCheck.do?start="+start+"&end="+end,
		type: "post",
		success: function(data){
			if(data.length != 6){
				var toasts = new Toast('warning','toast-top-full-width',
						"<div><label class=\"toast-title\">"+id+"님!</label><span class=\"toast-message\">"+data+"</div> <div><button class=\"ghost-btn-warning\" onClick=\"revert()\">닫기</button></div><div><button class=\"ghost-btn-warning\" "+
								"onClick=\"()\">확인</button></div> ");
				showToast(toasts);
			}else{
				eventInfoInsertAjax(start, end);
			}
 			 
		}
	});
}
function eventInfoInsertAjax(start, end){
	$.ajax({
		url: "employeeCalenderInsert.do?start="+start+"&end="+end,
		type:"post",
		success:function(data){
			$('#myPopup1').html(data);
			eventInfov()
		}
	})
}


function eventInfoAjax(eventInfoDateStart,eventInfoDateEnd){
	$.ajax({
		url: "employeeCalenderEventInfo.do",
		type:"post",
		data:{
			eventInfoDateStart:eventInfoDateStart,
			eventInfoDateEnd:eventInfoDateEnd
			},
		success:function(data){
			$('#myPopup').html(data);
		}
	})
}
function revert(){} // 추가
function eventInfof() {
	$("#myPopup1").hide();
	var popup = document.getElementById("myPopup");
	popup.classList.toggle("show");
}
function eventInfov() {
	$("#myPopup1").hide();
	var popup = document.getElementById("myPopup1");
	popup.classList.toggle("show");
}
function employeeEventDelete(){
	$(".popup").hide();
	$.ajax({
		url: "employeeCalenderEventDelete.do",
		type:"post",
		data:{
			eventInfoDateStart : eventInfoDateStart,
			eventInfoDateEnd : eventInfoDateEnd
		},
		dataType: "json",
		success:function(data){
			history.go(0);
		}
	})
}
$(document).ready(function() {
   		  //현재년월일
   		  var date = new Date();
   		  var d= date.getDate();
   		  var m = date.getMonth();
   		  var y = date.getFullYear();
   		  
			var dragPlanStart = 0;
			var dragPlanEnd = 0;
			
			var pageX = 0;
			var pageY = 0;
   		  
   		  getEvent();
   		});
   		
   		function getEvent(){
   			var id = $('#id').val();
   			$.post('employeeCalenderList.do', createCalenderDateResult);
   		}
   		
   		function createCalenderDateResult(resp){
   			var result = $.parseJSON(resp),
   			eventData = "";
	   		eventData = result;

   			calendarEvent(eventData);
   		}
   		

   		function calendarEvent(eventData){
   		  var calendar = $('#calendar').fullCalendar({
   		  header: {
   		    left : 'prev, next today', //이전, 다음, 오늘
   		    center : 'title', //중앙 타이틀
   		    right: 'month, listWeek'
   		  },
   		  allDayText: '시간', //주간, 월간
   		  axisFormat: 'tt hh', //주간, 월간
   		  monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
   		  monthNamesShort : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
   		  dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
   		  dayNameShort:['일','월','화','수','목','금','토'],
   		  buttonText:{
   			  prev: '이전달',
   			  next: '다음달',
   			  prevYear: '전년',
   			  nextYear: '내년',
   			  today: '오늘',
   			  month: '월간',
   			  week: '주간',
   			  day: '일간'
   		  },
   		  
   		  selectable: true,
   		  selectHelper:true,
//////////////////////////////////////////////////////////////////////////////////////////   		  
   		  eventClick: function(calEvent, jsEvent, view) {
  			    eventInfoDateStart = calEvent.start.format();
  			    eventInfoDateEnd = calEvent.end.format();
				eventInfoAjax(eventInfoDateStart,eventInfoDateEnd);
   				eventInfof();

        // change the border color just for fun
   		 },

//////////////////////////////////////////////////////////////////////////////////////////   		  
   		  select:function(start,end){
   			  eventInsertCheck(start, end); 
   		  },
//////////////////////////////////////////////////////////////////////////////////////////
   		  eventDragStart: function(event, eventDropF){
   			dragPlanStart = event.start.format();
   			dragPlanEnd = event.end.format();
   		},
//////////////////////////////////////////////////////////////////////////////////////////
   	    eventDrop: function(event, delta, revertFunc, delayToasts) {

  			revert = revertFunc; // 추가
			var toasts = new Toast('info','toast-top-full-width',
			"<div><label class=\"toast-title\">"+event.title+"님!</label><span class=\"toast-message\">일정을  ["+dragPlanStart+" ~ "+dragPlanEnd+"] 에서   ["+event.start.format()+" ~ "+event.end.format()+"] 로 변경하겠습니까?</div> <div><button class=\"ghost-btn-info\" onClick=\"self.close()\">닫기</button></div><div><button class=\"ghost-btn-info\" "+
					"onClick=\"moveConfirm(\'{&quot;dragPlanStart&quot;:&quot;"+dragPlanStart+"&quot;,&quot;dragPlanEnd&quot;:&quot;"+dragPlanEnd+"&quot;,&quot;start&quot;:&quot;"+event.start.format()+"&quot;,&quot;end&quot;:&quot;"+event.end.format()+"&quot;}\')\">확인</button></div> ");
			showToast(toasts); // 추가
   	    },
   		  editable:true,
   		  eventLimit:true,
   		  slotEventOverlap:true,
   		  events:eventData
	})
}
</script>

<script type="text/javascript" src="/buengbueng/css/toast/toastAlert.js" charset="utf-8"></script>

<input type="hidden" id="id" value="${sessionScope.loginId} " />

<div class="main_ad" style="background-color:#fff;height:100%;">
	<div class="main_ad_content">
		<div class="col-xs-10-10 main_ad_contentBox">

   <div id="calendar"></div>
   
   <div class="popup">
	   <div class="popuptext" id="myPopup"></div>
	   <div class="popuptext" id="myPopup1"></div>
   </div>
   
		</div>
	</div>
</div>