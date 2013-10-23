define (require) ->

  FieldFactory = require "models/factories/field"
  Ocean = require "models/ocean"

  describe "Field factory", ->

    it "should create ocean without drift", ->
      FieldFactory::create(FieldFactory::OCEAN_NO_DRIFT).should.be.instanceOf Ocean



