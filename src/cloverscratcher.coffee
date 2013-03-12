if $?
  $( document ).ready () ->
    cloverscratcher = new Cloverscratcher
    cloverscratcher.start()
    $('div.cloverleaf p').click(cloverscratcher.scratch)

class Cloverscratcher
  constructor: () ->
    @symbols = []
    font_case = ['h','s','y','h']
    for i in [0..3]
      @symbols[i] = font_case[Math.floor(Math.random() * 4)]

  start: () ->
    $('#calendar').hide()
    $('div.cloverleaf#leaf-'+i+' p').html(@symbols[i]) for i in [0..3]
  scratch:(leaf) ->
    $(this).addClass('scratched').removeClass('covered')
    if $('div.cloverleaf p.covered').length == 0
      Cloverscratcher.prototype.finish()
  finish: () ->
    $('#ticket').hide()
    note = new window.TypingText(document.getElementById('note'))
    $('header').hide()
    $('body').addClass('discovered')
    $('#calendar').show()
    window.TypingText.runAll()

root = exports ? window
root.Cloverscratcher = Cloverscratcher
