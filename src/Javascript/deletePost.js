/*
	deletePost function
 */
function deletePost(pid){
	var sin_user_id = sessionStorage.getItem('sign_in_user_id');
	var sin_user_perm = sessionStorage.getItem('sign_in_user_perm');
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
				if(data.post_user.user_id == sin_user_id || sin_user_perm == 3){
					var durl="http://localhost:8080/PaM/delete";
					
					$.ajax({
						type:"GET",
						url:durl,
						dataType:"html",
						data:{
							pid:pid
						},
						success : function(d){
							console.log(d.msg);
							var main = '/PaM/main';
							location.href = main
						},
						error : function(request,status,error){
							alert('code:'+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); //에러 상태에 대한 세부사항 출력
            				alert(error);
						}
					});
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