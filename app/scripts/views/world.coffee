define (require) ->

  pixi = require 'pixi'
  FieldViewFactory = require "views/factories/field"

  class World
    init: (params) ->
      @model = params?.model
      @stage = new pixi.Stage 0xEEFFFF
      @renderer = pixi.autoDetectRenderer 1060, 600

    render: ->
      @renderField field, @getFieldCoordinates() for field in @model.getFields()
      @renderer.render @stage
      @renderer.view

    renderField: (model, coordinates) ->
      view = FieldViewFactory::create model
      graphics = view.render coordinates

      @stage.addChild graphics if @stage

    getFieldCoordinates: ->
      x: 42
      y: 42

