<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${count > 0 }">
<div align="center">
<div> 검색된 회원 : ${count}</div>
<div>
	<span>아이디</span>
	<span>비밀번호</span>
	<span>이름</span>
	<span>생일</span>
	<span>연락처</span>
	<span>이메일</span>
	<span>주소</span>
	<span>등급</span>
	<span>Google 아이디</span>
	<span>가입 날짜</span>
</div>
<c:set value="0" var="d" />
<c:forEach var="list" items="${list}">
<div id="dashInfo${count}">
	<span>${list.id}<input type="hidden" id="id${count}" value="${list.id}"></span>
	<span>${list.pw}<input type="hidden" id="pw${count}" value="${list.pw}"></span>
	<span>${list.name}<input type="hidden" id="name${count}" value="${list.name}"></span>
	<span>${list.birth}<input type="hidden" id="birth${count}" value="${list.birth}"></span>
	<span>${list.phone}<input type="hidden" id="phone${count}" value="${list.phone}"></span>
	<span>${list.email}<input type="hidden" id="email${count}" value="${list.email}"></span>
	<span>${list.address}<input type="hidden" id="address${count}" value="${list.address}"></span>
	<span>${list.grade}<input type="hidden" id="grade${count}" value="${list.grade}"></span>
		<c:if test="${list.googleId != null}">
			<span>${list.googleId}<input type="hidden" id="googleId${count}" value="${list.googleId}"></span>
		</c:if>
		<c:if test="${list.googleId == null}">
			<span>일반 가입<input type="hidden" id="googleId${count}" value="일반 가입"></span>
		</c:if>
	<span>${dates[d]}<input type="hidden" id="signdate${count}" value="${dates[d]}"></span>
	<input type="hidden" id="keyword${count}" value="${keyword}">
<script>
function delCheck${count}(){
	if (confirm("정말 삭제하시겠습니까??") == true){    //확인	
		$.ajax({
			url:"dashDelete.do",
			type:"post",
			data:{id:$("#id${count}").val()},
			success:function(data){
				$("#dashInfo${count}").html(data);
			}
		});
	}else{   //취소
	  	return;
	}
}
$(document).ready(function(){
	$("#dashModify${count}").click(function(){
		$.ajax({
			url:"dashModify.do",
			type:"post",
			data:{id:$("#id${count}").val(),pageNum:${pageNum},keyword:$("#keyword${count}").val()},
			success:function(data){
				$("#dashInfo${count}").html(data);
			}
		});
	});
});
</script>
	<span><button onclick="return delCheck${count}();">삭제</button></span>
	<span><button id="dashModify${count}">수정</button></span>
</div>
<c:set var="count" value="${count-1}"/>
<c:set value="${d+1}" var="d" />
</c:forEach>
	
	<c:if test="${startPage > 10}">
        <a href="dashUserSearch.do?keyword=${keyword}&pageNum=${ startPage - 10 }">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<a href="dashUserSearch.do?keyword=${keyword}&pageNum=${i}">[${i}]</a>
	</c:forEach>
	<c:if test="${endPage < pageCount}">
    	<a href="dashUserSearch.do?keyword=${keyword}&pageNum=${ startPage + 10 }">[다음]</a>
	</c:if>
</div>
</c:if>