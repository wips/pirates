define (require) ->

  ApplicationView = require "views/application"
  WorldView = require "views/world"
  ShipsView = require "views/ships"
  WorldModel = require "models/world"
  DataSource = require "models/data/world"
  pixi = require "pixi"

  describe "Application View", ->

    it "should initialize world", ->
      env.stub ShipsView::, 'init'
      worldStub = env.stub WorldView::, 'init'
      new ApplicationView
      worldStub.should.have.been.called

    describe 'after initialization', ->

      sut = null
      init = null
      autoDetectRenderer = null
      rendered = null

      beforeEach ->
        rendered =
          view: {}
          render: env.stub()
        init =  env.stub WorldView::, 'init'
        autoDetectRenderer = env.stub pixi, 'autoDetectRenderer'
        autoDetectRenderer.returns rendered
        sut = new ApplicationView

      it 'should create stage', ->
        stage = {}
        env.stub(pixi, 'Stage').returns stage
        sut = new ApplicationView
        sut.stage.should.equal stage

      it "should initialize renderer", ->
        autoDetectRenderer.should.have.been.calledWith 1060, 600

      it "should have information about renderer", ->
        autoDetectRenderer.returns 'renderer'
        sut = new ApplicationView
        sut.renderer.should.equal 'renderer'

      it "should set rendered world view to DOM", ->
        env.stub sut.shipsView, 'render'
        env.stub sut.worldView, 'render'
        html = env.stub sut.$el, 'html'
        sut.render()
        html.should.have.been.calledWith sut.renderer.view

      it "should have DOM element", ->
        ApplicationView::el.should.equal '#main'

      it 'should pass world model to world view', ->
        sut = new ApplicationView
        init.firstCall.args[0].model.should.be.instanceOf WorldModel

      it 'should initialize world model', ->
        initModel = env.stub WorldModel::, 'init'
        sut = new ApplicationView
        initModel.should.have.been.calledWith DataSource

      describe 'Ships', ->

        it 'should show ships on map', ->
          render = env.stub sut.shipsView, 'render'
          env.stub sut.worldView, 'render'
          sut.stage = {}
          sut.render()
          render.should.have.been.calledWith sut.stage

        it 'should pass ships data to ships', ->
          init = env.stub ShipsView::, 'init'
          sut = new ApplicationView
          init.should.have.been.calledWith DataSource.ships, sut.worldView

      it 'should render world stage', ->
        render = env.stub sut.worldView, 'render'
        env.stub sut.shipsView, 'render'
        sut.stage = {}
        sut.render()
        render.should.have.been.calledWith sut.stage