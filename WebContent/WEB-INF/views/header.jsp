<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	<head>
	
		<!-- 기본 세팅, 브라우저 세팅, device 세팅 -->
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<!-- 브라우저에서 레이아웃크기조절, 윈도우크기와 1:1비율로 맞춘다 -->
		<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
		
		<!-- IE=edge : 최신모드로 지정된 DOCTYPE에 상관없이 IE8 이상 버전에서 항상 최신 표준 모드로 렌더링됩니다. -->
		<meta http-equiv="X-UA-Compatible" content="IE=Edge">  
		<!-- 사파리에서(아이폰) 전화번호, 주소, 이메일을 쓸경우 자동으로 링크설정이되 스타일이 안먹히는 것을 방지  -->
		<meta name="format-detection" content="telephone=no, address=no, email=no">
		<!-- 모바일주소로 변환 <link rel="alternate"  href="http://www.beusable.com/m"> -->
		<!-- <link rel="shortcut icon" type="image/png" href="img/favicon/beuLogo.ico"/> -->

		<!-- CSS RESET -->
		<link rel="stylesheet" type="text/css"  href="/buengbueng/css/reset.css">
    	<!-- INDEX CSS -->
    	<link rel="stylesheet" type="text/css" media="all" href="css/style_v2.css">
		<!-- INDEX CSS 2 -->    
        <link rel="stylesheet" type="text/css" media="all" href="css/dist/modules.min.css">
	
		<!-- 홈페이지 제목 -->
		<title>BuengBueng</title>
		
	</head>
 
 
 	<body>
	 	<!-- LOGIN SECTION -->
	 	<div class="header_wrap">
			<div class="header container">
				<!-- 로고 : BUENGBUENG 또는 그림 -->
				<h1></h1>

				<!-- NAV SECTION -->
				<!-- BIG NAV : 대 제목 : 메인 NAV : 메인 메뉴 -->				
				<ul class="menu_area clearfix"> 
					<li class="item normal product" onClick="return true">
						<!-- 대메뉴 이름 : 링크 : 클릭시 드롭다운메뉴 -->
<!-- -------------------------------------------------------------------------------------------------------- -->						
						<a class="ctgr" href="">
회사 소개
						</a>
						<!-- 드롭다운메뉴 : 소메뉴 -->
						<ul class="product__list">
							<!-- 소메뉴 타이틀 -->
							<h6 class="product__list__title minor-minor">회사소개&nbsp; | &nbsp;<span class="list__title__desc">PC방이용자님이 사용할수 있는 메뉴입니다.</span></h6>
							<!-- 소메뉴 의 각 링크들 -->
							<li class="row">
								<!-- 컨텐츠당 하나의 div로 구성 -->
								<div class="product__item col-sm-6">
									<a href="">
										<span class="gnb-icon ux-heatmap">dd</span>
										<span class="gnb__text-grp">
											<h6 class="product__item__name minor-minor">가맹점 찾기</h6>
											<p class="product__item__desc">시스템을 제공하는 가맹점 찾기</p>
										</span>
									</a>
								</div>
								<!-- 컨텐츠당 하나의 div로 구성 -->
								<div class="product__item col-sm-6">
									<a href="">
										<span class="gnb-icon ux-heatmap">dd</span>
										<span class="gnb__text-grp">
											<h6 class="product__item__name minor-minor">프로그램 기능소개</h6>
											<p class="product__item__desc">BUENGBUENG 모든 기능 소개</p>
										</span>
									</a>
								</div>
							</li>
						</ul>	
					</li>
<!-- -------------------------------------------------------------------------------------------------------- -->
					<li class="item normal product" onClick="return true">
						<!-- 대메뉴 이름 : 링크 : 클릭시 드롭다운메뉴 -->
						<a class="ctgr" href="">
사용자 PC방 이용
						</a>
						<!-- 드롭다운메뉴 : 소메뉴 -->
						<ul class="product__list">
							<!-- 소메뉴 타이틀 -->
							<h6 class="product__list__title minor-minor">
								헬로월드&nbsp; | &nbsp;
								<span class="list__title__desc">PC방이용자님이 사용할수 있는 메뉴입니다.</span>
							</h6>
							
							<!-- 소메뉴 의 각 링크들 -->
							<li class="row">
								<!-- 컨텐츠당 하나의 div로 구성 -->
								<div class="product__item col-sm-6">
									<a href="">
										<span class="gnb-icon ux-heatmap">dd</span>
										<span class="gnb__text-grp">
											<h6 class="product__item__name minor-minor">PC방 찾기</h6>
											<p class="product__item__desc">우리동네, 지역 가맹 피시방찾기</p>
										</span>
									</a>
								</div>
								
								<!-- 컨텐츠당 하나의 div로 구성 -->
								<div class="product__item col-sm-6">
									<a href="">
										<span class="gnb-icon ux-heatmap">dd</span>
										<span class="gnb__text-grp">
											<h6 class="product__item__name minor-minor">결제</h6>
											<p class="product__item__desc">PC이용요금 결제</p>
										</span>
									</a>
								</div>
							</li>
							<!-- 소메뉴 의 각 링크들 -->
							<li class="row">
								<!-- 컨텐츠당 하나의 div로 구성 -->
							
								<div class="product__item col-sm-6">
									<a href="">
										<span class="gnb-icon ux-heatmap">dd</span>
										<span class="gnb__text-grp">
											<h6 class="product__item__name minor-minor">예약</h6>
											<p class="product__item__desc">원하는자리 미리 예약하기</p>
										</span>
									</a>
								</div>
								<!-- 컨텐츠당 하나의 div로 구성 -->
							
								<div class="product__item col-sm-6">
									<a href="">
										<span class="gnb-icon ux-heatmap">dd</span>
										<span class="gnb__text-grp">
											<h6 class="product__item__name minor-minor">이용현황</h6>
											<p class="product__item__desc">현재 실시간 자리현황 파악</p>
										</span>
									</a>
								</div>
							</li>
							<!-- 소메뉴 의 각 링크들 -->
							<li class="row">
								<!-- 컨텐츠당 하나의 div로 구성 -->
							
								<div class="product__item col-sm-10">
									<a href="">
										<span class="gnb-icon ux-heatmap">dd</span>
										<span class="gnb__text-grp">
											<h6 class="product__item__name minor-minor">즐겨찾는 PC방</h6>
											<p class="product__item__desc">자주찾는 PC방을 지정하여 그곳의 정보를 먼저 파악</p>
										</span>
									</a>
								</div>
							</li>
						</ul>	
					</li>
<!-- ---------------------------------------------------------------------------------------------------- -->
<li class="item normal product" onClick="return true">
						<!-- 대메뉴 이름 : 링크 : 클릭시 드롭다운메뉴 -->
						
						<a class="ctgr" href="">
사장님 PC방 관리
						</a>
						<!-- 드롭다운메뉴 : 소메뉴 -->
						<ul class="product__list">
							<!-- 소메뉴 타이틀 -->
							<h6 class="product__list__title minor-minor">회사소개&nbsp; | &nbsp;<span class="list__title__desc">PC방이용자님이 사용할수 있는 메뉴입니다.</span></h6>
							<!-- 소메뉴 의 각 링크들 -->
							<li class="row">
								<!-- 컨텐츠당 하나의 div로 구성 -->
								<div class="product__item col-sm-6">
									<a href="">
										<span class="gnb-icon ux-heatmap">dd</span>
										<span class="gnb__text-grp">
											<h6 class="product__item__name minor-minor">원격 조정</h6>
											<p class="product__item__desc">멀리서 가맹중인 PC방 관리</p>
										</span>
									</a>
								</div>
								<!-- 컨텐츠당 하나의 div로 구성 -->
								<div class="product__item col-sm-6">
									<a href="">
										<span class="gnb-icon ux-heatmap">dd</span>
										<span class="gnb__text-grp">
											<h6 class="product__item__name minor-minor">ERP 관리</h6>
											<p class="product__item__desc">PC방 내 모든 현황 관리</p>
										</span>
									</a>
								</div>
							</li>
						</ul>	
					</li>					
<!-- ---------------------------------------------------------------------------------------------------- -->
<li class="item normal product" onClick="return true">
						<!-- 대메뉴 이름 : 링크 : 클릭시 드롭다운메뉴 -->
						
						<a class="ctgr" href="">
관리자 프로그램 관리
						</a>
						<!-- 드롭다운메뉴 : 소메뉴 -->
						<ul class="product__list">
							<!-- 소메뉴 타이틀 -->
							<h6 class="product__list__title minor-minor">회사소개&nbsp; | &nbsp;<span class="list__title__desc">PC방이용자님이 사용할수 있는 메뉴입니다.</span></h6>
							<!-- 소메뉴 의 각 링크들 -->
							
							<li class="row">
								<!-- 컨텐츠당 하나의 div로 구성 -->
								<div class="product__item col-sm-6">
									<a href="">
										<span class="gnb-icon ux-heatmap">dd</span>
										<span class="gnb__text-grp">
											<h6 class="product__item__name minor-minor">회원 관리</h6>
											<p class="product__item__desc">멀리서 가맹중인 PC방 관리</p>
										</span>
									</a>
								</div>
								
								<!-- 컨텐츠당 하나의 div로 구성 -->
								<div class="product__item col-sm-6">
									<a href="">
										<span class="gnb-icon ux-heatmap">dd</span>
										<span class="gnb__text-grp">
											<h6 class="product__item__name minor-minor">챗봇 관리</h6>
											<p class="product__item__desc">PC방 내 모든 현황 관리</p>
										</span>
									</a>
								</div>
							</li>
							
							<!-- 소메뉴 의 각 링크들 -->
							<li class="row">
								<!-- 컨텐츠당 하나의 div로 구성 -->
								<div class="product__item col-sm-6">
									<a href="">
										<span class="gnb-icon ux-heatmap">dd</span>
										<span class="gnb__text-grp">
											<h6 class="product__item__name minor-minor">ERP 관리</h6>
											<p class="product__item__desc">전체 ERP 모듈 관리</p>
										</span>
									</a>
								</div>
								
								<!-- 컨텐츠당 하나의 div로 구성 -->
								<div class="product__item col-sm-6">
									<a href="">
										<span class="gnb-icon ux-heatmap">dd</span>
										<span class="gnb__text-grp">
											<h6 class="product__item__name minor-minor">페이지 관리</h6>
											<p class="product__item__desc">웹 페이지기능 추가 및 삭제</p>
										</span>
									</a>
								</div>
							</li>
							
						</ul>	
					</li>		
<!-- ---------------------------------------------------------------------------------------------------- -->								
					<li class="item normal product" onClick="return true">
						<a href="">
고객센터
						</a>
					</li>
				

				
				<!-- 로그인상태와 로그아웃상태일때 환영메세지, 관리자 일때 관리자페이지 링크가 보이게 한다. -->
					<c:if test="${sessionScope.loginId != null}" >
						<li>${sessionScope.loginId}님 환영합니다!!</li>
						<li class="item sign"><a href="/buengbueng/userInfoForm.do">회원 정보보기</a></li>
						<li class="item sign"><a href="/buengbueng/userInfoFormUpdate.do">회원 정보수정</a></li>
					</c:if>
					<c:if test="${sessionScope.loginId == null}" >
						<li class="item sign"><a href="/buengbueng/loginForm.do">로그인</a></li>
						<li class="item sign"><a href="/buengbueng/userInfoSignForm.do">회원가입</a></li>
						<li class="item sign"><a href="">비밀번호찾기</a></li>
					</c:if>
					<c:if test="" >
						<li class="item sign">관리자페이지</li>
					</c:if>
					
				</ul>
			</div>
		</div>
		