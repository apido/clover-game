if $?
  $( document ).ready () ->
    cloverscratcher = new Cloverscratcher
    cloverscratcher.start()
    scratch=(leaf) ->
      $(this).addClass 'scratched'
    $('div.cloverleaf p').click(scratch)

class Cloverscratcher
  constructor: () ->
    @symbols = []
    font_case = ['h','s','y','h']
    for i in [0..3]
      @symbols[i] = font_case[Math.floor(Math.random() * 4)]

  start: () ->
    $('div.cloverleaf#leaf-'+i+' p').html(@symbols[i]) for i in [0..3]

root = exports ? window
root.Cloverscratcher = Cloverscratcher
