$(document).ready(function(){
  $("img").click(function(){
  var t = $(this).attr("src");
  $(".modal-body-gallery2").html("<img src='"+t+"' class='modal-img-gallery2'>");
  $("#myModal").modal();
});

$("video").click(function(){
  var v = $("video > source");
  var t = v.attr("src");
  $(".modal-body-gallery2").html("<video class='model-vid' controls><source src='"+t+"' type='video/mp4'></source></video>");
  $("#myModal").modal();  
});
});//EOF Document.ready