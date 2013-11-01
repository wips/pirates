define (require) ->

  pixi = require "pixi"

  class PortView
    render: (coordinates) ->
      graphics = new pixi.Graphics()
      graphics.beginFill 0xFF0000
      graphics.drawRect coordinates.x, coordinates.y, 20, 20
      graphics