define (require) ->

  class PortView

    render: (stage, graphics, coordinates) ->
      graphics.beginFill 0xFFFFFF, 0
      graphics.lineStyle 1, 0xff0000
      graphics.drawRect coordinates.x, coordinates.y, 20, 20
      graphics.endFill()
