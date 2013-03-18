if $?
  $( document ).ready () ->
    cloverscratcher = new Cloverscratcher
    cloverscratcher.start()
    $('div.cloverleaf p').click(cloverscratcher.scratch)

class Cloverscratcher
  constructor: ->
    @symbols = ['h','h','h','h']
    ## for random symbols uncomment this :
    #    @symbols = []
    #    font_case = ['h','s','y','h']
    #    for i in [0..3]
    #      @symbols[i] = font_case[Math.floor(Math.random() * 4)]

  start: ->
    $('#calendar').hide()
    $('div.cloverleaf#leaf-'+i+' p').html(@symbols[i]) for i in [0..3]
  scratch: ->
    $(this).addClass('scratched').removeClass('covered')
    Cloverscratcher.prototype.finish() if $('div.cloverleaf p.covered').length == 0
  finish: ->
    hide_game = ->
      $('#ticket').fadeOut display_cal
    display_cal = ->
      $('#calendar').fadeIn 3000, write_note
      $('body').addClass('discovered')
    write_note = ->
      $('#note').html "Mariage de<br/> Nelly & Pierre"
      new window.TypingText(document.getElementById('note'))
      window.TypingText.runAll()
    delay = (time, fn, args) ->
        setTimeout fn, time, args

    delay 500, hide_game

root = exports ? window
root.Cloverscratcher = Cloverscratcher
