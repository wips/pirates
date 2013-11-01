define (require) ->

  OceanView = require "views/ocean"
  pixi = require "pixi"

  describe "OceanView", ->
    sut = null
    coordinates = null

    beforeEach ->
      sut = new OceanView
      coordinates = {x: 42, y: 42}

    it 'should draw with ocean color', ->
      beginFill = env.stub pixi.Graphics::, 'beginFill'
      sut.render coordinates
      beginFill.should.have.been.calledWith 0x0000FF

    it 'should draw with rectangle', ->
      drawRect = env.stub pixi.Graphics::, 'drawRect'
      sut.render coordinates
      drawRect.should.have.been.calledWith coordinates.x, coordinates.y, 20, 20
