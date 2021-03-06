<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<title>PC방 이용현황 관리</title>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="/buengbueng/js/bossERP/seatState.js"></script>
	<link rel="stylesheet" type="text/css" href="/buengbueng/css/bossERP/applyForSettlement.css">
	<link rel="stylesheet" type="text/css" href="/buengbueng/css/ko/kocss.css">
	<link rel="stylesheet" type="text/css"  href="/buengbueng/css/erp.css">
</head>

<jsp:include page="../../erp_header.jsp" />

<body>
	<!-- 가맹점 선택하지 않는 경우 -->
	<c:if test="${result eq 'fail'}">
		가맹지점을 선택하여 주세요.
	</c:if>
	<c:if test="${result eq 'succ'}">
		<div class="ERP_Navigator">
			<ul>
				<li>ERP 관리</li>
				<li><i class="fa fa-angle-double-right" aria-hidden="true"></i></li>
				<li>PC방 관리</li>
				<li><i class="fa fa-angle-double-right" aria-hidden="true"></i></li>
				<li>PC방 좌석 이용 관리</li>
			</ul>
		</div>

		<div class="boss_con">
			<p>PC방 좌석 현황</p>
			<hr>
	
			<div id="setInfo">
				<div class="pop">
			 		<button id="pop_close">x</button>
			 	</div>
				<div class="userInfo"></div>
			</div>
			
			<div id="seatDisposeFirstDiv" style="width:98%; ">
				<c:set var="usePcCount" value="0" />
				<div class="pcBox">
					<c:if test="${count != 0}">
						<c:forEach begin="1" end="${count}" var="pcNum" step="1">
							<c:if test="${seatCon[pcNum-1] == '0'}">
								<div class="seatDisposeSecondDiv">
									&emsp;${pcNum}
									<c:if test="${pcState[pcNum-1] eq '고장'}">
										&emsp;<b style="color: red;">고장</b>
									</c:if>
								</div>
							</c:if>
							<c:if test="${seatCon[pcNum-1] == '1'}">
								<div class="seatDisposeSecondDiv2" onclick="getUserInfo('${pcNum}','${useSeatId.get(currentPcCount)}');">
									<c:set var="currentPcCount" value="0" />
									&emsp;${pcNum}
									<c:forEach var="num" items="${useSeatNum}">
										<c:if test="${num == (pcNum)}">
											&emsp;${useSeatId.get(currentPcCount)}님<br/>
											<c:set var="usePcCount" value="${usePcCount+1}" />
										</c:if>
										<c:if test="${num != (pcNum)}">
											<c:set var="currentPcCount" value="${currentPcCount+1}" />
										</c:if>
									</c:forEach>
								</div>
							</c:if>
						</c:forEach>
					</c:if>
					<c:if test="${count == 0}">
						좌석 정보를 먼저 추가하십시오.
					</c:if>
				</div>
				<h2>${usePcCount}/${count}</h2><hr>
			</div>
		</div>
	</c:if>
</body>

<jsp:include page="../../footer.jsp" />