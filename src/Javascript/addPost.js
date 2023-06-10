/*
	addPost function
 */

 function addPost(){
	var url= "http://localhost:8080/PaM/add";
	let car_name = document.getElementsByName("car_name");
	let car_type;
	let car_brand;
	let car_price = document.getElementsByName("car_price");
	let car_mile = document.getElementsByName("car_mile");
	let car_etc = document.getElementsByName("car_etc");
	let form_data = new FormData();
	
	let car_type_input = document.getElementsByName("car_type");
	for(var i=0; i<car_type_input.length; i++){
		if(car_type_input[i].checked){
			car_type = car_type_input[i].value;
		}
	}
	
	let car_brand_input = document.getElementsByName("car_brand");
	for(var i=0; i<car_brand_input.length; i++){
		if(car_brand_input[i].checked){
			car_brand = car_brand_input[i].value;
		}
	}
	
	let car_img_input = document.getElementsByName("car_img");
	let car_img = car_img_input[0].files;
	
	form_data.append("car_name", $(car_name).val());
	form_data.append("car_type", car_type);
	form_data.append("car_brand", car_brand);
	form_data.append("car_price", $(car_price).val());
	form_data.append("car_mile", $(car_mile).val());
	form_data.append("car_etc", $(car_etc).val());

	
	for(let i=0; i<car_img.length; i++){
		form_data.append("car_img" + i, car_img[i]);
	}
	
	$.ajax({
        type:"POST",
        url:url,
        processData : false,
        contentType : false,
        data : form_data,
        success : function(data){
			console.log(data);
		},
		error : function(request,status,error){
			alert('code:'+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); //에러 상태에 대한 세부사항 출력
            alert(error);
		}
	});
 }