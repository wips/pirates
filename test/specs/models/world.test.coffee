define (require) ->

  World = require "models/world"
  Backbone = require "backbone"
  FieldFactory = require "models/factories/field"

  describe "World", ->

    world = null
    params = {}

    beforeEach ->
      world = new World
      params.fields = [1..16]
      params.width = 2
      params.height = params.fields.length / params.width

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

    it "should get coordinates by position in field array", ->
      params.width = 5
      params.height = 3
      position = 3
      world.init params
      coordinates = world.getCoordinates position
      coordinates.x.should.equal position % params.width
      coordinates.y.should.equal position / params.width | 0

    describe "field types", ->
      it 'should create fields', ->
        create = env.stub FieldFactory::, 'create'
        world.init params
        create.callCount.should.equal params.fields.length
      using 'fields', [1..16], (type) ->
        it 'should pass field type to factory', ->
          create = env.stub FieldFactory::, 'create'
          world.init params
          create.should.have.been.calledWith type


