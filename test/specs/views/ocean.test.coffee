define (require) ->

  OceanView = require "views/ocean"
  pixi = require "pixi"

  describe "OceanView", ->
    sut = null
    coordinates = null
    graphics = null
    stage = null

    beforeEach ->
      sut = new OceanView
      coordinates = {x: 42, y: 42}
      stage = addChild: env.stub()
      graphics =
        beginFill: env.stub()
        drawRect: env.stub()

    it 'should draw with red color', ->
      sut.render stage, graphics, coordinates
      graphics.beginFill.should.have.been.calledWith 0xAFD6E8

    it 'should draw with rectangle', ->
      sut.render stage, graphics, coordinates
      graphics.drawRect.should.have.been.calledWith coordinates.x, coordinates.y, 20, 20

    it 'should draw drift direction arrow', ->
      drawDirectionArrow = env.stub sut, 'drawDirectionArrow'
      sut.render stage, graphics, coordinates
      drawDirectionArrow.should.have.been.calledWith stage

    describe 'drawDirectionArrow', ->
      fromImage = null
      Sprite = null

      beforeEach ->
        fromImage = env.stub pixi.Texture, 'fromImage'
        Sprite = env.stub pixi, 'Sprite'


      it 'should create texture from arrow image', ->
        sut.drawDirectionArrow stage
        fromImage.should.have.been.calledWith "/images/arrow.png"

      it 'should create sprite', ->
        sut.drawDirectionArrow stage
        Sprite.should.have.been.calledWithNew

      it 'should create sprite with texture', ->
        fromImage.returns "texture"
        sut.drawDirectionArrow stage
        Sprite.should.have.been.calledWith "texture"

      it 'should add sprite to stage', ->
        fromImage.returns "texture"
        sut.drawDirectionArrow stage
        stage.addChild.should.have.been.called





