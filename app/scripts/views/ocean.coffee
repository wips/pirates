define (require) ->

  pixi = require "pixi"

  class OceanView
    render: (stage, graphics, coordinates) ->
      graphics.beginFill 0xAFD6E8
      graphics.drawRect coordinates.x, coordinates.y, 20, 20
#      graphics.endFill()
      stage.addChild graphics
      @drawDirectionArrow stage, coordinates


    drawDirectionArrow: (stage, coordinates) ->
      texture = pixi.Texture.fromImage '/images/arrow.png'
      arrow = new pixi.Sprite texture
      stage.addChild arrow


  OceanView