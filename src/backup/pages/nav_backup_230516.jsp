<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="/PaM/src/css/nav.css" /> <!-- nav css -->
</head>
<body>
	<nav>
		<div id="bar">
			<span id="bar_logo_s"><a href="/PaM/maincontrol"><img src="/PaM/src/img/logo_s.png" width="209"></a></span>	<!-- 클릭 시 메인페이지 이동 추가 필요 -->
			<span id="bar_user">
				<span><img src="/PaM/src/img/human_img.png" width="10.203"></span>			<!-- 마이페이지 만들게 된다면 마우스와 상호작용 추가 필요 -->
				<span>
					<ul>		<!-- 동적인 부분으로 변경해야 함 -->
						<li>
							<c:if test="${sessionScope.sgin_in_user == null}">
								<a href="https://www.naver.com">로그인</a>
							</c:if>
							<c:if test="${sessionScope.sgin_in_user != null}">
								<a href="https://www.naver.com">${sessionScope.sgin_in_user.user_name}</a>
							</c:if>
						</li>
						<li>|</li>
						<li>
							<c:if test="${sessionScope.sgin_in_user == null}">
								<a href="">회원가입</a>
							</c:if>
							<c:if test="${sessionScope.sgin_in_user != null}">
								<a href="">로그아웃</a>
							</c:if>
						</li>
					</ul>
				</span>
			</span>
		</div>
	</nav>
</body>
</html>