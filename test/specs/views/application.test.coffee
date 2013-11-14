define (require) ->

  ApplicationView = require "views/application"
  WorldView = require "views/world"
  ShipsView = require "views/ships"
  WorldModel = require "models/world"
  DataSource = require "models/data/world"

  describe "Application View", ->

    it "should initialize world", ->
      worldStub = env.stub WorldView::, 'init'
      new ApplicationView
      worldStub.should.have.been.called

    describe 'after initialization', ->

      sut = null
      init = null

      beforeEach ->
        init =  env.stub WorldView::, 'init'
        sut = new ApplicationView

      it "should set rendered world view to DOM", ->
        rendered = 'some canvas'
        env.stub(sut.worldView, 'render').returns rendered
        env.stub ShipsView::, 'render'
        html = env.stub sut.$el, 'html'
        sut.render()
        html.should.have.been.calledWith rendered

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
          env.stub sut.worldView, 'render'
          shipsView = env.stub ShipsView::, 'render'
          sut.render()
          shipsView.should.have.been.calledWith sut.worldView
