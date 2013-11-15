define (require) ->

  ShipsView = require "views/ships"
  ShipView = require "views/ship"
  Ship = require "models/ship"

  describe "Ships View", ->
    sut = null
    shipRender = null

    beforeEach ->
      sut = new ShipsView []
      sut.worldView =
        stage: {}
        getFieldCoordinates: env.stub()

      shipRender = env.stub ShipView::, 'render'
      sut.ships = [
        new ShipView new Ship
        new ShipView new Ship
      ]

    it 'should render each ship', ->
      sut.render()
      shipRender.callCount.should.equal sut.ships.length

    it 'should pass coordinates to ship', ->
      coordinates = x:100, y: 200
      env.stub(sut, 'getFieldCoordinates').returns coordinates
      sut.render()
      shipRender.should.have.been.calledWith coordinates

    it 'should be on world map', ->
      sut.render()
      shipRender.should.have.been.calledWith sinon.match.any, sut.worldView.stage

    it 'should calculate coordinates accouding worldmap size', ->
      ship = position: {}
      sut.getFieldCoordinates ship
      sut.worldView.getFieldCoordinates.should.have.been.calledWith ship.position

    it 'should create ship model', ->
      sut.createShip({}).model.should.be.instanceOf Ship

    it 'should create ships during self creation', ->
      shipParameters = any: 'params'
      createShip = env.stub ShipsView::, 'createShip'
      new ShipsView [shipParameters]
      createShip.should.have.been.calledWith shipParameters

    it 'should initialize ship parameters during ship creation', ->
      shipParameters = any: 'params'
      init = env.stub Ship::, 'init'
      sut.createShip shipParameters
      init.should.have.been.calledWith shipParameters

    it 'should collect ships views in ships field', ->
      shipView = {}
      env.stub(ShipsView::, 'createShip').returns shipView
      push = env.stub ShipsView::ships, 'push'
      new ShipsView [zz:'zz']
      push.should.have.been.calledWith shipView

