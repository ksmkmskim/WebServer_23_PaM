/*
	scroll event function
 */
 function scroll(){
	 const fullContent = document.querySelector('#post_container');
	 const screenHeight = screen.height;
	 document.addEventListener('scroll',OnScroll,{passive:true})
	 	function OnScroll(){
			 const fullHeight = fullContent.clientHeight;
			 const scrollPosition = pageYOffset;
			 if(fullHeight-screenHeight/2 <= scrollPosition){
				 searchPost(true);
			 }
		 }
 }
 scroll();