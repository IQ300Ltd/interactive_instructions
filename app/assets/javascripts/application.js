//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require cocoon
//= require_tree .

$(document).ready(function() {
  $(window).scroll(function(){
    var st = $(window).scrollTop()
    elementTop = $("#container-base").offset().top - st - 75

    if(elementTop <= 0){
      $(".navigation-container #navigation-pane").addClass('navigation-fixed');
    }else{
      $(".navigation-container #navigation-pane").removeClass('navigation-fixed');
    }
  })
});

