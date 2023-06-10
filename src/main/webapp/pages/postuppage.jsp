<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Pat & Mat</title>
	<link rel="stylesheet" href="/PaM/src/css/font.css" />  <!-- font css --> 
	<link rel="stylesheet" href="/PaM/src/css/body.css" /> <!-- body css -->
</head>
	<style>
		body{
			text-align: center;
		}
		#patAndMat{
			margin-top: 5%;
		}
		#patAndMat > a{
			font-family: 'Pretendard Variable';
			font-size: 40pt;
			font-weight: 900;
			color: #485A61;
			letter-spacing: 8px;
			text-decoration: none;
		}
		
		#add_post_box{
			margin-top: 100px;
			margin-bottom: 150px;
			margin-left: auto;
			margin-right: auto;
			width: 430px;
			padding: 0px;
			padding-bottom: 50px;
			padding-left: 10px;
			padding-right: 10px;
			border: 4px solid black;
			border-radius: 30px;
		}
		
		ul{
			list-style-type: none;
			padding: 0;
		}
		
		li{
			text-align: left;
			padding-top: 2px;
		}
		li > label{
			text-align: left;
		}
		
		li > span:nth-child(2){
			margin-left: 172px;
		}
		
		#num > li{
			display: inline-block;
		}
		#num > li > input{
			width: 204px;
		}
		
		.labelTr > td{
			padding-top: 35px;
		}
		
		label{
			color: #485A61;
			font-family: 'Lato';
			font-weight: bold;
			font-size: 12pt;
		}
		
		.li_input{
			text-align: center;
		}
		
		input{
			width: 420px;
			height: 30px;
			margin-bottom: 14px;
			border-top: none;
			border-left: none;
			border-right: none;
			border-bottom: 2px solid black;
			background: transparent;
		}
		input:focus{
			outline: none;
		}
		input[type="text"]{
			padding: 0;
		}
		input[type="number"]::-webkit-outer-spin-button,
		input[type="number"]::-webkit-inner-spin-button {
    		-webkit-appearance: none;
    		margin: 0;
		}		
		input[type=radio]{
			width: 13px;
			height: 13px;
		}
		
		input[type=file]{
			margin-top: 7px;
		}
		input[type=file]::file-selector-button{
			display: none;
		}
		
		.btn{
			background-color: #F2F5F5;
			border: solid 3px #364448;
			font-family: 'Lato';
			color: #364448;
			cursor: pointer;
		}
		
		#price{
			
		}
		
		#add_btn{
			margin-top: 20px;
			width: 350px;
			height: 50px;
			border-radius: 30px;
			font-size: 12pt;
			letter-spacing: 2px;
		}
		#add_btn:hover{
			color: white;
			background-color: #364448;
		}
		
		.error{
		    font-size: 1px;
		    height: 20px;
		    color:red;
		    font-weight: 700;
		}
		
		.c_type, .c_brand{
			padding: 0px;
			margin: 0px;
			margin-bottom: 10px;
		}
		.c_brand{
			height: 36px;
		}
		.c_type > li{
			display: inline-block;
			line-height: 1.8;
			position: relative;
		}
		.c_type > li.hidden{
			display: none;
		}
		.c_brand > li{
			display: inline-block;
			line-height: 1.8;
			position: relative;
		}
		.c_brand > li.hidden{
			display: none;
		}
		.c_type.show_more .hidden{
			display: inline-block;
		}
		.c_type.show_more .exposed{
			display: none;
		}
		.c_brand.show_more{
			height: 216px;
		}
		.c_brand.show_more .hidden{
			display: inline-block;
		}
		.c_brand.show_more .exposed{
			display: none;
		}
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="/PaM/src/Javascript/readMoreButton.js"></script>  <!-- readMore() -->
	<script src="/PaM/src/Javascript/addPost.js"></script>  <!-- addPost() -->
<body>
	<div align="center" id="patAndMat"><a href="/PaM/main" >PAT & MAT</a></div>
	<form action="javascript:;" onsubmit="addPost()"> <!-- signup도 이런식으로 바꾸기 -->
		<div id="add_post_box" align="center">
			<ul>
				<li><label>차량 이름 </label></li>
				<li class="li_input"><input type="text" name="car_name" required></li>
				<li><label>차종 </label></li>
				<li>
					<ul class="c_type">
						<li><input type="radio" id="ct1" name="car_type" onClick="" value="슈퍼카"><label for="ct1"><span>슈퍼카</span></label></li>
						<li><input type="radio" id="ct2" name="car_type" onClick="" value="스포츠카"><label for="ct2"><span>스포츠카</span></label></li>
						<li><input type="radio" id="ct3" name="car_type" onClick="" value="쿠페"><label for="ct3"><span>쿠페</span></label></li>
						<li><input type="radio" id="ct4" name="car_type" onClick="" value="머슬카"><label for="ct4"><span>머슬카</span></label></li>
						<li><input type="radio" id="ct5" name="car_type" onClick="" value="세단"><label for="ct5"><span>세단</span></label></li>
						<li class="exposed" onClick="readMore('.c_type')">▼</li>
						<li class="hidden" onClick="readMore('.c_type')">▲</li>
						<br class="hidden"><li class="hidden"><input type="radio" id="ct6" name="car_type" onClick="" value="SUV"><label for="ct6"><span>SUV</span></label></li>
						<li class="hidden"><input type="radio" id="ct7" name="car_type" onClick="" value="픽업 트럭"><label for="ct7"><span>픽업 트럭</span></label></li>
						<li class="hidden"><input type="radio" id="ct8" name="car_type" onClick="" value="트럭"><label for="ct8"><span>트럭</span></label></li>
					</ul>
				</li>
				<li><label>차량 브랜드 </label></li>
				<li>
					<ul class="c_brand">
						<li><input type="radio" id="cb1" name="car_brand" onClick="" value="현대"><label for="cb1"><span>현대</span></label></li>
						<li><input type="radio" id="cb2" name="car_brand" onClick="" value="기아"><label for="cb2"><span>기아</span></label></li>
						<li><input type="radio" id="cb3" name="car_brand" onClick="" value="도요타"><label for="cb3"><span>도요타</span></label></li>
						<li><input type="radio" id="cb4" name="car_brand" onClick="" value="혼다"><label for="cb4"><span>혼다</span></label></li>
						<li><input type="radio" id="cb5" name="car_brand" onClick="" value="닛산"><label for="cb5"><span>닛산</span></label></li>
						<li class="exposed" onClick="readMore('.c_brand')">▼</li>
						<li class="hidden" onClick="readMore('.c_brand')">▲</li>
						<br class="hidden"><li class="hidden"><input type="radio" id="cb6" name="car_brand" onClick="" value="르노"><label for="cb6"><span>르노</span></label></li>
						<li class="hidden"><input type="radio" id="cb7" name="car_brand" onClick="" value="부가티"><label for="cb7"><span>부가티</span></label></li>
						<li class="hidden"><input type="radio" id="cb8" name="car_brand" onClick="" value="볼보"><label for="cb8"><span>볼보</span></label></li>
						<li class="hidden"><input type="radio" id="cb9" name="car_brand" onClick="" value="코닉세그"><label for="cb9"><span>코닉세그</span></label></li>
						<li class="hidden"><input type="radio" id="cb10" name="car_brand" onClick="" value="메르세데스-벤츠"><label for="cb10"><span>메르세데스-벤츠</span></label></li>
						<br class="hidden"><li class="hidden"><input type="radio" id="cb11" name="car_brand" onClick="" value="포르쉐"><label for="cb11"><span>포르쉐</span></label></li>
						<li class="hidden"><input type="radio" id="cb12" name="car_brand" onClick="" value="폭스바겐"><label for="cb12"><span>폭스바겐</span></label></li>
						<li class="hidden"><input type="radio" id="cb13" name="car_brand" onClick="" value="BMW"><label for="cb13"><span>BMW</span></label></li>
						<li class="hidden"><input type="radio" id="cb14" name="car_brand" onClick="" value="아우디"><label for="cb14"><span>아우디</span></label></li>
						<li class="hidden"><input type="radio" id="cb15" name="car_brand" onClick="" value="롤스로이스"><label for="cb15"><span>롤스로이스</span></label></li>
						<br class="hidden"><li class="hidden"><input type="radio" id="cb16" name="car_brand" onClick="" value="벤틀리"><label for="cb16"><span>벤틀리</span></label></li>
						<li class="hidden"><input type="radio" id="cb17" name="car_brand" onClick="" value="맥라렌"><label for="cb17"><span>맥라렌</span></label></li>
						<li class="hidden"><input type="radio" id="cb18" name="car_brand" onClick="" value="재규어"><label for="cb18"><span>재규어</span></label></li>
						<li class="hidden"><input type="radio" id="cb19" name="car_brand" onClick="" value="쉐보레"><label for="cb19"><span>쉐보레</span></label></li>
						<li class="hidden"><input type="radio" id="cb20" name="car_brand" onClick="" value="지프"><label for="cb20"><span>지프</span></label></li>
						<br class="hidden"><li class="hidden"><input type="radio" id="cb21" name="car_brand" onClick="" value="테슬라"><label for="cb21"><span>테슬라</span></label></li>
						<li class="hidden"><input type="radio" id="cb22" name="car_brand" onClick="" value="포드"><label for="cb22"><span>포드</span></label></li>
						<li class="hidden"><input type="radio" id="cb23" name="car_brand" onClick="" value="닷지"><label for="cb23"><span>닷지</span></label></li>
						<li class="hidden"><input type="radio" id="cb24" name="car_brand" onClick="" value="페라리"><label for="cb24"><span>페라리</span></label></li>
						<li class="hidden"><input type="radio" id="cb25" name="car_brand" onClick="" value="람보르기니"><label for="cb25"><span>람보르기니</span></label></li>
						<br class="hidden"><li class="hidden"><input type="radio" id="cb26" name="car_brand" onClick="" value="마세라티"><label for="cb26"><span>마세라티</span></label></li>
						<li class="hidden"><input type="radio" id="cb27" name="car_brand" onClick="" value="파가니"><label for="cb27"><span>파가니</span></label></li>
					</ul>
				</li>
				<li>
					<span><label>가격 </label></span>
					<span><label>주행거리 </label></span>
				</li>
				<li class="li_input">
					<ul id="num">
						<li><input id="price" type="number" placeholder="원" name="car_price" required></li>
						<li><input id="mile" type="number" placeholder="Km" name="car_mile" required></li>
					</ul>
					
				</li>
				<li><label>차량 사진 </label></li>
				<li class="li_input"><input type="file" accept="image/*" name="car_img" placeholder="차량 사진 선택" multiple required></li>
				<li><label>기타 정보 </label></li>
				<li class="li_input"><input type="text" name="car_etc"></li>
			</ul>
			<input id="add_btn" type="submit" class="btn" value="등록" onsubmit="return false;">
		</div>
	</form>
	
	<%@ include file="footer.jsp" %>	<!-- footer -->
</body>
</html>