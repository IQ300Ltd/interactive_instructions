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

  $('#instruction_image_file').on('click', function(e){
    $('#instruction-file-field').click()
  });

  var preview = $(".upload-preview img");
    
  $("#instruction-file-field").change(function(event){
     var input = $(event.currentTarget);
     var file = input[0].files[0];
     var reader = new FileReader();
     reader.onload = function(e){
         image_base64 = e.target.result;
         preview.attr("src", image_base64);
     };
     reader.readAsDataURL(file);
  });
});

