$(function(){
var overlay = $('<div id="overlay"></div>');
overlay.show();
overlay.appendTo(document.body);
$('.search-pop-up').show();
$('.tclose').click(function(){
$('.search-pop-up').hide();
overlay.appendTo(document.body).remove();
return false;
});