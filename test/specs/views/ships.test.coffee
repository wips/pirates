define (require) ->

  ShipsView = require "views/ships"
  ShipView = require "views/ship"

  describe "Ships View", ->
    sut = null
    shipRender = null

    beforeEach ->
      sut = new ShipsView
      sut.worldView = stage: {}
      shipRender = env.stub ShipView::, 'render'
      sut.ships = [
        new ShipView
        new ShipView
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
      shipRender.should.have.been.calledWith sinon.match.any, sut.worldView.stage