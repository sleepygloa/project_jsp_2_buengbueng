<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${check==1}">
<script>
alert('정보가 틀립니다.');
history.go(-1);
</script>
</c:if>
<!-- HEADER TEMPLATE -->
<jsp:include page="header.jsp" /> 

<script>
indexNoticeList(); //공지사항 리스트
indexFranchiseeList(); //가맹문의 리스트

function indexNoticeList(){
	$.ajax({
		url:"indexNoticeList.do",
		type:"post",
		success:function(data){
			$("#indexNoticeList").html(data);
		}
	})
}
function indexFranchiseeList(){
	$.ajax({
		url:"indexFranchiseeList.do",
		type:"post",
		success:function(data){
			$("#indexFranchiseeList").html(data);
		}
	})
}
</script>
<style>
.side_scontent{
background-color:#EEF1F2;
}
.newsList > div:first-child,.newsList > div:first-child + div {
	color:#E66565;
	font-weight:700;
}
</style>

<!-- ARTICLE -->
<!-- 메인 화면 전광판  ------------------------------------------------------------>
<div class="main_ad" style="background-color:#EEF1F2;height:100%;">
	<div class="main_ad_content">
			<div class="col-xs-10-10 main_ad_contentBox">
				<div class="col-xs-10-10 col-sm-5-10 col-md-4-10 col_height200 contentBox_outline contentBox_right">
					<div class="contentBox col_height0" >
						<div class="login_title">
							<p>환영합니다. 이용을 위해 로그인이 필요합니다.</p>
						</div>
						<div class="contentBox_img_banner"><a href="loginForm.do"><img src="/buengbueng/img/index/login_banner.png" width="100%;" height="50px;" /></a></div>
						<div class="contentBox_login_other">
							<ul>
								<c:if test="${sessionScope.loginId != null}" >
	                  				<li class="col-xs-4-12 mb0"><a href="/buengbueng/logout.do">로그아웃</a></li>
	                  				<li class="col-xs-4-12 mb0"><a href="/buengbueng/userInfoForm.do">회원 정보보기</a></li>
                  				</c:if>
                  				<c:if test="${sessionScope.loginId == null}" >
									<li class="col-xs-4-12 mb0"><a href="userInfoSignForm.do">회원가입</a></li>
									<li class="col-xs-4-12 mb0"><a href="userInfoSearchPwForm.do">비밀번호 찾기</a></li>
									<li class="col-xs-4-12 mb0"><a href="userInfoSearchIdForm.do">아이디 찾기</a></li>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-xs-10-10 col-sm-5-10 col-md-2-10  col_height200 contentBox_outline">
					<div class="contentBox col_height0">
						<div class="contentBox_a"><a href="cash.do">포인트 결제</a></div>
						<div><i class="fa fa-krw fa-4x" aria-hidden="true"></i></div>
					</div>
				</div>
				<div class="col-xs-10-10 col-sm-5-10 col-md-2-10 col_height200 contentBox_outline">
					<div class="contentBox col_height0">
						<div class="contentBox_a"><a href="cashHistory.do">포인트  조회</a></div>
						<div><i class="fa fa-credit-card fa-4x" aria-hidden="true"></i></div>
					</div>
				</div>
				<div class="col-xs-10-10 col-sm-5-10 col-md-2-10 col_height200 contentBox_outline">
					<div class="contentBox col_height0" >
						<div class="contentBox_a " style="margin-bottom:0px;"><a href="index.do">부엉부엉</a></div>
						<div><img src="/buengbueng/img/index/buengbueng_emoticon.jpg" width="80px;" /></div>
					</div>
				</div>

				<div class="col-xs-10-10 col-sm-5-10 col-md-2-10 col_height200 contentBox_outline">
					<div class="contentBox col_height0">
						<div class="contentBox_a"><a href="franchiseeList.do">가맹점 관리</a></div>
						<div><i class="fa fa-pencil-square-o fa-4x" aria-hidden="true"></i></div>
					</div>
				</div>
				<div class="col-xs-10-10 col-sm-5-10 col-md-4-10 col_height200 contentBox_outline">
					<div class="contentBox col_height0">
						<div class="contentBox_a"><a href="notice.do?snum=4"><i class="fa fa-book fa-1x" aria-hidden="true"></i>&nbsp;공지사항</a></div>
						<div><hr /></div>
						<div id="indexNoticeList" class="contentBox_board_list">

						</div>
					</div>
				</div>
				<div class="col-xs-10-10 col-sm-5-10 col-md-4-10  colres_height600 contentBox_outline contentBox_right">
					<div class="contentBox col_height0">
						<div class="contentBox_a"><a href="#">이벤트 & 광고</a></div>
						<div><i class="fa fa-newspaper-o fa-4x" aria-hidden="true"></i></div>
						<div class="newsList" style="display:inline-block;text-align:left;padding-top:20px;">
						
						<c:set var="number" value="1" />
							<c:forEach var="list" items="${newsList}">
								<div style="margin:5 0;"><c:out value="${number}" />. ${list.newsList}</div>
								<c:set var="number" value="${number+1}" />
							</c:forEach>
							
							<br />*. 출처 : 인벤 웹진 : http://www.inven.co.kr/webzine/news/?hotnews=3 
						</div>
					</div>
				</div>					

				<div class="col-xs-10-10 col-sm-5-10 col-md-2-10  col_height200 contentBox_outline">
					<div class="contentBox col_height0">
						<div class="contentBox_a"><a  onclick="chattingView();" style="cursor: pointer;">실시간 상담</a></div>
						<div><i class="fa fa-comments fa-4x" aria-hidden="true"></i></div>
					</div>
				</div>	
				<div class="col-xs-10-10 col-sm-5-10 col-md-2-10  col_height200 contentBox_outline">
					<div class="contentBox col_height0">
						<div class="contentBox_a"><a href="employeeCalenderOnly.do">알바생 일정</a></div>
						<div><i class="fa fa-calendar fa-4x" aria-hidden="true"></i></div>
					</div>
				</div>					
				<div class="col-xs-10-10 col-sm-5-10 col-md-2-10  col_height200 contentBox_outline">
					<div class="contentBox col_height0">
						<div class="contentBox_a " style="margin-bottom:0px;"><a href="index.do">부엉부엉</a></div>
						<div><img src="/buengbueng/img/index/buengbueng_emoticon.jpg" width="80px;" /></div>
					</div>
				</div>	
				<div class="col-xs-10-10 col-sm-5-10 col-md-4-10  col_height200 contentBox_outline">
					<div class="contentBox col_height0">
						<div class="contentBox_a"><a href="franchiseQA.do?snum=1"><i class="fa fa-book fa-1x" aria-hidden="true"></i>&nbsp;가맹 문의 최신글</a></div>
						<div><hr /></div>
						<div id="indexFranchiseeList" class="contentBox_board_list">
						</div>
					</div>
				</div>	
				<div class="col-xs-10-10 col-sm-5-10 col-md-2-10  col_height200 contentBox_outline">
					<div class="contentBox col_height0">
						<div class="contentBox_a"><a href="remoteIntro.do">원격 지원</a></div>
						<div><i class="fa fa-desktop fa-4x" aria-hidden="true"></i></div>
					</div>
				</div>	
				
				
		</div>
		
	</div>
<!-- FOOTER TEMPLATE -->
<jsp:include page="footer.jsp" /> 