$(document).ready(function(){
 
  $('.viewbtn').on('click',function(){
    if(this.innerText=="View More >>"){
        this.innerText='<< View Less';        
    }
    else if(this.innerText=='<< View Less'){
      this.innerText='View More >>';
    }
  });
function formatDate(date) {
    var d = new Date(date),
        month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear();

    if (month.length < 2) month = '0' + month;
    if (day.length < 2) day = '0' + day;

    return [year, month, day].join('-');
}
$('#date_control').attr('min',formatDate(Date.now()));
$('#date_control2').attr('min',formatDate(Date.now()));
 
});
 
function matchPassword(){
  var pass1=document.getElementById("passsignup");
  var pass2=document.getElementById("passsignup2");
  var icon=document.getElementById("icon-pass-signup");
  if(pass1.value!=pass2.value){
    pass2.style.backgroundColor="#ff8080";
    icon.className="glyphicon glyphicon-remove";
    icon.setAttribute("style","color:#ff8080");
    icon.innerHTML=" Passwords do not match!";

  }
  else{
   pass2.style.backgroundColor="#7FFF00"; 
    icon.className="glyphicon glyphicon-ok";
    icon.setAttribute("style","color:#7FFF00");
    icon.innerHTML=" Passwords matched!";

  }
}
function checkForm(){
	var phone=document.getElementById("mno");
	var pass1=document.getElementById("passsignup");
    var pass2=document.getElementById("passsignup2");
	if(!phone.value.match(/^\d{10}$/)){
		alert("Invalid mobile number");
	}
	if(pass1.value!=pass2.value){
		alert("Passwords not matched");
	}

}





