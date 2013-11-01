define (require) ->

#  Ground = require "models/ground"
  GroundView = require "views/ground"
  pixi = require "pixi"

  describe "GroundView", ->
    sut = null
    coordinates = null

    beforeEach ->
      sut = new GroundView
      coordinates = {x: 42, y: 42}

    it 'should draw with ground color', ->
      beginFill = env.stub pixi.Graphics::, 'beginFill'
      sut.render coordinates
      beginFill.should.have.been.calledWith 0x00FF00

    it 'should draw with rectangle', ->
      drawRect = env.stub pixi.Graphics::, 'drawRect'
      sut.render coordinates
      drawRect.should.have.been.calledWith coordinates.x, coordinates.y, 20, 20
