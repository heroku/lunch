$ ->
  $('h2').click ->
    $(this).closest('.entry').find('.description').toggleClass("active")
