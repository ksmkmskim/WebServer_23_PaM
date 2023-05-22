/**
 * 
 */
function idCheck(){
	var url= "http://localhost:8080/PaM/idCheck";
	let input_id = document.getElementsByName("id");
	
    $.ajax({
    type:"POST",
    url:url,
    dataType:"json",
    data:{
        input_id : $(input_id).val()
    },
    success : function(data){
		if(data.user_id == input_id){
			document.getElementById("idCheckResult").innerText = "<p>이미 사용중이거나 탈퇴한 아이디입니다.</P>";
		}else{
			document.getElementById("idCheckResult").innerText = "<p>사용 가능한 아이디입니다.</P>";
		}
	},
	error : function(request,status,error){
            alert('code:'+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); //에러 상태에 대한 세부사항 출력
            alert(error);
        }
})
}