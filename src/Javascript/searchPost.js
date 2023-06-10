/*
	searchPost() function
*/
function searchPost(scrollChk = false){
    var url="http://localhost:8080/PaM/main";
    let types = document.getElementsByName("car_type");
    let brands = document.getElementsByName("car_brand");
    let search = document.getElementsByName("search");
    let type_list = new Array();
    let brand_list = new Array();
    const load_post_num = 4;	// 페이지당 게시물 수

    for(var i=0; i<types.length; i++){
    	if(types[i].checked){
    		type_list.push(types[i].value);
    	}
    }
    for(var i=0; i<brands.length; i++){
    	if(brands[i].checked){
    		brand_list.push(brands[i].value);
    	}
    }
    
    $.ajax({
        type:"POST",
        url:url,
        dataType:"json",
        data:{
            car_type : type_list,
            car_brand : brand_list,
            search : $(search).val()
        },
        success : function(data){
        	//console.log(data);
        	if (!scrollChk){
				$('#post_container>ul').empty();
				cpage=1;
			}

            for(var i=((cpage-1) * load_post_num); i < data.length && i < cpage * load_post_num; i++){
            	var $post_li = $('<li></li>');
            	var $post_div = $('<div class="post"></div>');
            	var $post_img = $('<div class="post_img"><img src="'+data[i].img_list[0]+'"></div>');
            	var $post_info_div = $('<div class="post_info"></div>');
            	var $post_info = $('<span class="car_info">'+data[i].car_brand +' '+ data[i].car_name+'</span><span class="car_price">'+data[i].car_price.toLocaleString()+' 원</span>');
            	var $post_info_hr = $('<hr>');
            	var $post_rm_btn = $('<button class="read_more_btn" onClick="location.href=\'/PaM/post?id='+data[i].post_id+'\'">MORE INFO</button>');
            	
            	$post_info_div.append($post_info);
            	$post_info_div.append($post_info_hr);
            	$post_info_div.append($post_rm_btn);
            	
            	$post_div.append($post_img);
            	$post_div.append($post_info_div);
            	
            	$post_li.append($post_div);
            	
            	if((i % 4 == 0) && i != 0){
            		var $br=$('<br>');
            		$br.appendTo($('#post_container>ul'));
            	}
	            $post_li.appendTo($('#post_container>ul'));
            }
			if(Math.ceil(data.length / load_post_num) + 1 != cpage){
				cpage++;
			}
        },
        error : function(request,status,error){
            alert('code:'+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); //에러 상태에 대한 세부사항 출력
            alert(error);
        }
    })
}