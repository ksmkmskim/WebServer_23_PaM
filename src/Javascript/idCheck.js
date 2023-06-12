/**
 * 
 */
function idCheck(){
	var url= "http://localhost:8080/PaM/idCheck";
	let input_id = document.getElementsByName("id");
	
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
							document.getElementById("idCheckResult").innerHTML = "<p style=\"color: green;\">사용 가능한 아이디입니다.</P>";
							document.getElementById("idCheckResult3").innerHTML = "<input type=\"hidden\" name=\"idCheck\" value=true>";
						}else{
							document.getElementById("idCheckResult").innerHTML = "<p style=\"color: red;\">이미 사용중인 아이디입니다.</P>";
							document.getElementById("idCheckResult3").innerHTML = "<input type=\"hidden\" name=\"idCheck\" value=false>";
						}
						// document.getElementById("idCheckResult2").innerHTML = "<td style=\"padding-top: 0px;\"><label>비밀번호</label></td>";
						
					},
					error : function(request,status,error){
				            alert('code:'+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); //에러 상태에 대한 세부사항 출력
				            alert(error);
			        }
				})
			}else{
				document.getElementById("idCheckResult").innerHTML = "<p style=\"color: red;\">이메일 주소를 입력해주세요.</P>";
				document.getElementById("idCheckResult3").innerHTML = "<input type=\"hidden\" name=\"idCheck\" value=false>";
			}
		}else{
			document.getElementById("idCheckResult").innerHTML = "<p style=\"color: red;\">아이디는 6자 이상, 20자 미만으로 사용가능합니다.</P>";
			document.getElementById("idCheckResult3").innerHTML = "<input type=\"hidden\" name=\"idCheck\" value=false>";
		}
	}else{
		document.getElementById("idCheckResult").innerHTML = "<p style=\"color: red;\">이메일 형태가 아닙니다.</P>";
		document.getElementById("idCheckResult3").innerHTML = "<input type=\"hidden\" name=\"idCheck\" value=false>";
	}
}