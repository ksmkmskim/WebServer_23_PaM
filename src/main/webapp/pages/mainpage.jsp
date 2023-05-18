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
	<style>
		/*====================================   header   =====================================*/
		header{
			text-align: center;
		}
		
		#title_box{
			display: inline-block;
			text-align: left;
			margin-right: 400px;
		}
		#title_box > div > h2{
			font-family: 'Pretendard Variable';
			font-size: 38pt;
			font-weight: 900;
			color: #485A61;
			letter-spacing: 8px;
		}
		
		#intro_text{
			color: #485A61;
			font-family: 'Pretendard Variable';
			font-size: 11pt;
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
			cursor: pointer;
		}
		.read_more_btn:hover{
			color: #FFFFFF;
			background-color: #364448;
		}
		
		.hidden{
			display: none;
		}
		
		#search_bar{
			display: inline-block;
			text-align: left;
			vertical-align: top;
			margin-top: 70px;
		}
		#search_bar > div > h1{
			font-family: 'Pretendard Variable';
			font-size: 33pt;
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
		
		header > hr{
			width: 1400px;
			margin-top: 20px;
		}
		
		#filter_box{
			display: inline-block;
			width: 780px;
			padding: 7px 30px;
			margin-top: 100px;
			text-align: left;
			font-family: 'Pretendard Variable';
			background-color: white;
			border-radius: 2px;
			box-shadow: 0 12px 27px -6px gray;
		}
		#filter_box > div > span{
			display: inline-block;
			vertical-align: top;
		}
		
		#filter_menu{
			width: 800px;
			font-size: 15pt;
			font-weight: bold;
			color: black;
		}
		#filter_menu > span:nth-child(2){
			display: inline-block;
			margin-left: 320px;
		}
		#filter_menu > span:nth-child(3){
			display: inline-block;
			margin-left: 290px;
			font-size: 10pt;
			font-weight: 400;
			color: #94A8AD;
			cursor: pointer;
		}
		#filter_menu > span:nth-child(3):hover{
			text-decoration: underline;
		}
		
		#filter_list{
			font-size: 12pt;
			font-weight: bold;
			color: black;
		}
		#filter_list > span:nth-child(1){
			width: 326px;
		}
		#filter_list > span:nth-child(2){
			margin-left: 25px;
		}
		
		.filter{
			padding: 0px;
			margin: 0px;
			margin-bottom: 10px;
		}
		.filter > li{
			display: inline-block;
			line-height: 1.8;
			position: relative;
		}
		.filter > li.hidden{
			display: none;
		}
		.filter > li.exposed{
			top: -2.8px;
    		left: 3px;
    		color: #808080;
		}
		.filter.show_more .hidden{
			display: inline-block;
		}
		.filter.show_more .exposed{
			display: none;
		}
		
		#back_color{
			position: absolute;
			top: 550px;
			width: 100%;
			height: 270px;
			background-color: #EDF0F0;
			z-index: -1000;
		}
		
		#post_btn{
			color: #364448;
			border: none;
			background-color: white;
			display: inline-block;
			transition-duration: 0.1s;
			font-size: 16pt;
			font-weight: 900;
			width: 30px;
			height: 30px;
			padding: 0;
			text-align: center;
			position: relative;
			left: 237px;
			box-shadow: 0 0 9px -1px gray;
			cursor: pointer;
		}
		#post_btn:hover{
			color: white;
			background-color: #364448;
		}
		#post_btn:active{
			left: 239px;
			top: 2px;
		}

		/*====================================   main   =====================================*/
		
		
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
		}
		
		.post{
			display: inline-block;
			width: 330px;
			margin: 5px;
			position: relative;
			padding-top: 5px;
			background-color: white;
			box-shadow: 0px 2px 26px -7px gray;
		}
		
		.post_img{
			margin-top: 15px;
		}
		.post_img > img{
			height: 208px;
			width: 296px;
			margin: 0px;
			box-shadow: 0px 0px 5px black;
		}
		
		.post_info{
			text-align: left;
    		font-weight: bold;
    		color: #485A61;
    		font-family: 'Pretendard Variable';
    		margin-bottom: 10px;
		}
		.post_info .read_more_btn{
			padding: 7px 10px;
			background-color: white;
			font-size: 3pt;
			margin-left: 17px;
			letter-spacing: 1px;
		}
		.post_info .read_more_btn:hover{
			color: #FFFFFF;
			background-color: #364448;
		}
		.post_info > hr{
			width: 90%;
		}
		
		.car_info{
			margin-left: 20px;
			font-size: 11pt;
		}
		
		.car_price{
			float: right;
			margin-right: 20px;
			margin-top: 5px;
			font-size: 9pt;
		}
		
		/*====================================   aside   =====================================*/
		
		#banner{
			position: fixed;
			left: 90%;
			top: 70%;
			cursor: pointer;
			transition-duration: 0.1s;
		}
		#banner > div > img{
			width: 30px;
			box-shadow: 0px 2px 9px -2px gray;
		}
		
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>cpage = 1;</script>  <!-- current page = 1 -->
	<script src="/PaM/src/Javascript/postSearch.js"></script>  <!-- postSearch() -->
	<script src="/PaM/src/Javascript/readMoreButton.js"></script>
	<script src="/PaM/src/Javascript/scrollPage.js"></script>
	
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
				<div><input type="text" name="search" onKeyUp="postSearch()" placeholder="모델명을 입력해주세요. 예) K9"></div>
			</span>
		</div>
		<div id="filter_box">
			<div id="filter_menu">
				<span>차종</span>
				<span>브랜드</span>
				<span onClick="readMore('.filter')">필터 자세히 보기</span>	
			</div>
			<hr>
			<div id="filter_list">
				<span>
					<ul class="filter">
						<li><input type="checkbox" id="ct1" name="car_type" onClick="postSearch()" value="슈퍼카"><label for="ct1"><span>슈퍼카</span></label></li>
						<li><input type="checkbox" id="ct2" name="car_type" onClick="postSearch()" value="스포츠카"><label for="ct2"><span>스포츠카</span></label></li>
						<li><input type="checkbox" id="ct3" name="car_type" onClick="postSearch()" value="쿠페"><label for="ct3"><span>쿠페</span></label></li>
						<li><input type="checkbox" id="ct4" name="car_type" onClick="postSearch()" value="머슬카"><label for="ct4"><span>머슬카</span></label></li>
						<li><input type="checkbox" id="ct5" name="car_type" onClick="postSearch()" value="세단"><label for="ct5"><span>세단</span></label></li>
						<li class="exposed">...</li>
						<br class="hidden"><li class="hidden"><input type="checkbox" id="ct6" name="car_type" onClick="postSearch()" value="SUV"><label for="ct6"><span>SUV</span></label></li>
						<li class="hidden"><input type="checkbox" id="ct7" name="car_type" onClick="postSearch()" value="픽업 트럭"><label for="ct7"><span>픽업 트럭</span></label></li>
						<li class="hidden"><input type="checkbox" id="ct8" name="car_type" onClick="postSearch()" value="트럭"><label for="ct8"><span>트럭</span></label></li>
					</ul>
				</span>
				<span>
					<ul class="filter">
						<li><input type="checkbox" id="cb1" name="car_brand" onClick="postSearch()" value="현대"><label for="cb1"><span>현대</span></label></li>
						<li><input type="checkbox" id="cb2" name="car_brand" onClick="postSearch()" value="기아"><label for="cb2"><span>기아</span></label></li>
						<li><input type="checkbox" id="cb3" name="car_brand" onClick="postSearch()" value="도요타"><label for="cb3"><span>도요타</span></label></li>
						<li><input type="checkbox" id="cb4" name="car_brand" onClick="postSearch()" value="혼다"><label for="cb4"><span>혼다</span></label></li>
						<li><input type="checkbox" id="cb5" name="car_brand" onClick="postSearch()" value="닛산"><label for="cb5"><span>닛산</span></label></li>
						<li class="exposed">...</li>
						<br class="hidden"><li class="hidden"><input type="checkbox" id="cb6" name="car_brand" onClick="postSearch()" value="르노"><label for="cb6"><span>르노</span></label></li>
						<li class="hidden"><input type="checkbox" id="cb7" name="car_brand" onClick="postSearch()" value="부가티"><label for="cb7"><span>부가티</span></label></li>
						<li class="hidden"><input type="checkbox" id="cb8" name="car_brand" onClick="postSearch()" value="볼보"><label for="cb8"><span>볼보</span></label></li>
						<li class="hidden"><input type="checkbox" id="cb9" name="car_brand" onClick="postSearch()" value="코닉세그"><label for="cb9"><span>코닉세그</span></label></li>
						<li class="hidden"><input type="checkbox" id="cb10" name="car_brand" onClick="postSearch()" value="메르세데스-벤츠"><label for="cb10"><span>메르세데스-벤츠</span></label></li>
						<br class="hidden"><li class="hidden"><input type="checkbox" id="cb11" name="car_brand" onClick="postSearch()" value="포르쉐"><label for="cb11"><span>포르쉐</span></label></li>
						<li class="hidden"><input type="checkbox" id="cb12" name="car_brand" onClick="postSearch()" value="폭스바겐"><label for="cb12"><span>폭스바겐</span></label></li>
						<li class="hidden"><input type="checkbox" id="cb13" name="car_brand" onClick="postSearch()" value="BMW"><label for="cb13"><span>BMW</span></label></li>
						<li class="hidden"><input type="checkbox" id="cb14" name="car_brand" onClick="postSearch()" value="아우디"><label for="cb14"><span>아우디</span></label></li>
						<li class="hidden"><input type="checkbox" id="cb15" name="car_brand" onClick="postSearch()" value="롤스로이스"><label for="cb15"><span>롤스로이스</span></label></li>
						<br class="hidden"><li class="hidden"><input type="checkbox" id="cb16" name="car_brand" onClick="postSearch()" value="벤틀리"><label for="cb16"><span>벤틀리</span></label></li>
						<li class="hidden"><input type="checkbox" id="cb17" name="car_brand" onClick="postSearch()" value="맥라렌"><label for="cb17"><span>맥라렌</span></label></li>
						<li class="hidden"><input type="checkbox" id="cb18" name="car_brand" onClick="postSearch()" value="재규어"><label for="cb18"><span>재규어</span></label></li>
						<li class="hidden"><input type="checkbox" id="cb19" name="car_brand" onClick="postSearch()" value="쉐보레"><label for="cb19"><span>쉐보레</span></label></li>
						<li class="hidden"><input type="checkbox" id="cb20" name="car_brand" onClick="postSearch()" value="지프"><label for="cb20"><span>지프</span></label></li>
						<br class="hidden"><li class="hidden"><input type="checkbox" id="cb21" name="car_brand" onClick="postSearch()" value="테슬라"><label for="cb21"><span>테슬라</span></label></li>
						<li class="hidden"><input type="checkbox" id="cb22" name="car_brand" onClick="postSearch()" value="포드"><label for="cb22"><span>포드</span></label></li>
						<li class="hidden"><input type="checkbox" id="cb23" name="car_brand" onClick="postSearch()" value="닷지"><label for="cb23"><span>닷지</span></label></li>
						<li class="hidden"><input type="checkbox" id="cb24" name="car_brand" onClick="postSearch()" value="페라리"><label for="cb24"><span>페라리</span></label></li>
						<li class="hidden"><input type="checkbox" id="cb25" name="car_brand" onClick="postSearch()" value="람보르기니"><label for="cb25"><span>람보르기니</span></label></li>
						<br class="hidden"><li class="hidden"><input type="checkbox" id="cb26" name="car_brand" onClick="postSearch()" value="마세라티"><label for="cb26"><span>마세라티</span></label></li>
						<li class="hidden"><input type="checkbox" id="cb27" name="car_brand" onClick="postSearch()" value="파가니"><label for="cb27"><span>파가니</span></label></li>
					</ul>
				</span>
			</div>
		</div>
		<button id="post_btn"><div>+</div></button>
		<div id="back_color"></div>
	</header>
	
	<main>
		
		<div id="post_container">		<!-- 포스트 이동 추가, 마우스 올릴 시 정보표시 기능 추가 필요 -->
			<ul></ul><script>postSearch();</script>
		</div>
	</main>
	
	<aside>
		<div id="banner">
			<div onClick="scrollPage('nav')"><img src="/PaM/src/img/up_button.png"></div>
			<div onClick="scrollPage('footer')"><img src="/PaM/src/img/down_button.png"></div>
		</div>
	</aside>
	
	<%@ include file="footer.jsp" %>	<!-- footer -->
	<script src="/PaM/src/Javascript/scroll.js"></script>
</body>
</html>