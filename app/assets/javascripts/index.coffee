# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->

  mousex = 0
  mousey = 0

  $('body').mousemove (e) ->
    mousex = e.pageX
    mousey = e.pageY - $(window).scrollTop()
    if hoverelm != null
      hoverelm.css('left', mousex + 'px')
      hoverelm.css('top', (mousey + 20) + 'px')
    return

  $('#abouti').click ->
    $('#aboutdiv').removeClass('hiddenDis')
    $('#aboutdiv').addClass('show')
    setTimeout ->
      $('#aboutdiv').removeClass('hidden')
    , 1

  $('#aboutdiv > #close').click ->
    $('#aboutdiv').addClass('hidden')
    setTimeout ->
      $('#aboutdiv').addClass('show')
    , 1
    setTimeout ->
      $('#aboutdiv').addClass('hiddenDis')
    , 750

  hoverelm = null

  $('.hover').hover(() ->
    hoverelm = $('<div class="hovertext">' + $(this).data('hover-text') + '</div>').appendTo('body')
    hoverelm.css('left', mousex + 'px')
    hoverelm.css('top', (mousey + 20) + 'px')
    return
  , () ->
    oldhover = hoverelm
    hoverelm = null
    oldhover.remove()
  )


$(document).ready(ready)
$(document).on('turbolinks:load', ready)