var b_key;

var time = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;

$(document).ready(function(){
	$("#seatAdd").click(function(){
		// 입력한만큼 좌석 추가
		var pcCount = document.getElementById("pcCount").value;
		// 입력한 값이 없으면 좌석 1개 추가
		if(pcCount == ''){
			pcCount = 1;
		}
		$.ajax({
			url:"seatAddDel.do",
			type:"post",
			data:{
				pcNums : pcCount,
				what : "add"
			},
			success:function(data){
				$("#seatDisposeFirstDiv").html(data);
			}
		});
	});

	$("#seatModi").click(function(){
		// 체크한 좌석 일괄 수정
		var checkPC = document.getElementsByName("checkPC");
		var pcNums = "";
		for(i = 0; i < checkPC.length; i++){
			if(checkPC[i].checked){
				pcNums += checkPC[i].value+',';
			}
		}
		pcNums = pcNums.substring(0, pcNums.length-1);
		$.ajax({
			url:"getSetPcInfo.do",
			type:"post",
			data:{
				pcNum : pcNums,
				page : "1"
			},
			success:function(data){
				$("#pcInfo").html(data);
			}
		});
	});
	
	$("#seatDel").click(function(){
		// 체크한 좌석 삭제
		var checkPC = document.getElementsByName("checkPC");
		var pcNums = "";
		for(i = 0; i < checkPC.length; i++){
			if(checkPC[i].checked){
				pcNums += checkPC[i].value+',';
			}
		}
		pcNums = pcNums.substring(0, pcNums.length-1);
		$.ajax({
			url:"seatAddDel.do",
			type:"post",
			data:{
				pcNums : pcNums,
				what : "del"
			},
			success:function(data){
				$("#seatDisposeFirstDiv").html(data);
			}
		});
	});
});


function showModiPcInfo(pcNum){
	$.ajax({
		url:"getSetPcInfo.do",
		type:"post",
		data:{
			pcNum : pcNum,
			page : "0"
		},
		success:function(data){
			$("#pcInfo").html(data);
			$("#setInfo").show();
			$('#setInfo').mousedown(handle_mousedown);
		}
	});
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

// 좌석 정보 입력 확인
function checkPCInfo(){
	if(document.pcInfoForm.pcNum.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(document.pcInfoForm.os.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(document.pcInfoForm.ip.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	
	if(document.pcInfoForm.c_code.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(document.pcInfoForm.c_company.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(document.pcInfoForm.computer_date.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(!time.test(document.pcInfoForm.computer_date.value)){
		document.getElementById("alert").value = "YYYY-MM-DD 형식입니다.";
		return false;
	}
	
	if(document.pcInfoForm.c_model.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(document.pcInfoForm.c_cpu.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(document.pcInfoForm.c_graphic.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(document.pcInfoForm.c_hard.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(document.pcInfoForm.c_ram.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(document.pcInfoForm.c_power.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(document.pcInfoForm.c_lan.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(document.pcInfoForm.c_cooler.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	
	if(document.pcInfoForm.m_code.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(document.pcInfoForm.m_company.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(document.pcInfoForm.monitor_date.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(!time.test(document.pcInfoForm.monitor_date.value)){
		document.getElementById("alert").value = "YYYY-MM-DD 형식입니다.";
		return false;
	}
	if(document.pcInfoForm.m_name.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(document.pcInfoForm.monitor_date.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(document.pcInfoForm.m_model.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(document.pcInfoForm.m_inch.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(document.pcInfoForm.m_resolution.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(document.pcInfoForm.m_display.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(document.pcInfoForm.m_connector.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	
	if(document.pcInfoForm.k_code.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(document.pcInfoForm.k_company.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(document.pcInfoForm.k_name.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(document.pcInfoForm.k_type.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(document.pcInfoForm.k_connector.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	
	if(document.pcInfoForm.mo_code.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(document.pcInfoForm.mo_company.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(document.pcInfoForm.mo_name.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(document.pcInfoForm.mo_type.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(document.pcInfoForm.mo_connector.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	
	if(document.pcInfoForm.s_code.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(document.pcInfoForm.s_company.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(document.pcInfoForm.s_name.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(document.pcInfoForm.s_connector.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
}

//좌석 기본 정보 입력 확인
function checkPCInfoDefault(){
	if(document.pcInfoForm.os.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	
	if(document.pcInfoForm.c_company.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(document.pcInfoForm.c_model.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(document.pcInfoForm.c_cpu.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(document.pcInfoForm.c_graphic.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(document.pcInfoForm.c_hard.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(document.pcInfoForm.c_ram.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(document.pcInfoForm.c_power.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(document.pcInfoForm.c_lan.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(document.pcInfoForm.c_cooler.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	
	if(document.pcInfoForm.m_company.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(document.pcInfoForm.m_name.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(document.pcInfoForm.m_model.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(document.pcInfoForm.m_inch.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(document.pcInfoForm.m_resolution.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(document.pcInfoForm.m_display.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(document.pcInfoForm.m_connector.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	
	if(document.pcInfoForm.k_company.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(document.pcInfoForm.k_name.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(document.pcInfoForm.k_type.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(document.pcInfoForm.k_connector.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	
	if(document.pcInfoForm.mo_company.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(document.pcInfoForm.mo_name.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(document.pcInfoForm.mo_type.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(document.pcInfoForm.mo_connector.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	
	if(document.pcInfoForm.s_company.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(document.pcInfoForm.s_name.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
	if(document.pcInfoForm.s_connector.value == ""){
		document.getElementById("alert").value = "모든 정보를 입력하십시오.";
		return false;
	}
}