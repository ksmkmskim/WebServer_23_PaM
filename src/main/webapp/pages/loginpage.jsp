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
<body>
	<div id="loginbox" align=center">
		<form name="loginform">
			<table align=cener>
				<tr>
					<td><label>ID : </label></td>
					<td><input type="text" name="id"></td>
					<td rowspan="2"><input type="submit" value="Login"></td>
				</tr>
				<tr>
					<td><label>Password : </label></td>
					<td><input type="text" name="id"></td>
				</tr>
			</table>
		</form>
	</div>
	
	<%@ include file="footer.jsp" %>	<!-- footer -->
</body>
</html>