$(document).ready(function() {
  
  var container = $('#content ol');
  
  container.imagesLoaded(function(){
    container.masonry({
      itemSelector: '.box'
    });
  });
  
  $('.categorie').hover(function(){
    $('#categorie').slideDown('fast');
  },function(){
    $('#categorie').slideUp('fast');
  });
});