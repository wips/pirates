define (require) ->

  FieldFactory = require "models/factories/field"
  Ocean = require "models/ocean"
  Port = require "models/port"
  Ground = require "models/ground"

  describe "Field factory", ->
    using 'drift direction', [
      FieldFactory::OCEAN_NO_DRIFT
      FieldFactory::OCEAN_NORTH_DRIFT
      FieldFactory::OCEAN_NORTHEAST_DRIFT
      FieldFactory::OCEAN_NORTHWEST_DRIFT
      FieldFactory::OCEAN_SOUTH_DRIFT
      FieldFactory::OCEAN_SOUTHEAST_DRIFT
      FieldFactory::OCEAN_SOUTHWEST_DRIFT
      FieldFactory::OCEAN_WEST_DRIFT
      FieldFactory::OCEAN_EAST_DRIFT
    ], (direction) ->
      it "should create ocean", ->
        FieldFactory::create(direction).should.be.instanceOf Ocean

    using 'port type', [
      FieldFactory::PORT_PIRATES
      FieldFactory::PORT_SPANISH
      FieldFactory::PORT_ENGLISH
      FieldFactory::PORT_PORTUGUESE
      FieldFactory::PORT_DUTCH
      FieldFactory::PORT_FRENCH
    ], (portType) ->
      it "should create port", ->
        FieldFactory::create(portType).should.be.instanceOf Port

    it "should create initialize field", ->
      setInitStub = env.stub Ocean::, 'init'
      FieldFactory::create FieldFactory::OCEAN_NO_DRIFT
      setInitStub.should.have.been.calledWith fieldType: FieldFactory::OCEAN_NO_DRIFT

    it "should create ground", ->
      FieldFactory::create(FieldFactory::GROUND).should.be.instanceOf Ground





