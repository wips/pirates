define (require) ->

  World = require "models/world"
  Ocean = require "models/ocean"
  Compass = require "models/compass"
  Backbone = require "backbone"

  describe "World", ->

    world = null
    params = {}

    beforeEach ->
      world = new World
      params.width = 3
      params.height = 4

    it "should be a Backbone.Model", ->
      world.should.be.instanceOf Backbone.Model

    it "should information about width", ->
      world.init params
      world.width.should.equal params.width

    it "should information about height", ->
      world.init params
      world.height.should.equal params.height

    it "should contain width*height fields", ->
      world.init params
      world.fields.length.should.equal params.height * params.width

    describe "field types", ->
      beforeEach ->
        params.width = 2
        params.height = 3

      directions = [
        1
        Compass::NORTH
        Compass::NORTHEAST
        Compass::EAST
        Compass::NORTHWEST
        Compass::WEST
        Compass::SOUTHWEST
        Compass::SOUTH
        Compass::SOUTHEAST
      ]

      using "Ocean  field", directions, (direction) ->
        it "should initialize ocean fields for every drift direction", ->
          params.fields = [1, direction]
          world.init params
          world.fields[1].should.be.instanceOf Ocean

      it "should initialize ocean fields", ->
        params.fields = [0, 1]
        world.init params
        world.fields[1].should.be.instanceOf Ocean

      it 'should initialize wind direction', ->
        direction = Compass::NORTH
        params.fields = [0, direction]
        init = env.stub Ocean::, 'init'
        world.init params
        init.should.have.been.calledWith direction: direction


