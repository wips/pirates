define (require) ->

  PortView = require "views/port"

  describe "PortView", ->
    sut = null
    coordinates = null
    graphics = null

    beforeEach ->
      sut = new PortView
      coordinates = {x: 42, y: 42}
      graphics =
        beginFill: env.stub()
        drawRect: env.stub()

    it 'should draw with red color', ->
      sut.render graphics, coordinates
      graphics.beginFill.should.have.been.calledWith 0xFF0000

    it 'should draw with rectangle', ->
      sut.render graphics, coordinates
      graphics.drawRect.should.have.been.calledWith coordinates.x, coordinates.y, 20, 20
