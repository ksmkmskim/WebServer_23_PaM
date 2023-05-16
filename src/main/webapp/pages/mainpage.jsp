<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Pat & Mat</title>
	<link rel="stylesheet" href="/PaM/src/css/footer.css" /> <!-- font css -->
	<link rel="stylesheet" href="/PaM/src/css/body.css" /> <!-- body css -->
	<style>
		/*====================================   header   =====================================*/

		#header_box{
			position: relative;
			left: 300px;
		}

		#title_box > div > h2{
			font-family: 'Pretendard Variable';
			font-size: 35pt;
			font-weight: 900;
			color: #485A61;
			letter-spacing: 8px;
		}
		
		#intro_text{
			color: #485A61;
			font-family: 'Pretendard Variable';
			font-size: 10pt;
			margin-bottom: 30px;
		}
		#intro_text.show_more .hidden{
			display: inline;
		}
		#intro_text.show_more .exposed{
			display: none;
		}
		
		.read_more_btn{
			padding: 10px 30px;
			background-color: #F2F5F5;
			border: solid 2px #364448;
			border-radius: 30px;
			font-family: 'Lato';
			color: #364448;
			font-size: 8pt;
			letter-spacing: 2px;
		}
		.read_more_btn:hover{
			color: #FFFFFF;
			background-color: #364448;
		}
		
		.hidden{
			display: none;
		}
		
		#search_bar{
			position: absolute;
			left: 650px;
			top: 30px;
		}
		#search_bar > div > h1{
			font-family: 'Pretendard Variable';
			font-size: 30pt;
			font-weight: bold;
			color: #485A61;
		}
		#search_bar > div > input{
			font-family: 'Pretendard Variable';
			font-size: 13pt;
			font-weight: 550;
			background-color: #F2F5F5;
			border: 0;
			border-bottom: solid 3px #485A61;
			width: 500px;
			outline: none;
		}
		
		#post_btn{
			display: inline-block;
			vertical-align: top;
			position: relative;
			left: 100px;
			filter: drop-shadow(0px 0px 2px #1f94b1);
			
			transition-duration: 0.1s;
		}
		#post_btn:active{
			left: 102px;
			top: 2px;
			filter: drop-shadow(0px 0px 0px #1f94b1);
		}
				/*================ 오픈 소스 검색 창 ================*/
		.icon-container {
			position: absolute;
			top: 11px;
			right: 20px;
			width: 35px;
			height: 35px;
			overflow: hidden;
			
			transition-duration: 0.1s;
		}
		.icon-container:active {
			right: 18px;
			top: 13px;
		}
		
		.icon-search {
			position: relative;
			top: 5px;
			left: 8px;
			width: 50%;
			height: 50%;
			opacity: 1;
			border-radius: 50%;
			border: 3px solid color-mix(in srgb, #1f94b1 30%, white);
			transition: opacity 0.25s ease, transform 0.43s cubic-bezier(0.694,  0.048, 0.335, 1.000);
		}
		.icon-search::after {
		    content: "";
		    position: absolute;
		    bottom: -9px;
		    right: -2px;
		    width: 4px;
		    border-radius: 3px;
		    transform: rotate(-45deg);
		    height: 10px;
		    background-color: color-mix(in srgb, #1f94b1 30%, white);
		 }
		 
		 .field-container {
			position: relative;
			padding: 0;
			margin: 0;
			border: 0;
			width: 700px;
			height: 40px;
			
		}
		
		.field {
			border: 0;
			width: 100%;
			height: 100%;
			padding: 10px 0px;
			font-style: italic;
			font-size: 14pt;
			text-indent: 30px;
			background: white;
			border-radius: 100px;
			box-shadow: 0px 8px 10px #afe1ed;
			transition: all 0.4s ease;
		}
		.field:focus {
			outline: none;
			box-shadow: 0px 0px 20px #1f94b1;
		}
		/*====================================   main   =====================================*/
		main > hr{
			width: 1300px;
			margin-top: 20px;
		}
		
		#post_container{
			text-align: center;
		}
		#post_container > ul{
			display: block;
			list-style-type: none;
			padding: 0px;
		}
		#post_container > ul > li{
			display: inline-block;
			width: 305.6px;
		}
		
		.post{
			display: inline-block;
			margin: 5px;
			position: relative;
			padding-top: 5px;
			border-radius: 10px;
			background-color: #f1f3f4;
		}
		.post > img{
			height: 206px;
			width: 290px;
			margin: 0px;
			border-radius: 10px;
			box-shadow: 0px 0px 5px black;
		}
		.post:hover img {
			filter: brightness(40%);
		}
		.post:hover .post_info{
			display: block;
		}
		
		.post_info{
			display: none;
			width: 240px;
			position: absolute;
			top: 50%;
    		left: 38%;
    		transform: translate( -50%, -50% );
    		color: white;
    		text-align: left;
    		font-weight: bold;
		}
		.post_info > ul > li{
			margin-top: 5px;
		}
		
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>cpage = 1;</script>  <!-- current page = 1 -->
	<script src="/PaM/src/Javascript/postSearch.js"></script>  <!-- postSearch() -->
	<script src="/PaM/src/Javascript/readMoreButton.js"></script>
	
</head>
<body>
	<%@ include file="nav.jsp" %>	<!-- nav -->
	
	<header>
		<div id="header_box">
			<span id="title_box">
				<div><h2>PAT & MAT</h2></div>
				<div>
					<p id="intro_text">패트와 매트의 신뢰할 수 있는 중고차<br><br>
						<span class="exposed">...</span>
						<span class="hidden">20180645 손현승<br>20200575 김이레</span>
					</p>
				</div>
				<button class="read_more_btn" onClick="readMore('#intro_text')">READ MORE</button>
			</span>
			<span id="search_bar">
				<div><h1>어떤 차를 찾으세요?</h1></div>
				<div><input type="text" name="search" onKeyUp="" placeholder="모델명을 입력해주세요. 예) K9"></div>
			</span>
		</div>
		<div id="filter_box"></div>
	</header>
	
	<main>
		<hr>
		<div id="post_container">		<!-- 포스트 이동 추가, 마우스 올릴 시 정보표시 기능 추가 필요 -->
			<ul></ul><!-- <script>postSearch();</script>  -->
		</div>
	</main>
	
	<aside>
		<div id="banner"></div>
	</aside>
	
	<%@ include file="footer.jsp" %>	<!-- footer -->
	<script src="/PaM/src/Javascript/scroll.js"></script>
</body>
</html>