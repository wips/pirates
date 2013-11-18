define (require) ->

  pixi = require 'pixi'

  class ShipView

    constructor: (@model) ->

    render: (coordinates, stage) ->
      sprite = pixi.Sprite.fromImage '/images/ship.png'
      sprite.position = coordinates
      sprite.width = 20
      sprite.height = 20
      stage.addChild sprite

  ShipView