/*
	chkPerm function
 */
function chkPerm(){
	var userPerm = sessionStorage.getItem('sign_in_user_perm');
	if(userPerm == null){
		var login = '/PaM/login';
		location.href = login;
	}
	else if(userPerm < 2){
		alert('권한이 부족합니다.');
	}
	else{
		var addPost = '/PaM/add';
		location.href = addPost;
	}
}