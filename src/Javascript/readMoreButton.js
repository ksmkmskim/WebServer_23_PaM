/*
	Read More Button Function
*/
function readMore(target_id){
	console.log(target_id);
	target = document.querySelector(target_id);
	console.log(target);
	target.classList.toggle('show_more');
}