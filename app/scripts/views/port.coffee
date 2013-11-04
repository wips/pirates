define (require) ->

  class PortView
    render: (graphics, coordinates) ->
      graphics.beginFill 0xFF0000
      graphics.drawRect coordinates.x, coordinates.y, 20, 20
