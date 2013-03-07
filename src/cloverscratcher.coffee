class Cloverscratcher
  constructor: () ->
    @symbols= ()->
      symbols = []
      for i in [0..3]
        symbols[i] = Math.floor(Math.random() * 3)
      symbols

root = exports ? window
root.Cloverscratcher = Cloverscratcher
