/**
 * 
 */

/*index*/

function checkFrm() {
	document.frm1.submit(); //submit()
}
window.addEventListener("load", function() {
	var loginButton = document.querySelector("#login-button");

	loginButton.onclick = function() {
		open("../index.jsp", "_self");
	}

});

function setVisibility(id, visibility) {
	document.getElementById(id).style.display = visibility;
}

/*login*/

function checkFrm() {
	document.frm1.submit();
}
window.addEventListener("load", function() {
	var cancleButton = document.querySelector("#cancle-button");

	cancleButton.onclick = function() {
		open("index.jsp", "_self");
	}

});
