/**
 * 
 */

 function clickIdBtn(searchId, searchPw){
	 document.getElementById(searchId).className = 'exposed';	 
	 document.getElementById(searchPw).className = 'hidden';
 }
 
 function clickPwBtn(searchId, searchPw){
	 document.getElementById(searchId).className = 'hidden';	 
	 document.getElementById(searchPw).className = 'exposed';
 }