<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${sessionScope.grade!=4}">
	<script> alert('관리자 페이지'); window.location='index.do';</script>
</c:if>

<!DOCTYPE html>
<html lang="en">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>관리자 페이지</title>
    <!-- Bootstrap -->
    <link href="/buengbueng/css/dashBoard/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900%7CRoboto+Mono:400,300,700' rel='stylesheet'
        type='text/css'>
    <link href="/buengbueng/css/dashBoard/busy.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
    <section data-mt-navigation-type="vertical" data-mt-nav-placement="left" data-theme-layout="wide-layout" data-theme-bg="bg1">
        <div id="mtapp-wrapper" class="mt-hide-lpanel" data-mt-device-type-type="desktop">
            <header id="mt-header" data-mt-lpanel-effect="shrink" data-mt-color-type="logo-bg3">
                <div class="mt-left-header">
                    <a class="nav-expand" href="#"><img class="img-responsive img-circle" alt="Image Here" src="img/dashBoard/1.jpg" ></a>
                    <a class="brandname" href="/buengbueng/dashIndex.do"><i class="fa fa-eercast"></i> <span><span class="text-slim">bueng</span> bueng</span></a>
                    <span class="mt-sidebar-toggle"><a href="#"></a></span>
                </div>
                <div class="mt-right-header" data-mt-position-type="relative" data-mt-color-type="header-bg3"/>
			</header>
<!---------------------------------------------경계선------------------------------------------>                
<script>
setInterval("autoRefresh()", 3000);
	function autoRefresh(){		
		var currentLocation = window.location;
		$('#autoRe').load(currentLocation+" #autoRe");
		}
setInterval("autoRefresh1()", 3000);
	function autoRefresh1(){		
		var currentLocation = window.location;
		$('#autoRe1').load(currentLocation+" #autoRe1");
		}
</script>
            <div id="mtapp-container" data-mt-color-type="lpanel-bg3" data-mt-lpanel-effect="shrink">
                <aside id="mt-left-panel" data-mt-position-type="absolute">
                    <div class="user-block clearfix">
                        <img class="img-responsive" alt="Image Here" src="img/dashBoard/1.jpg">
                        <div class="detail">
                        <div id="autoRe"><strong>${sessionScope.loginId}</strong>
                        <span class="label bg-warning"><a>${alarm} ${franchiseAlarm+oneAlarm}</a></span></div>
                          	
                            <ul class="list-inline">
                                <li class="badge badge-danger m-left-xs"><a href="userInfoForm.do">정보 버튼</a></li>
                                <li class="badge badge-danger m-left-xs"><a href="logout.do" class="no-margin">로그아웃 버튼</a></li>
                                <li class="badge badge-danger m-left-xs"><a href="index.do" class="no-margin">사용자 페이지</a></li>
                            </ul>
                        </div>
                    </div>
                    <ul class="nav panel-list">
                        <li class="nav-level">메뉴</li>
                        <li class="mt-has-menu">
                            <a href="javascript:void(0)" class="rippler rippler-default">
                            <i class="fa fa-home"></i>
                            <span class="menu-text">회원 정보</span>
                            <span class="selected"></span>
                        </a>
                            <ul class="mt-sub-menu">
                             	<li>
                                    <a href="dashUser.do?grade=3&pageNum=1" class="rippler rippler-default">
                                    <span class="menu-text">사용자</span>
                                    <span class="selected"></span>
                                </a>
                                </li>
                                <li>
                                    <a href="dashUser.do?grade=1&pageNum=1" class="rippler rippler-default">
                                    <span class="menu-text">사장님</span>
                                    <span class="selected"></span>
                                </a>
                                </li>
                                <li>
                                    <a href="dashUser.do?grade=4&pageNum=1" class="rippler rippler-default">
                                    <span class="menu-text">관리자</span>
                                    <span class="selected"></span>
                                </a>
                                </li>
                                <li>
                                    <a href="dashUserSearch.do?pageNum=1" class="rippler rippler-default">
                                    <span class="menu-text">회원 검색</span>
                                    <span class="selected"></span>
                                </a>
                                </li>
                            </ul>
                        </li>
                        <li class="mt-has-menu">
                            <a href="javascript:void(0)" class="rippler rippler-default">
                            <i class="fa fa-home"></i>
                            <span class="menu-text">일일정산  관리</span>
                            <span class="selected"></span>
                        </a>
                            <ul class="mt-sub-menu">
                             	<li>
                                    <a href="AcceptingRequest.do" class="rippler rippler-default">
                                    <span class="menu-text">일일정산 승인허가</span>
                                    <span class="selected"></span>
                                </a>
                                </li>
                             </ul>
                        </li>
                        <li class="mt-has-menu">
                            <a href="javascript:void(0)" class="rippler rippler-default">
                            <i class="fa fa-home"></i>
                            <span class="menu-text">결제 관리</span>
                            <span class="selected"></span>
                        </a>
                            <ul class="mt-sub-menu">
                             	<li>
                                    <a href="completePayment.do" class="rippler rippler-default">
                                    <span class="menu-text">결제 내역</span>
                                    <span class="selected"></span>
                                </a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="managePcInfo.do" class="rippler rippler-default">
                            <i class="fa fa-th"></i>
                            <span class="menu-text">좌석 관리</span>
                            <span class="selected"></span>
                        </a>
                        </li>
                        <li>
                            <a href="chatbotList.do" class="rippler rippler-default">
                            <i class="fa fa-th"></i>
                            <span class="menu-text">챗봇 관리</span>
                            <span class="selected"></span>
                        </a>
                        </li>
                        <li class="mt-has-menu">
                            <a href="javascript:void(0)" class="rippler rippler-default">
                            <i class="fa fa-desktop"></i>
                            <span class="menu-text">ERP 관리</span>
                            <span class="selected"></span>
                        </a>
                            <ul class="mt-sub-menu">
                                <li>
                                    <a href="ui-animation.html" class="rippler rippler-default">
                                    <span class="menu-text">ERP ver.1</span>
                                    <span class="selected"></span>
                                </a>
                                </li>
                                <li>
                                    <a href="ui-button.html" class="rippler rippler-default">
                                    <span class="menu-text">ERP ver.2</span>
                                    <span class="selected"></span>
                                </a>
                                </li>
                                <li>
                                    <a href="ui-icons.html" class="rippler rippler-default">
                                    <span class="menu-text">ERP ver.3</span>
                                    <span class="selected"></span>
                                </a>
                                </li>
                                <li>
                                    <a href="ui-tabs-accordion.html" class="rippler rippler-default">
                                    <span class="menu-text">ERP ver.4</span>
                                    <span class="selected"></span>
                                </a>
                                </li>
      				        </ul>
                        </li>
                        <li class="mt-has-menu">
                            <a href="javascript:void(0)">
                            <i class="fa fa-pencil-square-o"></i>
                            <span class="menu-text">신청 목록</span>
                            <span class="selected"></span>
                        </a>
                            <ul class="mt-sub-menu">
                                <li>
                                    <a href="dashAgreeList.do?pageNum=1&pageNum1=1" class="rippler rippler-default">
                                    <span class="menu-text">가맹 목록</span>
                                    <span class="selected"></span>
                                </a>
                                </li>
                            </ul>
                            <ul class="mt-sub-menu">
                                <li>
                                    <a href="dashEmpAgreeList.do?pageNum=1" class="rippler rippler-default">
                                    <span class="menu-text">알바 목록</span>
                                    <span class="selected"></span>
                                </a>
                                </li>
                            </ul>
                        </li>
                        <li class="mt-has-menu">
                            <a href="javascript:void(0)">
                            <i class="fa fa-pencil-square-o"></i>
                            <span class="menu-text">정보 복구</span>
                            <span class="selected"></span>
                        </a>
                            <ul class="mt-sub-menu">
                                <li>
                                    <a href="dashReverse.do" class="rippler rippler-default">
                                    <span class="menu-text">회원 정보 복구</span>
                                    <span class="selected"></span>
                                </a>
                                </li>
                            </ul>
                        <li class="mt-has-menu">
                            <a href="javascript:void(0)" class="rippler rippler-default">
                            <i class="fa fa-table"></i>
                            <span class="menu-text">고객센터</span>
                            <span class="selected"></span>
                        </a>
                            <ul class="mt-sub-menu">
                                <li>
                                    <a href="dashList.do?pageNum=1&pageNum2=1&pageNum3=1&pageNum4=1&pageNum=5" class="rippler rippler-default">
                                    <span class="menu-text">게시판 모아보기</span>
                                    <c:if test="${franchiseAlarm >0}">
                                    	<span class="badge badge-danger m-left-xs "><div id="autoRe1">${franchiseAlarm+oneAlarm}</div></span>
                                    </c:if>
                                    <span class="selected"></span>
                                </a>
                                </li>
                            </ul>
                        </li>
                        <!-- 추후 작업 예정 -->
                        <%-- 
                        <li class="mt-has-menu">
                            <a href="javascript:void(0)">
	                            <i class="fa fa-pencil-square-o"></i>
	                            <span class="menu-text">Log 관리</span>
	                            <span class="selected"></span>
                        	</a>
                            <ul class="mt-sub-menu">
                                <li>
                                    <a href="dashAgreeList.do?pageNum=1&pageNum1=1" class="rippler rippler-default">
                                    <span class="menu-text">가맹 목록</span>
                                    <span class="selected"></span>
                                </a>
                                </li>
                            </ul>
                            <ul class="mt-sub-menu">
                                <li>
                                    <a href="dashEmpAgreeList.do?pageNum=1" class="rippler rippler-default">
                                    <span class="menu-text">알바 목록</span>
                                    <span class="selected"></span>
                                </a>
                                </li>
                            </ul>
                        </li> 
                        --%>
                </aside>
         <!-- 중앙에 들어갈 내용!-->
         <section id="main-content">
         
