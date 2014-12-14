//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require cocoon
//= require_tree .

$(document).ready(function() {
  $('#create_instruction').on('click', function(){
    $('form').first().submit()
  });

  var bigPreview = $('#instruction_image_file')
  var previewTitle = $('.previewTitle')

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

  $('body').on('cocoon:after-insert', function(){
    $("html, body").animate({ scrollTop: $(document).height() }, "slow");
    $('.step_image_file').last().on('click', function(e){
      $('.step-file-field').last().click()
    });

    var stepBigPreview = $('.step_image_file').last();

    $(".step-file-field").last().change(function(event){
       var input = $(event.currentTarget);
       var file = input[0].files[0];
       var reader = new FileReader();
       reader.onload = function(e){
          image_base64 = e.target.result;
          stepBigPreview.css("background-image", 'url(' +image_base64+ ')');
          $('.previewTitle').last().remove();
       };
       reader.readAsDataURL(file);
    });
  })

  $("#instruction-file-field").change(function(event){
     var input = $(event.currentTarget);
     var file = input[0].files[0];
     var reader = new FileReader();
     reader.onload = function(e){
        image_base64 = e.target.result;
        bigPreview.css("background-image", 'url(' +image_base64+ ')');
        previewTitle.remove();
     };
     reader.readAsDataURL(file);
  });
});


