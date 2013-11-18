define (require) ->

  WorldView = require "views/world"
  FieldViewFactory = require "views/factories/field"
  World = require "models/world"
  pixi = require "pixi"

  describe "World View", ->
    sut = null
    model = null
    graphicsStub = null
    autoDetectRenderer = null
    stage = null

    beforeEach ->
      stage = addChild: env.stub()
      graphicsStub = env.stub pixi, 'Graphics'
      autoDetectRenderer = env.stub pixi, 'autoDetectRenderer'
      autoDetectRenderer.returns render: ->
      sut = new WorldView
      model = new World

    describe 'Init', ->

      it "should initialize Graphics", ->
        sut.init()
        graphicsStub.should.have.been.calledWithNew

      it "should initialize model", ->
        sut.init model: model
        sut.model.should.equal model

    it "should calculate coordinates on canvas by field coordinates", ->
      coordinates = x:3, y:2
      sut.getFieldCoordinates(coordinates).x.should.equal coordinates.x * WorldView::FIELD_WIDTH
      sut.getFieldCoordinates(coordinates).y.should.equal coordinates.y * WorldView::FIELD_HEIGHT

    describe 'renderField', ->

      it 'should create view for field', ->
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

      it 'should pass coordinates to field view', ->
        coordinates = some: 'obj'
        render = env.stub()
        env.stub(FieldViewFactory::, 'create').returns render: render
        sut.init model: model
        sut.renderField {}, coordinates
        render.should.have.been.calledWith sut.stage, sut.graphics, coordinates

    describe 'render', ->

      beforeEach ->
        sut.init model: model

      it "should render background before strelochki(arrows)", ->
        renderField = env.stub sut, 'renderField'
        addBackground = env.stub sut, 'addBackground'
        sut.render stage
        addBackground.should.have.been.calledBefore renderField

      it "should render background before adding fields to stage", ->
        addBackground = env.stub sut, 'addBackground'
        sut.render stage
        addBackground.should.have.been.calledBefore stage.addChild

      it "should have image as background", ->
        addBackground = env.stub sut, 'addBackground'
        sut.render stage
        addBackground.should.have.been.called

      it 'should pass coordinates to field renderer', ->
        coordinates = some: 'obj'
        env.stub(model, 'getFields').returns [1]
        env.stub(sut, 'getFieldCoordinates').returns coordinates
        renderField = env.stub sut, 'renderField'
        sut.render stage
        renderField.should.have.been.calledWith sinon.match.any, coordinates

      it 'should pass tile data to renderer', ->
        fieldsNumber = 4
        indexToCheck = 3
        fields = [1..fieldsNumber]
        fields[indexToCheck] = 'some val'
        env.stub(model, 'getFields').returns fields
        renderField = env.stub sut, "renderField"
        sut.render stage
        renderField.args[indexToCheck][0].should.equal fields[indexToCheck]

      it 'should render each field', ->
        fieldsNumber = 16
        env.stub(model, 'getFields').returns [1..fieldsNumber]
        renderField = env.stub sut, "renderField"
        sut.init model: model
        sut.render stage
        renderField.callCount.should.equal fieldsNumber

    describe 'add background', ->

      fromImage = null
      Sprite = null
      backgroundSprite = null

      beforeEach ->
        fromImage = env.stub pixi.Texture, 'fromImage'
        Sprite = env.stub pixi, 'Sprite'
        backgroundSprite =
          position:
            x: null
            y: null
        Sprite.returns backgroundSprite
        sut.stage = stage

      it 'should create map texture', ->
        sut.addBackground()
        fromImage.should.have.been.calledWith "/images/map.jpg"

      it 'should create sprite', ->
        sut.addBackground()
        Sprite.should.have.been.calledWithNew

      it 'should place background in top left corner', ->
        sut.addBackground()
        backgroundSprite.position.should.deep.equal x: 0, y: 0

      it 'should add background to stage', ->
        sut.addBackground()
        stage.addChild.should.have.been.calledWith backgroundSprite

      it 'should set background height size same as canvas height', ->
        sut.addBackground()
        backgroundSprite.height.should.equal WorldView::CANVAS_HEIGTH

      it 'should set background width size same as canvas width', ->
        sut.addBackground()
        backgroundSprite.width.should.equal WorldView::CANVAS_WIDTH
