/**
 * 
 */
function userAdd(){
	var url= "http://localhost:8080/PaM/signup";
	let input_id = document.getElementsByName("id");
	let input_pw = document.getElementsByName("pw");
	let input_pwCheck = document.getElementsByName("pwCheck");
	let input_name = document.getElementsByName("name");
	let input_tel = document.getElementsByName("tel");
	let input_addr = document.getElementsByName("addr");
	let input_permission = 0;
	
	let idCheck = null;
	let pwCheck = null;
	let telCheck = null;
	
	let permission = document.getElementsByName("permission");
	for(var i=0; i<permission.length; i++){
		if(permission[i].checked){
			input_permission = permission[i].value;
		}
	}
	
	console.log(input_permission);
	
	//idCheck
	if($(input_id).val().indexOf('@') != -1 ){
		if(($(input_id).val().indexOf('@') > 5) && ($(input_id).val().indexOf('@') < 20)){
			if(($(input_id).val().indexOf('@')+1) < ($(input_id).val().length)){
			    $.ajax({
				    type:"POST",
				    url:url,
				    dataType:"json",
				    data:{
				        input_id : $(input_id).val()
				    },
				    success : function(data){
						if(data == null){
							idCheck = true;
						}else{
							idCheck = false;
						}
					},
					error : function(request,status,error){
				            alert('code:'+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); //에러 상태에 대한 세부사항 출력
				            alert(error);
			        }
				})
			}else{
				idCheck = false;
			}
		}else{
			idCheck = false;
		}
	}else{
		idCheck = false;
	}
	
	//pwCheck
	let pwCharCheck = 0;
	let pwNumCheck = 0;
	if($(input_pw).val() == $(input_pwCheck).val() && $(input_pw).val().length > 7){
		for(var i in $(input_pw).val()){
			if(i > 47 && i < 58){
				pwNumCheck++;
			}else{
				pwCharCheck++;
			}
		}
		if(pwNumCheck > 0 && pwCharCheck > 0){
			pwCheck = 1;		
		}else{
			pwCheck = 2;
		}
	}else if($(input_pw).val().length < 7){
		pwCheck = 3;
	}else{
		pwCheck = 4;
	}
	
	//telCheck
	let telCharCheck = 0;
	for(var i in $(input_pw).val()){
		if(!(i > 47 && i < 58)){
			telCharCheck++;
		}
	}
	if(telCharCheck > 0){
		telCheck = false;		
	}else{
		telCheck = true;
	}
	
	//SignUp
	if(idCheck && pwCheck){
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
	}else if(idCheck == false){
		alert("아이디 입력 오류");
	}else if(pwCheck == 2){
		alert("비밀번호는 문자와 숫자의 조합으로 사용해야 합니다. 다시 확인하세요.");
	}else if(pwCheck == 3){
		alert("비밀번호의 길이가 너무 짧습니다. 다시 확인하세요.");
	}else if(pwCheck == 3){
		alert("비밀번호가 일치하지 않습니다. 다시 확인하세요.");
	}else if(telCheck){
		alert("전화번호는 숫자만 입력하세요. 다시 확인하세요.");
	}else{
		alert("알 수 없는 오류");
	}
	
}