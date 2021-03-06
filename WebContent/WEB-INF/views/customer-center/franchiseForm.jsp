<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="/buengbueng/css/notice/noticeForm.css">
<script type="text/javascript" src="/buengbueng/js/userInfo/customerForm.js"></script>
<!-- HEADER TEMPLATE -->
<jsp:include page="../header.jsp" />

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>가맹 문의</title>
</head>
<div>가맹 문의</div>
<form action="franchisePro.do" method="post" onsubmit="return franchiseCheck();" name="franchise">
<input type="hidden" name="pageNum" value="${pageNum}">
<input type="hidden" name="snum" value="${snum}">
<input type="hidden" name="num" value="${num}">
<input type="hidden" name="ref" value="${ref}">
<input type="hidden" name="re_step" value="${re_step}">


<div>
<div>
	<span>이름</span>
	<c:if test="${sessionScope.loginId != null}">
		<span><input type="text" name="writer" value="${user.name}" readonly></span>
	</c:if>
	<c:if test="${sessionScope.loginId == null}">
		<span><input type="text" name="writer"></span>
	</c:if>
</div>
<div>
	<span>이메일</span>
	<c:if test="${sessionScope.loginId != null}">
		<span><input type="text" name="email" value="${user.email}"></span>
	</c:if>
	<c:if test="${sessionScope.loginId == null}">
		<span><input type="text" name="email"></span>
	</c:if>
</div>
<div>
	<span>제목</span>
	<c:if test="${num==0}">
		<span><input type="text" name="title" id="title11"></span>
	</c:if>
	<c:if test="${num!=0}">  
		<span><input type="text" name="title" value="[답변]${title}"></span>
	</c:if>
</div> 
	<textarea name="content" cols="130" rows="30"></textarea>
<div>
<div>
	<c:if test="${sessionScope.grade == 4 }">
	<input type="hidden" name="b_passwd">
	</c:if>
	<c:if test="${sessionScope.grade != 4}">
	<span><input type="password" name="passwd" ></span>
	</c:if>
</div>
<div id="button2">
	<span><input type="submit" value="작성하기"></span>
	<span id="button5"><input type="reset" value="다시쓰기"></span>
	<span><input type="button" value="돌아가기" onclick="window.location='franchiseQA.do?snum=${snum}&pageNum=${pageNum}'"></span>
</div>
</div>
</form>