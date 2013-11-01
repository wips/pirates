define (require) ->

  pixi = require "pixi"

  class OceanView
    render: (coordinates) ->
      graphics = new pixi.Graphics()
      graphics.beginFill 0x0000FF
      graphics.drawRect coordinates.x, coordinates.y, 20, 20
      graphics