/*
	scrollPage function
 */
 function scrollPage(element){
	 var location = document.querySelector(element).offsetTop;
	 window.scrollTo({top:location, behavior:'smooth'});
 }