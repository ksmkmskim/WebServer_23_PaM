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
		
		#header_logo_l > a > img{
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
		}
		.post > img{
			height: 206px;
			width: 290px;
			margin-top: 15px;
			border-radius: 10px;
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
	<!-- filterPost() -->
	<script>
		function filterPost(){
		    var url="http://localhost:8080/PaM/maincontrol";
		    let types = document.getElementsByName("car_type");
		    let brands = document.getElementsByName("car_brand");
		    let search = document.getElementsByName("search");

		    let type_list = new Array();
		    let brand_list = new Array();

		    for(var i=0; i<types.length; i++){
		    	if(types[i].checked){
		    		type_list.push(types[i].value);
		    	}
		    }
		    for(var i=0; i<brands.length; i++){
		    	if(brands[i].checked){
		    		brand_list.push(brands[i].value);
		    	}
		    }

		    //console.log(type_list);
		    //console.log(brand_list);
		    
		    $.ajax({
		        type:"POST",
		        url:url,
		        dataType:"json",
		        data:{
		            car_type : type_list,
		            car_brand : brand_list,
		            search : $(search).val()
		        },
		        success : function(data){
		        	//console.log(data);
		        	//request.setAttribute('posts', data);  // 처음 main 컨트롤러를 호출하면, request에 모든 객체에 대한 정보가 저장되지 않나?
		        	$('#post_container>ul').empty();
		            for(var i=0; i < data.length; i++){
		            	var $post_li=$('<li></li>');
		            	var $post_div=$('<div class="post" onClick="alert(\''+data[i].post_id+'post로 이동\')"></div>');
		            	var $post_img=$('<img src="'+data[i].img_list[0]+'" name="'+data[i].post_id+'" >');
		            	var $post_info_div=$('<div class="post_info"></div>');
		            	var $post_info_ul=$('<ul></ul>');
		            	var $car_name_li=$('<li>이름: '+data[i].car_name+'</li>');
		            	var $car_brand_li=$('<li>브랜드: '+data[i].car_brand+'</li>');
		            	var $car_type_li=$('<li>차종: '+data[i].car_type+'</li>');
		            	var $car_price_li=$('<li>가격: '+data[i].car_price+' 원</li>');
		            	var $car_mile_li=$('<li>주행거리: '+data[i].car_mile+' Km</li>');
		            	if(data[i].car_etc == 'undefined'){
		            		var $car_etc_li=$('<li>특이사항 없음</li>');
		            	}
		            	else{
		            		var $car_etc_li=$('<li>'+data[i].car_etc+'</li>');
		            	}
		            	
		            	$post_info_ul.append($car_name_li);
		            	$post_info_ul.append($car_brand_li);
		            	$post_info_ul.append($car_type_li);
		            	$post_info_ul.append($car_price_li);
		            	$post_info_ul.append($car_mile_li);
		            	$post_info_ul.append($car_etc_li);
		            	
		            	$post_info_div.append($post_info_ul);
		            	
		            	$post_div.append($post_img);
		            	$post_div.append($post_info_div);
		            	
		            	$post_li.append($post_div);
		            	
		            	if((i % 4 == 0) && i != 0){
		            		var $br=$('<br>');
		            		$br.appendTo($('#post_container>ul'));
		            	}
			            $post_li.appendTo($('#post_container>ul'));
		            }
		        },
		        error : function(request,status,error){
		            alert('code:'+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); //에러 상태에 대한 세부사항 출력
		            alert(e);
		        }
		    })
		}
	</script>
</head>
<body>
	<%@ include file="nav.jsp" %>	<!-- nav -->
	
	<header>
		<div id="header">
			<div id="header_logo_l"><a href="/PaM/maincontrol"><img src="/PaM/src/img/logo_l.png" width="330"></a></div>	<!-- 클릭시 메인페이지 이동 추가 필요-->
			<div id="header_search_bar">
				<fieldset class="field-container">
					<input type="text" name="search" placeholder="차량 검색" class="field">
					<div class="icon-container" onClick="filterPost()">		<!-- onClick 값 수정 필요 -->
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
								<input type="checkbox" name="car_type" onClick="filterPost()" value="슈퍼카">슈퍼카
								<input type="checkbox" name="car_type" onClick="filterPost()" value="스포츠카">스포츠카
								<input type="checkbox" name="car_type" onClick="filterPost()" value="쿠페">쿠페
								<input type="checkbox" name="car_type" onClick="filterPost()" value="머슬카">머슬카
								<input type="checkbox" name="car_type" onClick="filterPost()" value="세단">세단
								<input type="checkbox" name="car_type" onClick="filterPost()" value="SUV">SUV
								<input type="checkbox" name="car_type" onClick="filterPost()" value="픽업 트럭">픽업 트럭
								<input type="checkbox" name="car_type" onClick="filterPost()" value="트럭">트럭
							</td>
						</tr>
						<tr>
							<td>브랜드</td>
							<td>
								<input type="checkbox" name="car_brand" onClick="filterPost()" value="Hyundai">현대
								<input type="checkbox" name="car_brand" onClick="filterPost()" value="KIA">기아
								<input type="checkbox" name="car_brand" onClick="filterPost()" value="Toyota">도요타
								<input type="checkbox" name="car_brand" onClick="filterPost()" value="Honda">혼다
								<input type="checkbox" name="car_brand" onClick="filterPost()" value="Nissan">닛산<br>
								<input type="checkbox" name="car_brand" onClick="filterPost()" value="Renault">르노
								<input type="checkbox" name="car_brand" onClick="filterPost()" value="Bugatti">부가티
								<input type="checkbox" name="car_brand" onClick="filterPost()" value="Volvo">볼보
								<input type="checkbox" name="car_brand" onClick="filterPost()" value="Koenigsegg">코닉세그
								<input type="checkbox" name="car_brand" onClick="filterPost()" value="Benz">메르세데스-벤츠<br>
								<input type="checkbox" name="car_brand" onClick="filterPost()" value="Porsche">포르쉐
								<input type="checkbox" name="car_brand" onClick="filterPost()" value="Volkswagen">폭스바겐
								<input type="checkbox" name="car_brand" onClick="filterPost()" value="BMW">BMW
								<input type="checkbox" name="car_brand" onClick="filterPost()" value="Audi">아우디
								<input type="checkbox" name="car_brand" onClick="filterPost()" value="Rolls">롤스로이스<br>
								<input type="checkbox" name="car_brand" onClick="filterPost()" value="Bentley">벤틀리
								<input type="checkbox" name="car_brand" onClick="filterPost()" value="McLaren">맥라렌
								<input type="checkbox" name="car_brand" onClick="filterPost()" value="Jagur">재규어
								<input type="checkbox" name="car_brand" onClick="filterPost()" value="Chevrolet">쉐보레
								<input type="checkbox" name="car_brand" onClick="filterPost()" value="Jeep">지프<br>
								<input type="checkbox" name="car_brand" onClick="filterPost()" value="Tesla">테슬라
								<input type="checkbox" name="car_brand" onClick="filterPost()" value="Ford">포드
								<input type="checkbox" name="car_brand" onClick="filterPost()" value="Dodge">닷지
								<input type="checkbox" name="car_brand" onClick="filterPost()" value="Ferrari">페라리
								<input type="checkbox" name="car_brand" onClick="filterPost()" value="Lamborghini">람보르기니<br>
								<input type="checkbox" name="car_brand" onClick="filterPost()" value="Maserati">마세라티
								<input type="checkbox" name="car_brand" onClick="filterPost()" value="Pagani">파가니
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
			<ul></ul><script>filterPost();</script>
		</div>
	</main>
	
	<%@ include file="footer.jsp" %>	<!-- footer -->
</body>
</html>