if $?
  $( document ).ready () ->
    cloverscratcher = new Cloverscratcher
    cloverscratcher.start()
    cloverscratcher.hedgehog.on 'mouseenter', cloverscratcher.toggleInfo
    cloverscratcher.hedgehog.on 'mouseleave', cloverscratcher.toggleInfo
    cloverscratcher.ticket.on 'mouseenter', '.cloverleaf p', cloverscratcher.toggleInfo
    cloverscratcher.ticket.on 'mouseleave', '.cloverleaf p', cloverscratcher.toggleInfo
    cloverscratcher.ticket.on 'click', '.cloverleaf p', cloverscratcher.scratch
class Cloverscratcher
  constructor: ->
    @ticket = $('div#ticket')
    @hedgehog = $('div#hedgehog')
    @symbols = ['h','h','h','h']
    ## for random symbols uncomment this :
    #    @symbols = []
    #    font_case = ['h','s','y','h']
    #    for i in [0..3]
    #      @symbols[i] = font_case[Math.floor(Math.random() * 4)]
  toggleInfo: =>
    @ticket.find('div.cloverleaf p').toggleClass 'info'
    @hedgehog.toggleClass 'info'
    @hedgehog.find('em').fadeToggle()
    # scale hedgehog with info class
    # add notice 'Cliquez sur les cases pour me faire gratter'
    # unscale after and remove notice
  start: ->
    $('#calendar').hide()
    $('div.cloverleaf#leaf-'+i+' p').append(@symbols[i]) for i in [0..3]
  scratch: ->
    $(this).addClass('scratched').removeClass('covered')
    $('.cloverleaf p.scratched span').fadeOut(2000)
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

    delay 2500, hide_game

root = exports ? window
root.Cloverscratcher = Cloverscratcher
