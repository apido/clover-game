if $?
  $( document ).ready () ->
    cloverscratcher = new Cloverscratcher
    cloverscratcher.start()

class Cloverscratcher
  constructor: () ->
    @symbols = []
    font_case = ['h','s','y','h']
    for i in [0..3]
      @symbols[i] = font_case[Math.floor(Math.random() * 4)]

  start: () ->
    $('div.cloverleaf#leaf-'+i).html(@symbols[i]) for i in [0..3]

root = exports ? window
root.Cloverscratcher = Cloverscratcher
