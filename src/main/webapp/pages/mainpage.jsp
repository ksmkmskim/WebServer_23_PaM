<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Pat & Mat</title>
	<link rel="stylesheet" href="/PaM/src/css/body.css" /> <!-- body css -->
	<style>
		/*====================================   header   =====================================*/
		#header{
			text-align: center;
		}
		
		#header_logo_l > img{
			margin-top: 20px;
			border: 5px;
			border-color: black;
			filter: drop-shadow(0px 5px 4px black);
		}
		
		#header_search_bar{
			display: flex;
			justify-content: center;
			margin-top: 40px;
		}
		
		#header_filter{
			margin-top: 50px;
			font-weight: bold;
		}
		#header_filter > span > table{
			margin-top: 0px;
			margin-left: auto;
			margin-right: auto;
			text-align: left;
			display: inline-block;
		}
		#header_filter > span > table tr:nth-child(2) td{
			border-top: black solid 1px;
		}
		#header_filter > span > table tr{
			margin-top: 10px;
		}
		
		#header_filter > span > table tr td:nth-child(1){
			border-right: black solid 1px;
			padding-right: 20px;
		}
		#header_filter > span > table tr td:nth-child(2){
			padding-left: 10px;
		}
		#header_filter > span > table tr td > input{
			margin-top: 10px;
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
			width: 1100px;
			margin-top: 20px;
		}
		
		#post_container{
			text-align: center;
		}
		#post_container > ul{
			display: block;
			list-style-type: none;
		}
		#post_container > ul > li{
			display: inline;
		}
		
		.post{
			display: inline;
			margin: 5px;
		}
		.post > img{
			height: 125px;
			width: 183px;
			margin-top: 15px;
			border-radius: 10px;
		}
		.post > img:hover {
			filter: brightness(40%);
		}
	</style>

</head>
<body>
	<%@ include file="nav.jsp" %>	<!-- nav -->
	
	<header>
		<div id="header">
			<div id="header_logo_l"><img src="/PaM/src/img/logo_l.png" width="330"></div>	<!-- 클릭시 메인페이지 이동 추가 필요-->
			<div id="header_search_bar">
				<fieldset class="field-container">
				<div></div>
					<input type="text" placeholder="차량 검색" class="field">
					<div class="icon-container" onClick="alert('search')">		<!-- onClick 값 수정 필요 -->
						<div class="icon-search"></div>
					</div>
				</fieldset>
			</div>
			<div id="header_filter">
				<span>
					<table>		<!-- 다른 디자인 방법은 없을까;; -->
						<tr>
							<td>차종</td>
							<td>
								<input type="checkbox" name="car_type" value="슈퍼카">슈퍼카
								<input type="checkbox" name="car_type" value="스포츠카">스포츠카
								<input type="checkbox" name="car_type" value="쿠페">쿠페
								<input type="checkbox" name="car_type" value="머슬카">머슬카
								<input type="checkbox" name="car_type" value="세단">세단
								<input type="checkbox" name="car_type" value="SUV">SUV
								<input type="checkbox" name="car_type" value="픽업 트럭">픽업 트럭
								<input type="checkbox" name="car_type" value="트럭">트럭
							</td>
						</tr>
						<tr>
							<td>브랜드</td>
							<td>
								<input type="checkbox" name="car_brand" value="Hyundai">현대
								<input type="checkbox" name="car_brand" value="KIA">기아
								<input type="checkbox" name="car_brand" value="Renault">르노
								<input type="checkbox" name="car_brand" value="Toyota">도요타
								<input type="checkbox" name="car_brand" value="Honda">혼다<br>
								<input type="checkbox" name="car_brand" value="Nissan">닛산
								<input type="checkbox" name="car_brand" value="Volvo">볼보
								<input type="checkbox" name="car_brand" value="Koenigsegg">코닉세그
								<input type="checkbox" name="car_brand" value="Benz">메르세데스-벤츠
								<input type="checkbox" name="car_brand" value="Porsche">포르쉐<br>
								<input type="checkbox" name="car_brand" value="Volkswagen">폭스바겐
								<input type="checkbox" name="car_brand" value="BMW">BMW
								<input type="checkbox" name="car_brand" value="Audi">아우디
								<input type="checkbox" name="car_brand" value="Rolls">롤스로이스
								<input type="checkbox" name="car_brand" value="Bentley">벤틀리<br>
								<input type="checkbox" name="car_brand" value="McLaren">맥라렌
								<input type="checkbox" name="car_brand" value="Jagur">재규어
								<input type="checkbox" name="car_brand" value="Chevrolet">쉐보레
								<input type="checkbox" name="car_brand" value="Jeep">지프
								<input type="checkbox" name="car_brand" value="Tesla">테슬라<br>
								<input type="checkbox" name="car_brand" value="Ford">포드
								<input type="checkbox" name="car_brand" value="Dodge">닷지
								<input type="checkbox" name="car_brand" value="Ferrari">페라리
								<input type="checkbox" name="car_brand" value="Lamborghini">람보르기니
								<input type="checkbox" name="car_brand" value="Maserati">마세라티
								<input type="checkbox" name="car_brand" value="Pagani">파가니
							</td>
						</tr>
					</table>
				</span>
				<span id="post_btn">	<!-- 동적으로 표시 유무 구현 -->
					<img src="/PaM/src/img/post_button.png" onClick="alert('post button')">	<!-- onClick 수정 필요 -->
				</span>
			</div>
		</div>
	</header>
	
	<main>
		<hr>
		<div id="post_container">		<!-- 포스트 이동 추가, 마우스 올릴 시 정보표시 기능 추가 필요 -->
			<ul>
				<c:forEach var="p" items="${posts}" varStatus="status">
					<li><div class="post" onClick="alert('post로 이동')"><img src="${p.getImg_list().get(0)}"></div></li>
					<c:if test="${(status.count % 4) == 0}"><br></c:if>
				</c:forEach> 
			</ul>
		</div>
	</main>
	
	<%@ include file="footer.jsp" %>	<!-- footer -->
</body>
</html>