$ ->
  console.log "foo"

  $('h2').click ->
    $(this).closest('.entry').find('p').toggleClass("active")