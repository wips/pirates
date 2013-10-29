define (require) ->

  PIXI = require 'pixi'

  class World
    init: ->
      @stage = new PIXI.Stage 0xEEFFFF
      @renderer = PIXI.autoDetectRenderer 1060, 600

    render: ->
      @renderer.render @stage
      @renderer.view