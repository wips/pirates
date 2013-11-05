define (require) ->

  class PortView

    render: (stage, graphics, coordinates) ->
      graphics.beginFill 0x708090
      graphics.drawRect coordinates.x, coordinates.y, 20, 20
      graphics.endFill()
