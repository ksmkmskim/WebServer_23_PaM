/**
 * 
 */
function userAdd(){
	var url= "http://localhost:8080/PaM/signup";
	let input_id = document.getElementsByName("id");
	let input_idCheck = document.getElementsByName("idCheck");
	let input_pw = document.getElementsByName("pw");
	let input_pwCheck = document.getElementsByName("pwCheck");
	let input_name = document.getElementsByName("name");
	let input_tel = document.getElementsByName("tel");
	let input_addr = document.getElementsByName("addr");
	let input_permission = 0;
	
	let idCheck = $(input_idCheck).val();
	let pwCheck = 0;
	let telCheck = false;
	
	
	let permission = document.getElementsByName("permission");
	for(var i=0; i<permission.length; i++){
		if(permission[i].checked){
			input_permission = permission[i].value;
		}
	}
	
	//pwCheck
	if($(input_pw).val() == $(input_pwCheck).val() && $(input_pw).val().length >= 7 && isNaN($(input_pw).val())){
		pwCheck = 1;
	}else if($(input_pw).val() != $(input_pwCheck).val()){
		pwCheck = 2
	}else if(!(isNaN($(input_pw).val()))){
		pwCheck = 3;
	}else if($(input_pw).val().length < 7){
		pwCheck = 4;
	}else{
		pwCheck = 5;
	}
		
	
	//telCheck
	if(!(isNaN($(input_tel).val()))){
		telCheck = true;		
	}else{
		telCheck = false;
	}
	
	console.log("idCheck : " + idCheck);
	
	//SignUp
	if((pwCheck == 1) && telCheck && (idCheck == "true")){
		$.ajax({
		    type:"POST",
		    url:url,
		    dataType:"json",
		    data:{
		        input_id : $(input_id).val(),
		        input_pw : $(input_pw).val(),
		        input_pwCheck : $(input_pwCheck).val(),
		        input_name : $(input_name).val(),
		        input_tel : $(input_tel).val(),
		        input_addr : $(input_addr).val(),
		        input_permission : input_permission
		    },
		    success : function(data){
				if(data != null){
					alert("가입되었습니다.");
					location.href = '/PaM/login';
				}else{
					alert("가입에 실패했습니다.");
					location.href = '/PaM/signup';
				}
			},
			error : function(request,status,error){
		            alert('code:'+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); //에러 상태에 대한 세부사항 출력
		            alert(error);
	        }
	    })
	}else if(idCheck == "false"){
		alert("아이디 입력 오류");
	}else if(pwCheck == 2){
		alert("비밀번호가 일치하지 않습니다. 다시 확인하세요.");
	}else if(pwCheck == 3){
		alert("비밀번호는 숫자만 사용하는 것은 불가합니다. 다시 확인하세요.");
	}else if(pwCheck == 4){
		alert("비밀번호의 길이가 너무 짧습니다. 다시 확인하세요.");
	}else if(pwCheck == 5){
		alert("비밀번호가 일치하지 않습니다. 다시 확인하세요.");
	}else if(telCheck == false){
		alert("전화번호는 숫자만 입력하세요. 다시 확인하세요.");
	}else{
		alert("알 수 없는 오류");
	}
	
}