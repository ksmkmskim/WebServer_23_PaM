/*
	getCommentInfo function
*/
function getCommentInfo(pid){
	var url= "http://localhost:8080/PaM/getCmt";
	let cmt_post_id = pid;
	const load_cmt_num = 5;
	
	$.ajax({
	        type:"POST",
	        url:url,
	        dataType: "json",
	        data : {
				cmt_post_id: cmt_post_id,
			},
	        success : function(data){
				for(var i=((cmt_cpage-1) * load_cmt_num); i < data.length && i < cmt_cpage * load_cmt_num; i++){
					var cmt_id = data[i].cmt_id;
					var cmt_post_id = data[i].cmt_post_id;
					var cmt_user_id = data[i].cmt_user.user_id;
					var cmt_user_name = data[i].cmt_user.user_name;
					var cmt_date = data[i].cmt_date;
					var cmt_text = data[i].cmt_text;
					
					var $cmt_hr = $('<hr>')
					var $cmt_li = $('<li></li>');
		           	var $cmt_div = $('<div class="cmt"></div>');
		           	var $cmt_info = $('<span><p>'+cmt_user_name+'</p><p>'+cmt_date+'</p></span>');
		           	var $cmt_btns = $('<span></span>');
		           	var $cmt_rev_btn = $('<span>수정</span>');
		           	var $cmt_del_btn = $('<span>삭제</span>');
		           	var $cmt_br = $('<br>');
		           	var $cmt_text = $('<p>'+cmt_text+'</p>');
		           	
		           	$cmt_div.append($cmt_info);
		           	
		           	if(cmt_user_id == sessionStorage.getItem('sign_in_user_id')){
						$cmt_del_btn.on('click',{cmt_id:cmt_id},(e) => reviseCmt(e.data.cmt_id));
						$cmt_btns.append($cmt_rev_btn);
					}
					if(cmt_user_id == sessionStorage.getItem('sign_in_user_id') || sessionStorage.getItem('sign_in_user_perm') == 3){
						$cmt_del_btn.on('click',{cmt_id:cmt_id, cmt_hr:$cmt_hr, cmt_li:$cmt_li},(e) => deleteCmt(e.data.cmt_id, e.data.cmt_hr, e.data.cmt_li));
						$cmt_btns.append(' ');
						$cmt_btns.append($cmt_del_btn);
					}
		           	
		           	$cmt_div.append($cmt_btns);
		           	$cmt_div.append($cmt_br);
		           	$cmt_div.append($cmt_text);
		           	
		           	$cmt_li.append($cmt_div);
		           	
		           	$('#cmts').append($cmt_hr);
		           	$('#cmts').append($cmt_li);
				}
				
				for(var i=1; i < Math.ceil(data.length / load_cmt_num) + 1; i++){					
					if(i>1){$('#cmt_pages').append('<li>|</li>');}
					$('#cmt_pages').append(' ');
					if(cmt_cpage == i){
						$('#cmt_pages').append('<li class="selected" onClick=changeCmtPage('+i+','+pid+')>'+i+'</li>');
					} else{
						$('#cmt_pages').append('<li onClick=changeCmtPage('+i+','+pid+')>'+i+'</li>');
					}
					
					$('#cmt_pages').append(' ');
				}
				
			},
			error : function(request,status,error){
				alert('code:'+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); //에러 상태에 대한 세부사항 출력
	            alert(error);
			}
		});
}

function changeCmtPage(page, pid){
	cmt_cpage = page;
	$('#cmts').empty();
	$('#cmt_pages').empty();
	getCommentInfo(pid);
	
}