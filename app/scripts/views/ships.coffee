define (require) ->

  Ship = require "models/ship"
  ShipView = require "views/ship"

  class ShipsView
    ships: []

    init: (shipsData) ->
      @ships.push @createShip parameters for parameters in shipsData

    render: (@worldView) ->
      # @TODO move getFiledCoordinates to ShipView
      shipView.render @getFieldCoordinates(shipView.model), @worldView.stage for shipView in @ships


    getFieldCoordinates: (ship) ->
      @worldView.getFieldCoordinates ship.position

    createShip: (parameters) ->
      ship = new Ship
      ship.init parameters
      new ShipView ship

  ShipsView
