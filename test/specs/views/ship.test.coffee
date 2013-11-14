define (require) ->

  ShipView = require "views/ship"
  pixi = require "pixi"

  describe "Ship View", ->
    sut = null
    fromImage = null
    sprite = null
    stage = null

    beforeEach ->
      sprite = {}
      sut = new ShipView
      fromImage = env.stub pixi.Sprite, 'fromImage'
      fromImage.returns sprite
      stage = addChild: env.stub()

    it 'should draw ship image', ->
      sut.render {}, stage
      fromImage.should.have.been.calledWith '/images/ship.png'

    it 'should place ship image in right position', ->
      coordinates = x: 100, y: 200
      sut.render coordinates, stage
      sprite.position.should.deep.equal coordinates

    it 'should show ship on world map', ->
      sut.render {}, stage
      stage.addChild.should.have.been.calledWith sprite
