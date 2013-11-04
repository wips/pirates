define (require) ->

  pixi = require "pixi"

  class OceanView
    render: (stage, graphics, coordinates) ->
#      graphics.beginFill 0xAFD6E8
#      graphics.drawRect coordinates.x, coordinates.y, 20, 20
      @drawDirectionArrow stage, coordinates

    drawDirectionArrow: (stage, coordinates) ->
      texture = pixi.Texture.fromImage '/images/arrow.png'
      arrow = new pixi.Sprite texture
      arrow.anchor.x = 0.5
      arrow.anchor.y = 0.5
      arrow.position.x = coordinates.x
      arrow.position.y = coordinates.y
      stage.addChild arrow


  OceanView