/*
	getPostInfo function
 */

function getPostInfo(pid){
	var url="http://localhost:8080/PaM/post";
	
	$.ajax({
        type:"POST",
        url:url,
        dataType:"json",
        data:{
            pid : pid
        },
        success : function(data){
			var post_id = data.post_id
			var post_user = data.post_user.user_name;
			var post_date = data.post_date;
			var car_name = data.car_brand + ' ' + data.car_name;
			var car_price = data.car_price + ' 원';
			var car_type = data.car_type;
			var car_mile = data.car_type + ' Km';
			var car_etc = data.car_etc;
			var car_imgs = data.img_list;
			
			$('#car_name>h2').append(car_name);
			$('#car_price').append(car_price);
			$('#post_user>a').append(post_user);
			$('#post_date').append(post_date);
			
			$('#car_info>table>tbody>tr:nth-child(1)>td:nth-child(2)').append(car_name);
			$('#car_info>table>tbody>tr:nth-child(2)>td:nth-child(2)').append(car_type);
			$('#car_info>table>tbody>tr:nth-child(3)>td:nth-child(2)').append(car_price);
			$('#car_info>table>tbody>tr:nth-child(4)>td:nth-child(2)').append(car_mile);
			$('#car_info>table>tbody>tr:nth-child(5)>td:nth-child(2)').append(car_etc);
			
			$('#delete_btn').attr('onClick', 'deletePost('+post_id+', \''+sessionStorage.getItem('sign_in_user_id')+'\', \''+sessionStorage.getItem('sign_in_user_perm')+'\')');
			
			for(var i=0; i < car_imgs.length; i++){
				if(i == 0){
					$('#main_img>img').attr("src", car_imgs[i]);
					$('#img_list>ul').append('<li><div id="img_'+i+'"><img src="'+car_imgs[i]+'" class="chosen"></div></li>');
					$('#l_btn').on('click',{car_imgs:car_imgs, index : i-1},(e) => changeImg(e.data.car_imgs, e.data.index));
					$('#r_btn').on('click',{car_imgs:car_imgs, index : i+1},(e) => changeImg(e.data.car_imgs, e.data.index));
				}
				else{
					$('#img_list>ul').append('<li><div id="img_'+i+'"><img src="'+car_imgs[i]+'"></div></li>');
				}
				$('#img_'+i).on('click',{car_imgs:car_imgs, index : i},(e) => changeImg(e.data.car_imgs, e.data.index));
			}
		},
        error : function(request,status,error){
			alert('code:'+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); //에러 상태에 대한 세부사항 출력
            alert(error);
		}
	})
}