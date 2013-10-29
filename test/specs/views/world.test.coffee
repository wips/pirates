define (require) ->

  WorldView = require "views/world"
  PIXI = require 'pixi'

  describe "World View", ->
    sut = null

    beforeEach ->
      sut = new WorldView

    it "should initialize stage", ->
      stageStub = env.stub PIXI, 'Stage'
      sut.init()
      stageStub.should.have.been.calledWithNew

    it "should have information about stage", ->
      sut.init()
      sut.stage.should.be.instanceOf PIXI.Stage

    it "should initialize renderer", ->
      stageStub = env.stub PIXI, 'autoDetectRenderer'
      sut.init()
      stageStub.should.have.been.calledWith 1060, 600

    it "should have information about renderer", ->
      env.stub(PIXI, 'autoDetectRenderer').returns 'renderer'
      sut.init()
      sut.renderer.should.equal 'renderer'

    it 'should vperdolivat canvas', ->
      view = 'view'
      sut.init()
      sut.renderer.view = view
      sut.render().should.equal view



