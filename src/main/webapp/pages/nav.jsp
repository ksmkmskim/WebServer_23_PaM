<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="/PaM/src/css/nav.css"/> <!-- nav css -->
</head>
<body>
	<nav>
		<div id="user_info">
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
		</div>
		<div id="menu_bar">
			<ul>
				<li><img src="/PaM/src/img/menu_img.png"></li>
				<li><div class="menu"><a href="/PaM/main">HOME</a></div></li>
				<li><div class="menu">SERVICE</div></li>
				<li><div class="menu">ABOUT US</div></li>
				<li><div class="menu">CONTACT</div></li>
			</ul>
		</div>
	</nav>
</body>
</html>