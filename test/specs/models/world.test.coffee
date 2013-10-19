define (require) ->

  World = require "models/world"
  Square = require 'models/square'
  Backbone = require "backbone"

  describe "World", ->

    world = null

    beforeEach ->
      world = new World

    it "should be a Backbone.Model", ->
      world.should.be.instanceOf Backbone.Model

    it "should information about width", ->
      world.width.should.equal 53

    it "should information about height", ->
      world.height.should.equal 30

    it "should contain 30*53 squares", ->
      world.init()
      world.squares.length.should.equal world.height * world.width

    it "should contain Square objects in squares", ->
      world.init()
      world.squares[0].should.be.instanceOf Square

    it "should have info about ports", ->
      world.init()
      