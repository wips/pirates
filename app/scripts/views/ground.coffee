define (require) ->
  class GroundView
    render: (stage, graphics, coordinates)->
      graphics.beginFill 0xBDB76B
      graphics.drawRect coordinates.x, coordinates.y, 20, 20
      graphics.endFill()
