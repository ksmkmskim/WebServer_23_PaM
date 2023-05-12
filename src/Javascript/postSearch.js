/*
	postSearch() function
*/
function postSearch(scrollChk = false){
    var url="http://localhost:8080/PaM/maincontrol";
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
            	var $post_li=$('<li></li>');
            	var $post_div=$('<div class="post" onClick="alert(\''+data[i].post_id+'post로 이동\')"></div>');
            	var $post_img=$('<img src="'+data[i].img_list[0]+'" name="'+data[i].post_id+'" >');
            	var $post_info_div=$('<div class="post_info"></div>');
            	var $post_info_ul=$('<ul></ul>');
            	var $car_name_li=$('<li>이름: '+data[i].car_name+'</li>');
            	var $car_brand_li=$('<li>브랜드: '+data[i].car_brand+'</li>');
            	var $car_type_li=$('<li>차종: '+data[i].car_type+'</li>');
            	var $car_price_li=$('<li>가격: '+data[i].car_price+' 원</li>');
            	var $car_mile_li=$('<li>주행거리: '+data[i].car_mile+' Km</li>');
            	if(data[i].car_etc == 'undefined'){
            		var $car_etc_li=$('<li>특이사항 없음</li>');
            	}
            	else{
            		var $car_etc_li=$('<li>'+data[i].car_etc+'</li>');
            	}
            	
            	$post_info_ul.append($car_name_li);
            	$post_info_ul.append($car_brand_li);
            	$post_info_ul.append($car_type_li);
            	$post_info_ul.append($car_price_li);
            	$post_info_ul.append($car_mile_li);
            	$post_info_ul.append($car_etc_li);
            	
            	$post_info_div.append($post_info_ul);
            	
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
            alert(e);
        }
    })
}