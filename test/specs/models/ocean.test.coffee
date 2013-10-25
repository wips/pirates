define (require) ->

  Ocean = require "models/ocean"
  FieldFactory = require "models/factories/field"

  describe "Ocean", ->

    it "should initalize drift direction according fieldType", ->

      sut = new Ocean
      sut.init fieldType: FieldFactory::OCEAN_NO_DRIFT
      sut.driftDirection.should.equal FieldFactory::OCEAN_NO_DRIFT
