define (require) ->

  Ship = require "models/ship"
  ShipView = require "views/ship"
  pixi = require "pixi"

  class ShipsView
    ships: []

    init: (shipsData, worldView) ->
      @worldView = worldView
      @ships.push @createShip parameters for parameters in shipsData

    render: () ->
      stage = new pixi.Stage
      stage.worldAlpha = 0
      shipView.render @getFieldCoordinates(shipView.model), stage for shipView in @ships

      stage

    getFieldCoordinates: (ship) ->
      @worldView.getFieldCoordinates ship.position

    createShip: (parameters) ->
      ship = new Ship
      ship.init parameters
      new ShipView ship

  ShipsView
