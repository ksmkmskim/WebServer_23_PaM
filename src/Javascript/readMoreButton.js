/*
	Read More Button Function
*/
function readMore(target_id){
	targets = document.querySelectorAll(target_id);
	for(var i=0; i < targets.length; i++){
		targets[i].classList.toggle('show_more');
	}
}