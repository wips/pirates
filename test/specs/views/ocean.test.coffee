define (require) ->

  OceanView = require "views/ocean"

  describe "OceanView", ->
    sut = null
    coordinates = null
    graphics = null

    beforeEach ->
      sut = new OceanView
      coordinates = {x: 42, y: 42}
      graphics =
        beginFill: env.stub()
        drawRect: env.stub()

    it 'should draw with red color', ->
      sut.render graphics, coordinates
      graphics.beginFill.should.have.been.calledWith 0x0000FF

    it 'should draw with rectangle', ->
      sut.render graphics, coordinates
      graphics.drawRect.should.have.been.calledWith coordinates.x, coordinates.y, 20, 20
