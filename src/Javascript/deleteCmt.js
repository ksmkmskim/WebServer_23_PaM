/*
	deleteCmt function
*/
function deleteCmt(cid, cmt_post_id, e_cmt_hr, e_cmt_li){
	var url= "http://localhost:8080/PaM/delCmt";
	$(e_cmt_hr).remove();
	$(e_cmt_li).remove();
	
	$.ajax({
		type:"GET",
		url:url,
		data:{
			cid:cid
		},
		success : function(data){
			$('#cmts').empty();
			$('#cmt_pages').empty();
			getCommentInfo(cmt_post_id);
		},
		error : function(request,status,error){
			alert('code:'+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); //에러 상태에 대한 세부사항 출력
		       	alert(error);
		}
	});			
}