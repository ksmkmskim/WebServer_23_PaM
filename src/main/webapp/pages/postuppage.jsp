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
			width: 600px;
			padding: 0px;
			padding-bottom: 50px;
			border: 4px solid black;
			border-radius: 30px;
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
		
		input{
			width: 350px;
			height: 30px;
			border-top: none;
			border-left: none;
			border-right: none;
			border-bottom: 2px solid black;
			background: transparent;
		}
		input:focus{
			outline: none;
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
		
		#radiobox{
			width: 25px;
			height: 16px;
			font-size: 20px;
		}
		#radiobox:checked{
			accent-color: #364448;
		}
	</style>
<body>
	<div align="center" id="patAndMat"><a href="/PaM/main" >PAT & MAT</a></div>
	<form>
		<div id="add_post_box" align="center">
			<table>
				<tr class="labelTr">
					<td><label>차량 이름 </label></td>
				</tr>
				<tr>
					<td><input type="text" name="car_name" required></td>
				</tr>
				<tr class="labelTr">
					<td><label>차량 브랜드 </label></td>
				</tr>
				<tr>
					<td><input type="password" name=""></td>				
				</tr>
				<tr class="labelTr">
					<td><label>차종 </label></td>
				</tr>
				<tr>
					<td><input type="password" name=""></td>
				</tr>
				<tr class="labelTr">
					<td><label>가격 </label></td>
					<td><label>주행거리 </label></td>
				</tr>
				<tr>
					<td><input id="price" type="number" placeholder="원" name="car_price" required></td>
					<td><input id="mile" type="number" placeholder="Km" name="car_mile" required></td>
				</tr>
				<tr class="labelTr">
					<td><label>차량 사진 </label></td>
				</tr>
				<tr >
					<td><input type="file" accept="image/*" name="" multiple required></td>
				</tr>
				<tr class="labelTr">
					<td><label>기타 정보 </label></td>
				</tr>
				<tr>
					<td><input type="text" name="car_etc"></td>
				</tr>
				<tr class="labelTr">
					<td><input id="add_btn" type="submit" class="btn" value="등록"></td>
				</tr>		
			</table>
		</div>
	</form>
	
	<%@ include file="footer.jsp" %>	<!-- footer -->
</body>
</html>