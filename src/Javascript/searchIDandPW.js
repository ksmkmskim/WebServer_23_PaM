/**
 * 
 */

 function clickIdBtn(searchId, searchPw){
	 document.getElementById(searchId).className = 'exposed';	 
	 document.getElementById(searchPw).className = 'hidden';
 }
 
 function clickPwBtn(searchId, searchPw){
	 document.getElementById(searchId).className = 'hidden';
	 document.getElementById(searchPw).className = 'exposed';
 }
 
 function submitSearchId(searchId, print){
	 document.getElementById(searchId).className = 'hidden';
	 document.getElementById(print).className = 'exposed';
	 
	 var url= "http://localhost:8080/PaM//SearchId";
	 let input_name = document.getElementsByName("name");
	 let input_tel = document.getElementsByName("tel");
	 
	 $.ajax({
		 type:"POST",
		 url:url,
		 dataType:"json",
		 data:{
			input_tel : $(input_tel).val() 
		 },
		 success : function(data){
			 if(data.user_name == $(input_name).val()){
				 document.getElementById('itemIn').innerText = data.user_id;
			 } else{
				 document.getElementById('itemIn').innerText = "아이디를 찾을 수 없습니다.";
			 }
		 },
		 error : function(request,status,error){
			 alert('code:'+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); //에러 상태에 대한 세부사항 출력
			 alert(error);
		 }
	 })
 }

 function submitSearchPw(searchPw, print){
	 document.getElementById(searchPw).className = 'hidden';
	 document.getElementById(print).className = 'exposed'; 
	 //document.getElementById(newPw).className = 'exposed'; 
	 
	 var url= "http://localhost:8080/PaM/idCheck";
	 let input_id = document.getElementsByName("id");
	 let input_name = document.getElementsByName("userName");
	 
	 $.ajax({
		 type:"POST",
		 url:url,
		 dataType:"json",
		 data:{
			input_id : $(input_id).val() 
		 },
		 success : function(data){
			 
			 if(data.user_name == $(input_name).val()){
				 document.getElementById('itemIn').innerText = data.user_pw;
			 } else{
				 document.getElementById('itemIn').innerText = "정보를 찾을 수 없습니다.";
			 }
			 
			 /*
			 if(data.user_name == $(input_name).val()){
				document.getElementById('searchPwId').innerHTML= "<input type=\"hidden\" name=\"searchPwID\" value=\""+input_id+"\" required>"
			 } else{
				document.getElementById(searchPw).className = 'exposed';
			 }
			 */
		 },
		 error : function(request,status,error){
			 alert('code:'+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); //에러 상태에 대한 세부사항 출력
			 alert(error);
		 }
	 })
 }
 
 function setPw(newPw, print){
	 document.getElementById(newPw).className = 'hidden';
	 document.getElementById(print).className = 'exposed';
	 
	 var url= "http://localhost:8080/PaM/searchPw";
	 let input_id = document.getElementsByName("searchPwID");
	 let input_pwd = document.getElementsByName("pwd");
	 let input_pwdCheck = document.getElementsByName("pwdCheck");
	 
	 if($(input_pwd).val() == $(input_pwdCheck).val()){
		 $.ajax({
			 type:"POST",
			 url:url,
			 dataType:"json",
			 data:{
				 input_id : $(input_id).val(),
				 input_pwd : $(input_pwd).val()
			 },
			 success : function(data){
				 if(data.user_pw == $(input_pwd).val()){
					 document.getElementById(print).innerText = "비밀번호 변경이 완료되었습니다.";
					 location.href = '/PaM/login';
				 }else{
					 document.getElementById(print).innerText = "비밀번호 변경에 실패했습니다.";
					 location.href = '/PaM/searchPw';
				 }
			 },
			 error : function(request,status,error){
			 alert('code:'+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); //에러 상태에 대한 세부사항 출력
			 alert(error);
			 }
		 })
	 }else{
		 alert("비밀번호가 일치하지 않습니다.");
	 }
 }
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 