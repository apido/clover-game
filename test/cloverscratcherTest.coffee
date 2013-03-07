chai = require 'chai'
expect = chai.expect
chai.should()
{Cloverscratcher} = require '../src/cloverscratcher'

describe 'Cloverscratcher instance', ->
  it 'should have 4 symbols within 0..3', ->
    cloverscratcher = new Cloverscratcher
    cloverscratcher.symbols().length.should.equals 4
    symbol.should.be.within(0,3) for symbol in cloverscratcher.symbols()
  it 'should give random symbols within 0..3', ->
    cloverscratcher = new Cloverscratcher
    otherscratcher = new Cloverscratcher
    otherscratcher.symbols().should.not.equals cloverscratcher.symbols()

