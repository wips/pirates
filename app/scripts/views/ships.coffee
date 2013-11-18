define (require) ->

  Ship = require "models/ship"
  ShipView = require "views/ship"

  class ShipsView
    ships: []

    init: (shipsData, worldView) ->
      @worldView = worldView
      @ships.push @createShip parameters for parameters in shipsData

    render: () ->
      # @TODO move getFiledCoordinates to ShipView
      shipView.render @getFieldCoordinates(shipView.model), @worldView.stage for shipView in @ships

    getFieldCoordinates: (ship) ->
      @worldView.getFieldCoordinates ship.position

    createShip: (parameters) ->
      ship = new Ship
      ship.init parameters
      new ShipView ship

  ShipsView
