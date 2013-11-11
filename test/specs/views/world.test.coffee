define (require) ->

  WorldView = require "views/world"
  FieldViewFactory = require "views/factories/field"
  World = require "models/world"
  pixi = require "pixi"

  describe "World View", ->
    sut = null
    model = null
    stageStub = null
    graphicsStub = null
    autoDetectRenderer = null

    beforeEach ->
      stageStub = env.stub pixi, 'Stage'
      stageStub.returns addChild: env.stub()
      graphicsStub = env.stub pixi, 'Graphics'
      autoDetectRenderer = env.stub pixi, 'autoDetectRenderer'
      autoDetectRenderer.returns render: ->
      sut = new WorldView
      model = new World


    it "should initialize stage", ->
      sut.init()
      stageStub.should.have.been.calledWithNew

    it "should initialize Graphics", ->
      sut.init()
      graphicsStub.should.have.been.calledWithNew

    it "should initialize model", ->
      sut.init model: model
      sut.model.should.equal model

    it "should initialize renderer", ->
      sut.init()
      autoDetectRenderer.should.have.been.calledWith 1060, 600

    it "should have information about renderer", ->
      autoDetectRenderer.returns 'renderer'
      sut.init()
      sut.renderer.should.equal 'renderer'

    it 'should vperdolivat canvas', ->
      view = 'view'
      sut.init model: model
      env.stub sut.renderer, 'render'
      sut.renderer.view = view
      sut.render().should.equal view

    it 'should render pixi renderer canvas', ->
      sut.init model: model
      render = env.stub sut.renderer, 'render'
      sut.render()
      render.should.have.been.calledWith sut.stage

    it 'should render each field', ->
      fieldsNumber = 16
      env.stub(model, 'getFields').returns [1..fieldsNumber]
      renderField = env.stub sut, "renderField"
      sut.init model: model
      sut.render()
      renderField.callCount.should.equal fieldsNumber

    it 'should pass tile data to renderer', ->
      fieldsNumber = 4
      indexToCheck = 3
      fields = [1..fieldsNumber]
      fields[indexToCheck] = 'some val'

      env.stub(model, 'getFields').returns fields
      renderField = env.stub sut, "renderField"
      sut.init model: model
      sut.render()
      
      renderField.args[indexToCheck][0].should.equal fields[indexToCheck]


    it 'should pass model to view factory', ->
      fieldModel = {}
      create = env.stub(FieldViewFactory::, 'create').returns render: env.stub()
      sut.renderField fieldModel
      create.should.have.been.calledWith fieldModel

    it 'should render tile view', ->
      fieldView =
        render: env.stub()
      env.stub(FieldViewFactory::, 'create').returns fieldView
      sut.renderField()
      fieldView.render.should.have.been.called

    it 'should pass coordinates to field renderer', ->
      coordinates = some: 'obj'
      env.stub(model, 'getFields').returns [1]
      env.stub(sut, 'getFieldCoordinates').returns coordinates
      renderField = env.stub sut, 'renderField'
      sut.init model: model
      sut.render()
      renderField.should.have.been.calledWith sinon.match.any, coordinates

    it 'should pass coordinates to field view', ->
      coordinates = some: 'obj'
      render = env.stub()
      env.stub(FieldViewFactory::, 'create').returns render: render
      sut.init model: model
      sut.renderField {}, coordinates
      render.should.have.been.calledWith sut.stage, sut.graphics, coordinates

    it "should calculate coordinates on canvas by field coordinates", ->
      coordinates = x:3, y:2
      sut.getFieldCoordinates(coordinates).x.should.equal coordinates.x * WorldView::FIELD_WIDTH
      sut.getFieldCoordinates(coordinates).y.should.equal coordinates.y * WorldView::FIELD_HEIGHT

