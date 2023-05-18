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
		#loginBox{
			margin-top: 100px;
			margin-bottom: 150px;			
		}
		#loginBox > div{
			padding-top: 50px;
			padding-bottom: 50px;
			width: 600px;
			border: 4px solid black;
			border-radius: 30px;
		}
		td{
			padding-top: 35px;
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
		#login_btn{
			margin-top: 20px;
			width: 350px;
			height: 50px;
			border-radius: 30px;
			font-size: 12pt;
			letter-spacing: 2px;
		}
	</style>
</head>
<body>
	<div align="center" id="patAndMat"><a href="/PaM/main" >PAT & MAT</a></div>
	<div align="center" id="loginBox">
		<div>
			<form>
				<table>
					<tr>
						<td><input type="text" name="id" placeholder="ID"></td>
					</tr>
					<tr>
						<td><input type="text" name="password" placeholder="PASSWORD"></td>
					</tr>
					<tr>
						<td style="padding-top: 25px; padding-bottom: 25px;"><button id="login_btn" class="btn" onClick="">LOGIN</button>
					</tr>
				</table>
			</form>
		</div>
	</div>
	
	<%@ include file="footer.jsp" %>	<!-- footer -->
</body>
</html>