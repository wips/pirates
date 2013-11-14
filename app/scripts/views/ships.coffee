define (require) ->

  class ShipsView

    initialize: ->
      @worldView = stage: 'zzz'

    render: ->
      ship.render @getFieldCoordinates(), @worldView.stage for ship in @ships

    getFieldCoordinates: ->
      1

  ShipsView
