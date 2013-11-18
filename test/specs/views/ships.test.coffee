define (require) ->

  ShipsView = require "views/ships"
  ShipView = require "views/ship"
  Ship = require "models/ship"
  pixi = require "pixi"

  describe "Ships View", ->
    sut = null
    shipRender = null
    worldView = null
    stage = null

    beforeEach ->
      stage = addChild: env.stub()
      env.stub(pixi, 'Stage').returns stage

      sut = new ShipsView []
      worldView =
        stage: {}
        getFieldCoordinates: env.stub()

      shipRender = env.stub ShipView::, 'render'
      sut.ships = [
        new ShipView new Ship
        new ShipView new Ship
      ]

    describe 'Rendering', ->

      beforeEach ->
        sut.worldView = worldView

      it 'should render each ship', ->
        sut.render()
        shipRender.callCount.should.equal sut.ships.length

      it 'should return stage', ->
        sut.render().should.equal stage



      it 'should pass coordinates to ship', ->
        coordinates = x:100, y: 200
        env.stub(sut, 'getFieldCoordinates').returns coordinates
        sut.render()
        shipRender.should.have.been.calledWith coordinates

      it 'should be on stage', ->
        sut.render()
        shipRender.should.have.been.calledWith sinon.match.any, stage

      it 'should calculate coordinates accouding worldmap size', ->
        ship = position: {}
        sut.getFieldCoordinates ship
        sut.worldView.getFieldCoordinates.should.have.been.calledWith ship.position


    it 'should create ships during initialization', ->
      shipParameters = any: 'params'
      createShip = env.stub sut, 'createShip'
      sut.init [shipParameters], worldView
      createShip.should.have.been.calledWith shipParameters

    it 'should have worldView after initialization', ->
      sut.init [], worldView
      sut.worldView.should.equal worldView

    it 'should initialize ship parameters during ship creation', ->
      shipParameters = any: 'params'
      init = env.stub Ship::, 'init'
      sut.createShip shipParameters
      init.should.have.been.calledWith shipParameters

    it 'should collect ships views in ships field', ->
      shipView = {}
      env.stub(sut, 'createShip').returns shipView
      push = env.stub sut.ships, 'push'
      sut.init [{}], worldView
      push.should.have.been.calledWith shipView

    it 'should create ship model', ->
      sut.createShip({}).model.should.be.instanceOf Ship
