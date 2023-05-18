/*
 	changeImg function 
 */
function changeImg(imgs, num){
	var main_img = document.querySelector('#main_img > img');
	var img_list = imgs.replace('[','').replace(']','').split(', ');
	var len = img_list.length;

	if(num < len && num >= 0){
		var chosen_img = document.querySelector('#img_' + num + '> img');
		main_img.setAttribute('src', img_list[num]);
		img_num = num;
		
		for(var i=0; i < len; i++){
			var unchosen_img = document.querySelector('#img_' + i + '> img');
			unchosen_img.setAttribute('class', '');
		}
		
		chosen_img.setAttribute('class', 'chosen');
	}
}