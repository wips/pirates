define (require) ->

  Ship = require "models/ship"

  describe "Ship", ->
    it "should initalize position", ->
      params =
        position: {}
      sut = new Ship
      sut.init params
      sut.position.should.equal params.position
