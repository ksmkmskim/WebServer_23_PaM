/*
	reviseCmt function
*/
function reviseCmt(e, cid){
	var target_cmt = e.target;
	var cmt_text = $(target_cmt).parents('div.cmt').children('div').text();
	
	$(target_cmt).parents('div.cmt').children().hide();
	
	var cmt_rev_form = $('<form id="revise'+cid+'" action="javascript:;" onSubmit="reviseComment('+cid+')"></form>');
	var cmt_rev_text = $('<textarea name="revComment" required>'+cmt_text+'</textarea><br>');
	var cmt_rev_btn = $('<input type="submit" value="수정"><input type="button" value="취소" onClick="revCancel('+cid+')">');
	
	cmt_rev_form.append(cmt_rev_text);
	cmt_rev_form.append(cmt_rev_btn);
	
	$(target_cmt).parents('div.cmt').append(cmt_rev_form);
}

function reviseComment(cid){
	var url= "http://localhost:8080/PaM/revCmt";
	var cmt_text = document.getElementsByName("revComment");
	
	$.ajax({
		type:"GET",
		url:url,
		data:{
			cid:cid,
			cmt_text:$(cmt_text).val()
		},
		success : function(data){
			var cmt_div = $('#revise'+cid).parents('div.cmt');
			$(cmt_div).children('div').text($(cmt_text).val());
			$(cmt_div).children().show();
			$('#revise'+cid).remove();
		},
		error : function(request,status,error){
			alert('code:'+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); //에러 상태에 대한 세부사항 출력
		       	alert(error);
		}
	});
}

function revCancel(cid){
	var cmt_div = $('#revise'+cid).parents('div.cmt');
	$(cmt_div).children().show();
	$('#revise'+cid).remove();
}