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
			padding-top: 0px;
			padding-bottom: 50px;
			width: 600px;
			background-color: white;
			border-radius: 30px;
			box-shadow: 0px 0px 3px black;
		}
		#loginBox > div > div{
			padding-top: 0px;
			margin-top: 0px;
			margin-bottom: 40px;
			border-top-left-radius: 30px;
			border-top-right-radius: 30px;
		}
		#loginBox > div > form > table{
			text-align: center;
		}
		
		#err_msg{
			text-align: left;
			color: red;
			font-family: 'Pretendard Variable';
		}
		#err_msg > td{
			padding-left: 20px;
		}
		
		td{
			padding-top: 35px;
		}
		
		input{
			width: 350px;
			height: 30px;
			padding: 3px 12px;
			border-top: none;
			border-left: none;
			border-right: none;
			border-bottom: 2px solid black;
			background: transparent;
			font-size: 13pt;
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
			width: 406px;
			height: 50px;
			background-color: white;
			border-radius: 30px;
			font-size: 12pt;
			letter-spacing: 2px;
		}
		#login_btn:hover{
			color: white;
			background-color: #364448;
		}
		.choiceBtn{
			height: 50px;
			width: 294px;
			background-color: #F2F5F5;
			border: solid 3px #364448;
			font-family: 'Lato';
			color: #364448;
			cursor: pointer;
		}
		#choiceBtnLeft{
			border-top-left-radius: 30px;
			float:left;
		}
		#choiceBtnRight{
			border-top-right-radius: 30px;
			float: right;
		}
	</style>
</head>
<body>
	<div align="center" id="patAndMat"><a href="/PaM/main" >PAT & MAT</a></div>
	<div align="center" id="loginBox">
		<div>
			<div style="height: 50px;">
				<div class="choiceBtn" id="choiceBtnLeft">test</div>
				<div class="choiceBtn" id="choiceBtnRight">test</div>
			</div>
			<form name="login_form" action="/PaM/login" method="post">
				<table>
					<tr>
						<td><input type="text" name="id" placeholder="ID" required></td>
					</tr>
					<tr>
						<td><input type="password" name="pwd" placeholder="PASSWORD" required></td>
					</tr>
					<tr>
						<td style="padding-top: 25px; padding-bottom: 25px;"><input type="submit" id="login_btn" class="btn" value="NEXT">
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>