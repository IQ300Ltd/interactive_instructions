$(document).ready ->
  $('[role=step]').click (ev) =>
    $el = $(ev.target)
    step = $el.data('step')
    toTop = false
    if $el.hasClass('revers')
      $nextStep = $("[role=step][data-step=#{step}]")
      $el.removeClass('revers')
    else
      $nextStep = $("[role=step][data-step=#{step-1}]")
      $el.addClass('revers')
      if step == 0
        toTop = true
    if toTop
      value = 80
    else
      value = $nextStep.offset().top - 90
    $("html, body").animate
      scrollTop: value
    , 1000
    $.ajax
      url: $el.data('url')
