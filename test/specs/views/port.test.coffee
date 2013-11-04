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

    it 'should draw with #708090 color', ->
      sut.render stage, graphics, coordinates
      graphics.beginFill.should.have.been.calledWith 0x708090

    it 'should draw with rectangle', ->
      sut.render stage, graphics, coordinates
      graphics.drawRect.should.have.been.calledWith coordinates.x, coordinates.y, 20, 20
