define (require) ->

  pixi = require "pixi"

  class GroundView

    render: (coordinates)->
      graphics = new pixi.Graphics()
      graphics.beginFill 0x00FF00
      graphics.drawRect coordinates.x, coordinates.y, 20, 20
      graphics

  GroundView
