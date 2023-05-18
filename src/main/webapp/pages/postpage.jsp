<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Pat & Mat</title>
	<link rel="stylesheet" href="/PaM/src/css/font.css" /> <!-- font css -->
	<link rel="stylesheet" href="/PaM/src/css/body.css" /> <!-- body css -->
</head>
<style>
	body{
		background-color: white;
	}
	/*====================================   header   =====================================*/
	header{
		text-align: center;
	}
	header > hr{
		width: 1500px;
		color: #C7C9C9;
	}
	
	#car_post{
		margin-top: 27px; 
		font-family: 'Pretendard Variable';
		font-size: 17pt;
		font-weight: bold;
		color: black;
	}
	
	#car_name{
		margin-right: 1230px;
	}
	#car_name > h2{
		display: inline-block;
		margin: 0px;
	}
	
	#post_info{
		margin-left: 1296px;
		margin-top: 8px;
		font-family: 'Pretendard Variable';
		font-size: 10pt;
		color: #8F8F8F;
	}
	
	#post_user > a{
		text-decoration: none;
		color: #8F8F8F;
	}
	#post_user > a:hover{
		text-decoration: underline;
	}
	
	#post_date{
		margin-left: 20px;
	}
	
	#btn_box{
		display: inline-block;
		margin-left: 1296px;
		font-family: 'Pretendard Variable';
		font-size: 10pt;
		color: #8F8F8F;
	}
	
	.rd_btn{
		display: inline-block;
		padding: 2px 10px;
		border: solid 1px #8F8F8F;
		box-shadow: 0 0 7px -4px gray;
		cursor: pointer;
	}
	.rd_btn:hover{
		color: white;
		background-color: #8F8F8F; 
	}
	/*====================================   main   =====================================*/
	main{
		text-align: center;
	}
	
	#main_img > img{
		width: 800px;
		height: 562px;
		box-shadow: 0px 0px 10px black;
	}
	
	#l_btn, #r_btn{
		display: inline-block;
		position: relative;
		top: -261px;
		cursor: pointer;
	}
	#l_btn{
		left: -20px;
	}
	#l_btn > img{
		width: 30px;
	}
	
	#r_btn{
		left: 20px;
	}
	#r_btn > img{
		width: 30px;
	}
	
	#car_imgs{
		display: inline-block;
	}
	
	#img_list{
		display: inline-block;
		width: 800px;
		overflow: auto;
		white-space: nowrap;
	}
	#img_list > ul{
		display: inline-block;
		padding: 0;
	}
	#img_list > ul > li{
		display: inline-block;
	}
	#img_list > ul > li > div{
		cursor: pointer;
	}
	#img_list > ul > li > div > img{
		width: 200px;
		height: 140.54px;
	}
	#img_list > ul > li > div > img{
		filter: brightness(60%);
	}
	#img_list > ul > li > div > img.chosen{
		filter: brightness(100%);
	}
	#img_list > ul > li > div > img:hover{
		filter: brightness(100%);
	}
	
	#car_info_box{
		display: inline-block;
		vertical-align: top;
		margin-left: 106px;
		margin-top: 91px;
		font-family: 'Pretendard Variable';
		font-size: 15pt;
		font-weight: bold;
	}
	
	#car_info{
		background-color: #F2F5F5;
		border-radius: 5px;
		box-shadow: 0px 0px 13px -4px black;
	}
	#car_info > table{
		padding: 32px;
	}
	#car_info > table > tbody > tr{
		height: 60px;
	}
	#car_info > table > tbody > tr > td:nth-child(1){
		text-align: left;
		width: 174px;
	}
	#car_info > table > tbody > tr > td:nth-child(2){
		text-align: right;
	}
	
	#trade_btn{
		padding: 19px 0px;
		margin-top: 78px;
		border-radius: 5px;
		box-shadow: 0px 0px 13px -4px black;
		background-color: #F2F5F5;
		font-size: 21pt;
		cursor: pointer;
	}
	#trade_btn:hover{
		color: white;
		background-color: #8F8F8F;
	}
	
</style>
<script src="/PaM/src/Javascript/changeImg.js"></script>  <!-- changeImg() -->
<body>
	<%@ include file="nav.jsp" %>	<!-- nav -->
	
	<header>
		<div id="car_post">
			<span id="car_name"><h2>${post.getCar_brand()} ${post.getCar_name()}</h2></span>
			<span id="car_price">${post.getCar_price()} 원</span>
		</div>
		<div id="post_info">
			<span id="post_user"><a href="">${post.getPost_user().getUser_name()}</a></span>
			<span id="post_date">${post.getPost_date()}</span>
		</div>
		<hr>
		<div id="btn_box">
			<span class="rd_btn" onClick="">수정</span>
			<span class="rd_btn" onClick="">삭제</span>
		</div>
	</header>
	
	<main>
		<div id="car_imgs">
			<div id="main_img_box">
				<span id="l_btn" onClick=""><img src="/PaM/src/img/l_arrow.png"></span>
				<span id="main_img"><img src="${post.getImg_list()[0]}"></span>
				<span id="r_btn" onClick=""><img src="/PaM/src/img/r_arrow.png"></span>
			</div>
			<div id="img_list">
				<ul>
					<c:forEach var="img" items="${post.getImg_list()}" varStatus="s">
						<li><div id="img_${s.index}" onClick="changeImg('${post.getImg_list()}', ${s.index})"><img src="${img}"></div></li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div id="car_info_box">
			<div id="car_info">
				<table>
					<tr>
						<td>이름:</td>
						<td>${post.getCar_brand()} ${post.getCar_name()}</td>
					</tr>
					<tr>
						<td>차종:</td>
						<td>${post.getCar_type()}</td>
					</tr>
					<tr>
						<td>가격:</td>
						<td>${post.getCar_price()} 원</td>
					</tr>
					<tr>
						<td>주행거리:</td>
						<td>${post.getCar_mile()} Km</td>
					</tr>
					<tr>
						<td>기타정보:</td>
						<td>${post.getCar_etc()}</td>
					</tr>
				</table>
			</div>
			<div id="trade_btn">거래신청</div>
		</div>
	</main>
	
	<%@ include file="footer.jsp" %>	<!-- footer -->
</body>
</html>