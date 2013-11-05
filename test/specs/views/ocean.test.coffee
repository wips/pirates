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
      coordinates = {x: 42, y: 24}
      stage = addChild: env.stub()
      graphics =
        beginFill: env.stub()
        drawRect: env.stub()
        endFill: env.stub()

    it 'should draw with #AFD6E8 color', ->
      sut.render stage, graphics, coordinates
      graphics.beginFill.should.have.been.calledWith 0xAFD6E8

    it 'should draw with rectangle', ->
      sut.render stage, graphics, coordinates
      graphics.drawRect.should.have.been.calledWith coordinates.x, coordinates.y, 20, 20

    it 'should endFill after drawing', ->
      sut.render stage, graphics, coordinates
      graphics.endFill.should.have.been.calledAfter graphics.drawRect

    it 'should draw drift direction arrow', ->
      drawDirectionArrow = env.stub sut, 'drawDirectionArrow'
      sut.render stage, graphics, coordinates
      drawDirectionArrow.should.have.been.calledWith stage

    describe 'drawDirectionArrow', ->
      fromImage = null
      Sprite = null
      arrowSprite = null

      beforeEach ->
        fromImage = env.stub pixi.Texture, 'fromImage'
        Sprite = env.stub pixi, 'Sprite'
        arrowSprite =
          position:
            x: null
            y: null
          anchor:
            x: null
            y: null
        Sprite.returns arrowSprite


      it 'should create texture from arrow image', ->
        sut.drawDirectionArrow stage, coordinates
        fromImage.should.have.been.calledWith "/images/arrow.png"

      it 'should create sprite', ->
        sut.drawDirectionArrow stage, coordinates
        Sprite.should.have.been.calledWithNew

      it 'should create sprite with texture', ->
        fromImage.returns "texture"
        sut.drawDirectionArrow stage, coordinates
        Sprite.should.have.been.calledWith "texture"

      it 'should add sprite to stage', ->
        fromImage.returns "texture"
        sut.drawDirectionArrow stage, coordinates
        stage.addChild.should.have.been.called

      it 'should set anchor to arrow', ->
        sut.drawDirectionArrow stage, coordinates
        arrowSprite.anchor.should.deep.equal x: 0.5, y: 0.5

      it 'should set positions to arrow', ->
        sut.drawDirectionArrow stage, coordinates
        arrowSprite.position.should.deep.equal x: coordinates.x, y: coordinates.y





