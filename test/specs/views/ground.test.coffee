define (require) ->

  GroundView = require "views/ground"

  describe "GroundView", ->
    sut = null
    coordinates = null
    graphics = null
    stage = null

    beforeEach ->
      sut = new GroundView
      coordinates = {x: 42, y: 42}
      graphics =
        beginFill: env.stub()
        drawRect: env.stub()

    it 'should draw with red color', ->
      sut.render stage, graphics, coordinates
      graphics.beginFill.should.have.been.calledWith 0xBDB76B

    it 'should draw with rectangle', ->
      sut.render stage, graphics, coordinates
      graphics.drawRect.should.have.been.calledWith coordinates.x, coordinates.y, 20, 20
