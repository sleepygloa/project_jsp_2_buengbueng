var code = /^([0-9]{1,7})$/;

$(document).ready(function(){
	var b_key = document.getElementById("b_key").value;
	$("#addRent").click(function(){
		$.ajax({
			url: "addRent.do",
			type: "post",
			data: {
				b_key: b_key
			},
			success: function(data){
				$("#rentDiv").html(data);
			}
		});
	});
	$("#delRent").click(function(){
		var rName = document.getElementsByName("rentName");
		var rentNames = "";
		for(i=0; i<rName.length; i++){
			if(rName[i].checked){
				rentNames += rName[i].value+',';
			}
		}
		$.ajax({
			url: "delRent.do",
			type: "post",
			data: {
				rentName : rentNames,
				b_key : b_key
			},
			success: function(data){
				$("#seatDisposeFirstDiv").html(data);
			}
		});
	});
	$("#addRentProduct").click(function(){
		$.ajax({
			url: "addRentProduct.do",
			type: "post",
			data: {
				b_key : b_key
			},
			success: function(data){
				$("#rentDiv").html(data);
			}
		});
	});
	$("#delRentProduct").click(function(){
		var rCode = document.getElementsByName("rentCode");
		var rentPCodes = "";
		for(i=0; i<rCode.length; i++){
			if(rCode[i].checked){
				rentPCodes += rCode[i].value+',';
			}
		}
		$.ajax({
			url: "delRentProduct.do",
			type: "post",
			data:{
				rentPCode : rentPCodes,
				b_key : b_key
			},
			success: function(data){
				$("#seatDisposeFirstDiv").html(data);
			}
		});
	});
});

function gotoAlert(txt){
	alert(txt);
	history.go(-1);
}

function gotoURL(url,name,value){
	  var form = document.createElement("form");
	   form.setAttribute("method","post");
	   form.setAttribute("action",url);
	   
	   var hidden = document.createElement("input");
	   hidden.setAttribute("type","hidden");
	   hidden.setAttribute("name", name);
	   hidden.setAttribute("value",value);
	   form.appendChild(hidden);

	   document.body.appendChild(form);
	   form.submit();
}


function gotoURL2(url,name1,value1,name2,value2){
	  var form = document.createElement("form");
	   form.setAttribute("method","post");
	   form.setAttribute("action",url);
	   
	   var hidden = document.createElement("input");
	   hidden.setAttribute("type","hidden");
	   hidden.setAttribute("name", name1);
	   hidden.setAttribute("value",value1);
	   form.appendChild(hidden);
	   
	   hidden = document.createElement("input");
	   hidden.setAttribute("type","hidden");
	   hidden.setAttribute("name", name2);
	   hidden.setAttribute("value",value2);
	   form.appendChild(hidden);

	   document.body.appendChild(form);
	   form.submit();
}


function modiRent(rentProduct,b_key){
	$.ajax({
		url: "modiRent.do",
		type: "post",
		data: {
			rentProduct: rentProduct,
			b_key: b_key
		},
		success: function(data){
			$("#rentDiv").html(data);
			$("#setInfo").show();
			$('#setInfo').mousedown(handle_mousedown);
		}
	});
}
function selectedproductList(rentProduct,b_key,num){
	$.ajax({
		url: "selectedRentProductAll.do",
		type: "post",
		data: {
			rentProduct: rentProduct,
			b_key: b_key
		},
		success: function(data){
			$("#"+num).html(data);
		}
	});
}

function modiRentProduct(rentCode,b_key){
	$.ajax({
		url: "modiRentProduct.do",
		type: "post",
		data: {
			code: rentCode,
			b_key : b_key
		},
		success: function(data){
			$("#rentDiv").html(data);
			$("#setInfo").show();
			$('#setInfo').mousedown(handle_mousedown);
		}
	});
}

function checkRentProduct(){
	if(document.rentProductForm.code.value == ""){
		document.getElementById("alert").value = "바코드 번호를 입력하십시오.";
		return false;
	}
	if(!code.test(document.rentProductForm.code.value)){
		document.getElementById("alert").value = "바코드 번호는 숫자만 가능합니다.";
		return false;
	}
	if(document.rentProductForm.rentProduct.value == "선택"){
		document.getElementById("alert").value = "물품을 선택하십시오.";
		return false;
	}
}

function checkRentProductModi(){
	if(document.rentProductModiForm.code.value == ""){
		document.getElementById("alert").value = "바코드 번호를 입력하십시오.";
		return false;
	}
	if(!code.test(document.rentProductModiForm.code.value)){
		document.getElementById("alert").value = "바코드 번호는 숫자만 가능합니다.";
		return false;
	}
	if(document.rentProductModiForm.rentCheck.value == ""){
		document.getElementById("alert").value = "대여유무를 입력하십시오.";
		return false;
	}
}

function checkRent(){
	if(document.getElementById("rentProduct").value == ""){
		document.getElementById("alert").value = "대여물품 이름를 입력하십시오.";
		return false;
	}
}

function setInfoView() {
	$("#setInfo").show();
	$('#setInfo').mousedown(handle_mousedown);
}
 
$(function(){
	$("#pop_close").click(function(){
		$("#setInfo").hide();
   }); 
});
function handle_mousedown(e){
    window.my_dragging = {};
    my_dragging.pageX0 = e.pageX;
    my_dragging.pageY0 = e.pageY;
    my_dragging.elem = this;
    my_dragging.offset0 = $(this).offset();
    function handle_dragging(e){
        var left = my_dragging.offset0.left + (e.pageX - my_dragging.pageX0);
        var top = my_dragging.offset0.top + (e.pageY - my_dragging.pageY0);
        $(my_dragging.elem)
        .offset({top: top, left: left});
    }
    function handle_mouseup(e){
        $('body')
        .off('mousemove', handle_dragging)
        .off('mouseup', handle_mouseup);
    }
    $('body')
    .on('mouseup', handle_mouseup)
    .on('mousemove', handle_dragging);
}