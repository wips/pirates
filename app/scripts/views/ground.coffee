define (require) ->
  class GroundView
    render: (graphics, coordinates)->
      graphics.beginFill 0x00FF00
      graphics.drawRect coordinates.x, coordinates.y, 20, 20