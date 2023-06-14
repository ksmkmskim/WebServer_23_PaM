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
		
		#searchBox{
			margin-top: 100px;
			margin-bottom: 150px;
		}
		#searchBox > div{
			padding-top: 0px;
			padding-bottom: 50px;
			width: 600px;
			background-color: white;
			border-radius: 30px;
			box-shadow: 0px 0px 3px black;
		}
		#searchBox > div > div{
			padding-top: 0px;
			margin-top: 0px;
			margin-bottom: 30px;
			border-top-left-radius: 30px;
			border-top-right-radius: 30px;
		}
		#searchBox > div > form > table{
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
			padding-top:45px;
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
		
		#search_btn{
			margin-top: 20px;
			width: 406px;
			height: 50px;
			background-color: white;
			border-radius: 30px;
			font-size: 12pt;
			letter-spacing: 2px;
		}
		#search_btn:hover{
			color: white;
			background-color: #364448;
		}
		#choiceBtn > input{
			height: 60px;
			width: 300px;
			cursor: pointer;
			border: 0px;
			font-family: 'Lato';
		}
		#choiceBtnLeft{
			border-top-left-radius: 30px;
			float:left;
		}
		#choiceBtnRight{
			border-top-right-radius: 30px;
			float: right;
		}
		label{
			color: #485A61;
			font-family: 'Lato';
			font-weight: bold;
			font-size: 12pt;
			margin-left: 15px;
		}
		.inputTd{
			padding-top: 10px;
		}
		.exposed{
			display: block;
		}
		.hidden{
			display: none;
		}
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript" src="/PaM/src/Javascript/searchIDandPW.js"></script>
</head>
<body>
	<div align="center" id="patAndMat"><a href="/PaM/main" >PAT & MAT</a></div>
	<div align="center" id="searchBox">
		<div id="searchId" class="exposed">
			<div id="choiceBtn">
				<input type="button" id="choiceBtnLeft"  onClick="clickIdBtn('searchId', 'searchPw')" value='아이디 찾기' style="background-color: white; color:#364448;">
				<input type="button" id="choiceBtnRight"  onClick="clickPwBtn('searchId', 'searchPw')" value='비밀번호 찾기' style="background-color: #364448; color: white;">
			</div>
			<form action="javascript:;" onSubmit="submitSearchId('searchId', 'print', 'itemIn')">
				<table>
					<tr align="left">
						<td><label>이름 </label></td>
					</tr>
					<tr>
						<td class="inputTd"><input type="text" name="name" placeholder="NAME" required></td>
					</tr>
					<tr align="left">
						<td><label>전화번호 </label></td>
					</tr>
					<tr>
						<td class="inputTd"><input type="text" name="tel" placeholder="PHONE NUMBER" required></td>
					</tr>
					<tr>
						<td style="padding-top: 25px; padding-bottom: 25px;">
						<input type="submit" id="search_btn" class="btn" value="NEXT">
						</td>
					</tr>
				</table>
			</form>
		</div>
		<div id="searchPw" class="hidden">
			<div id="choiceBtn">
				<input type="button" id="choiceBtnLeft"  onClick="clickIdBtn('searchId', 'searchPw')" value='아이디 찾기' style="background-color: #364448; color: white;">
				<input type="button" id="choiceBtnRight"  onClick="clickPwBtn('searchId', 'searchPw')" value='비밀번호 찾기' style="background-color: white; color: #364448;">
			</div>
			<form action="javascript:;" onSubmit="submitSearchPw('searchPw', 'print')">
				<table>
					<tr align="left">
						<td><label>이메일 </label></td>
					</tr>
					<tr>
						<td class="inputTd"><input type="text" name="id" placeholder="E-Mail" required></td>
					</tr>
					<tr align="left"> 
						<td><label>이름 </label></td>
					</tr>
					<tr>
						<td class="inputTd"><input type="text" name="userName" placeholder="NAME" required></td>
					</tr>
					<tr>
						<td style="padding-top: 25px; padding-bottom: 25px;">
						<input type="submit" id="search_btn" class="btn" value="NEXT">
						</td>
					</tr>
				</table>
			</form>
		</div>
		<div id="print" class="hidden">
			<table>
				<tr>
					<td><div id="itemIn" align="center"></div></td>
				</tr>
				<tr>
					<td><button id="search_btn" class="btn" onClick="location.href='/PaM/login'">NEXT</button></td>
				</tr>
			</table>
		</div>
		<div id="newPw" class="hidden">
			<div id="choiceBtn">
					<input type="button" id="choiceBtnLeft"  onClick="clickIdBtn('searchId', 'searchPw')" value='아이디 찾기' style="background-color: #364448; color: white;">
					<input type="button" id="choiceBtnRight"  onClick="clickPwBtn('searchId', 'searchPw')" value='비밀번호 찾기' style="background-color: white; color: #364448;">
			</div>
			<form name="" action="" method="post">
				<table>
					<tr align="left">
						<td><label>새로운 비밀번호 </label></td>
					</tr>
					<tr>
						<td class="inputTd"><input type="password" name="pwd" placeholder="PASSWORD" required></td>
					</tr>
					<tr align="left"> 
						<td><label>비밀번호 확인 </label></td>
					</tr>
					<tr>
						<td class="inputTd"><input type="password" name="pwdCheck" placeholder="PASSWORD CHECK" required></td>
					</tr>
					<tr>
						<td id="searchPwID"></td>
					</tr>
					<tr>
						<td style="padding-top: 25px; padding-bottom: 25px;">
						<input type="submit" id="search_btn" class="btn" value="NEXT" onClick="setPw('newPw', 'print')">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>