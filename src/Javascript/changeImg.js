/*
 	changeImg function 
 */
function changeImg(imgs, num){
	var main_img = document.querySelector('#main_img > img');
	var len = imgs.length;

	if(num < len && num >= 0){
		
		main_img.setAttribute('src', imgs[num]);
		
		$('#l_btn').on('click',{car_imgs:imgs, index : num-1},(e) => changeImg(e.data.car_imgs, e.data.index));
		$('#r_btn').on('click',{car_imgs:imgs, index : num+1},(e) => changeImg(e.data.car_imgs, e.data.index));
		
		for(var i=0; i < len; i++){
			var unchosen_img = document.querySelector('#img_' + i + '> img');
			unchosen_img.setAttribute('class', '');
		}
		
		var chosen_img = document.querySelector('#img_' + num + '> img');
		chosen_img.setAttribute('class', 'chosen');
	}
}