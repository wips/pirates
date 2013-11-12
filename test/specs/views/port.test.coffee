define (require) ->

  PortView = require "views/port"

  describe "PortView", ->
    sut = null
    coordinates = null
    graphics = null
    stage = null

    beforeEach ->
      sut = new PortView
      coordinates = {x: 42, y: 42}
      graphics =
        beginFill: env.stub()
        drawRect: env.stub()
        endFill: env.stub()
        lineStyle: env.stub()

    it 'should draw with #ff0000 color lines', ->
      sut.render stage, graphics, coordinates
      graphics.lineStyle.should.have.been.calledWith 1, 0xff0000

    it 'should draw transperent rectangle', ->
      sut.render stage, graphics, coordinates
      graphics.beginFill.should.have.been.calledWith 0xFFFFFF, 0.3

    it 'should draw with rectangle', ->
      sut.render stage, graphics, coordinates
      graphics.drawRect.should.have.been.calledWith coordinates.x, coordinates.y, 20, 20

    it 'should endFill after drawing', ->
      sut.render stage, graphics, coordinates
      graphics.endFill.should.have.been.calledAfter graphics.drawRect
