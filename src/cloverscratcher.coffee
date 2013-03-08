window.onload = () ->
  alert("welcome")
  cloverscratcher = new Cloverscratcher
  $('div.cloverleaf#leaf-'+i).html(cloverscratcher.symbols[i]) for i in [0..3]

class Cloverscratcher
  constructor: () ->
    @symbols = []
    for i in [0..3]
      @symbols[i] = Math.floor(Math.random() * 4)

  start:() ->

@Cloverscratcher = Cloverscratcher
