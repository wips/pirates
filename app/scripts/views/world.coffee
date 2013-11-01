define (require) ->

  pixi = require 'pixi'
  FieldViewFactory = require "views/factories/field"

  class World
    CANVAS_WIDTH: 1060
    CANVAS_HEIGTH: 600
    FIELD_WIDTH: 20
    FIELD_HEIGHT: 20
    init: (params) ->
      @model = params?.model
      @stage = new pixi.Stage 0xEEFFFF
      @renderer = pixi.autoDetectRenderer World::CANVAS_WIDTH, World::CANVAS_HEIGTH

    render: ->
      @renderField field, @getFieldCoordinates @model.getCoordinates i for field, i in @model.getFields()
      @renderer.render @stage
      @renderer.view

    renderField: (model, coordinates) ->
      view = FieldViewFactory::create model
      graphics = view.render coordinates

      @stage.addChild graphics if @stage

    getFieldCoordinates: (coordinates)->
      x: coordinates.x * World::FIELD_WIDTH
      y: coordinates.y * World::FIELD_HEIGHT

