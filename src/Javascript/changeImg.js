/*
 	changeImg function 
 */
function changeImg(imgs, num){
	var main_img = document.querySelector('#main_img > img');
	var img_list = imgs.replace('[','').replace(']','').split(', ');
	var len = img_list.length;
	len = imgs.length;
	
	if(num < len || num >= 0){
		chosen_img = document.querySelector('#img_' + num + '> img');
		console.log(document.querySelector('#img_' + num));
		console.log(chosen_img);
		main_img.setAttribute('src', img_list[num]);
		for(var i=0; i < len; i++){
			var unchosen_img = document.querySelector('#img_' + i + '> img');
			unchosen_img.setAttribute('class', '');
		}
		chosen_img.setAttribute('class', 'chosen');
	}
}