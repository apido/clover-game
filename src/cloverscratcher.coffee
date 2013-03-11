if $?
  $( document ).ready () ->
    cloverscratcher = new Cloverscratcher
    cloverscratcher.start()

class Cloverscratcher
  constructor: () ->
    @symbols = []
    for i in [0..3]
      @symbols[i] = Math.floor(Math.random() * 4)

  start: () ->
    $('div.cloverleaf#leaf-'+i).html(@symbols[i]) for i in [0..3]

root = exports ? window
root.Cloverscratcher = Cloverscratcher
