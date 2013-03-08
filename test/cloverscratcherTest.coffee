chai = require 'chai'
expect = chai.expect
chai.should()
{Cloverscratcher} = require '../src/cloverscratcher'

cloverscratcher = new Cloverscratcher

describe 'Cloverscratcher instance', ->
  it 'should have 4 symbols within 0..3', ->
    cloverscratcher.symbols.length.should.equals 4
    symbol.should.be.within(0,3) for symbol in cloverscratcher.symbols
  it 'should give random symbols', ->
    otherscratcher = new Cloverscratcher
    otherscratcher.symbols.should.not.equals cloverscratcher.symbols
  it 'should keep fixed symbols once defined', ->
    cloverscratcher.symbols.should.equals cloverscratcher.symbols

describe 'Cloverscratcher start game', ->
  it 'should include symbols inside dom', ->
    cloverscratcher.start()
      
