define (require) ->

  PIXI = require 'pixi'

  class World
    init: ->
      @stage = new PIXI.Stage 0x66FF99
      @renderer = PIXI.autoDetectRenderer 1060, 600

    render: ->
      @renderer.view