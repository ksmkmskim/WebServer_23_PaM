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
	
	let permission = document.getElementsByName("permission");
	for(var i=0; i<permission.length; i++){
		if(permission[i].checked){
			input_permission = permission[i].value;
		}
	}
	
	console.log(input_permission);
	
	if($(input_pw).val() == $(input_pwCheck).val()){
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
	}else{
		alert("비밀번호가 일치하지 않습니다. 다시 확인하세요.");
	}
}