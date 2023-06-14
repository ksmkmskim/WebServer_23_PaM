/*
	revisePost function
 */
function revisePost(pid){
	var sin_user_id = sessionStorage.getItem('sign_in_user_id');
	if(sin_user_id != null){
		var purl="http://localhost:8080/PaM/post";
		
		$.ajax({
			type:"POST",
	        url:purl,
	        dataType:"json",
	        data:{
	            pid : pid
	        },
	        success : function(data){
				if(data.post_user.user_id == sin_user_id){
					var revise="/PaM/add?id=" + pid;
					location.href = revise;
				}
				else{
					console.log("not authorized");
				}
			},
			error : function(request,status,error){
				alert('code:'+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); //에러 상태에 대한 세부사항 출력
            	alert(error);
			}
		});
	}
	else{
		var login = '/PaM/login';
		location.href = login;
	}
	
}