<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Pat & Mat</title>
	<link rel="stylesheet" href="/PaM/src/css/font.css" />  <!-- font css --> 
	<link rel="stylesheet" href="/PaM/src/css/body.css" /> <!-- body css -->
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
		#signupBox{
			margin-top: 100px;
			margin-bottom: 150px;
			width: 600px;
			padding: 0px;
			padding-bottom: 50px;
			border: 2px solid black;
			display: inline-block;
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
		#idCheck_btn{
			position: relative;
			left: -100px;
			font-weight: bold;
			margin-top: 10px;
			width: 90px;
			border-radius: 20px;
			font-size: 12pt;
			letter-spacing: 2px;
		}
		#submit_btn{
			margin-top: 20px;
			width: 350px;
			border-radius: 30px;
			font-size: 12pt;
			letter-spacing: 2px;
		}
	</style>
</head>
<body>
	<div align="center" id="patAndMat"><a href="/PaM/main" >PAT & MAT</a></div>
	<div id="signupBox" align="center">
		<form name="signupForm">
			<table>
				<tr class="labelTr">
					<td><label>아이디 </label></td>
				</tr>
				<tr>
					<td><input type="text" name="id">
					<button id="idCheck_btn" class="btn" onClick="">중복확인</button></td>
				</tr>
				<tr class="labelTr">
					<td><label>비밀번호 </label></td>
				</tr>
				<tr>
					<td><input type="text" name="password"></td>				
				</tr>
				<tr class="labelTr">
					<td><label>비밀번호 확인 </label></td>
				</tr>
				<tr>
					<td><input type="text" name="passwordCheck"></td>
				</tr>
				<tr class="labelTr">
					<td><label>이름 </label></td>
				</tr>
				<tr>
					<td><input type="text" name="userName"></td>
				</tr>
				<tr class="labelTr">
					<td><label>전화번호 </label></td>
				</tr>
				<tr >
					<td><input type="text" name="phoneNum"></td>
				</tr>
				<tr class="labelTr">
					<td><label>주소 </label></td>
				</tr>
				<tr>
					<td><input type="text" name="address"></td>
				</tr>
				<tr class="labelTr">
					<td><button id="submit_btn" class="btn" onClick=""><p>SIGN UP</p></button></td>
				</tr>		
			</table>
		</form>
	</div>
	
	<%@ include file="footer.jsp" %>	<!-- footer -->
</body>
</html>