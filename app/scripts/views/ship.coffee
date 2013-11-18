define (require) ->

  pixi = require 'pixi'

  class ShipView

    constructor: (@model) ->

    render: (coordinates, stage) ->
      sprite = pixi.Sprite.fromImage '/images/ship.png'
      sprite.position.x = coordinates.x + 10
      sprite.position.y = coordinates.y + 10
      sprite.width = 20
      sprite.height = 20
      sprite.anchor.x = 0.5
      sprite.anchor.y = 0.5
      console.dir sprite
      stage.addChild sprite

  ShipView