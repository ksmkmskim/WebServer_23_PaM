/*
 	addComment function
 */
function addComment(pid){
	var url= "http://localhost:8080/PaM/addCmt";
	let cmt_post_id = pid;
	let cmt_user_id = sessionStorage.getItem("sign_in_user_id");
	let cmt_text = document.getElementsByName("comment");
	
	$.ajax({
	        type:"GET",
	        url:url,
	        data:{
				cmt_post_id : cmt_post_id,
				cmt_user_id : cmt_user_id,
				cmt_text : $(cmt_text).val()
			},
	        success : function(data){
				$('#cmts').empty();
				getCommentInfo(cmt_post_id);
			},
			error : function(request,status,error){
				alert('code:'+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); //에러 상태에 대한 세부사항 출력
	            alert(error);
			}
		});
}