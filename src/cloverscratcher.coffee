class Cloverscratcher
  constructor: () ->
    @symbols = []
    for i in [0..3]
      @symbols[i] = Math.floor(Math.random() * 3)

  start:() ->

root = exports ? window
root.Cloverscratcher = Cloverscratcher
