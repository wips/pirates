define (require) ->

  ApplicationView = require "views/application"
  WorldView = require "views/world"

  describe "Application View", ->

    it "should initialize world", ->
      worldStub = env.stub WorldView::, 'init'
      sut = new ApplicationView
      worldStub.should.have.been.called

    it "should set rendered world view to DOM", ->

      sut = new ApplicationView
      $stub = env.stub(sut, $).withArgs('[id="main"]')
      sut.render()
      $stub.should.have.been.calledWith()

    it "should initialize renderer", ->
      worldRenderStub = env.stub WorldView::, 'render'
      stageStub = env.stub PIXI, 'autoDetectRenderer'
      sut.init()
      stageStub.should.have.been.calledWith 1060, 600

    it "should have information about renderer", ->
      env.stub(PIXI, 'autoDetectRenderer').returns 'renderer'
      sut.init()
      sut.renderer.should.equal 'renderer'



