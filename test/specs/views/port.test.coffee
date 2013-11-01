define (require) ->

  PortView = require "views/port"
  pixi = require "pixi"

  describe "PortView", ->
    sut = null
    coordinates = null

    beforeEach ->
      sut = new PortView
      coordinates = {x: 42, y: 42}

    it 'should draw with red color', ->
      beginFill = env.stub pixi.Graphics::, 'beginFill'
      sut.render coordinates
      beginFill.should.have.been.calledWith 0xFF0000

    it 'should draw with rectangle', ->
      drawRect = env.stub pixi.Graphics::, 'drawRect'
      sut.render coordinates
      drawRect.should.have.been.calledWith coordinates.x, coordinates.y, 20, 20
