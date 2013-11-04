define (require) ->

  class OceanView
    render: (graphics, coordinates) ->
      graphics.beginFill 0x0000FF
      graphics.drawRect coordinates.x, coordinates.y, 20, 20
