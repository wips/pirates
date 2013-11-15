define (require) ->

  pixi = require 'pixi'

  class ShipView

    constructor: (@model) ->

    render: (coordinates, stage) ->
      console.log coordinates
      sprite = pixi.Sprite.fromImage '/images/ship.png'
      sprite.position = coordinates
      stage.addChild sprite

  ShipView