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
      @graphics = new pixi.Graphics()
      @renderer = pixi.autoDetectRenderer World::CANVAS_WIDTH, World::CANVAS_HEIGTH

    render: (stage) ->
      @stage = stage
      @addBackground stage
      @stage.addChild @graphics
      @renderField field, @getFieldCoordinates @model.getCoordinates i for field, i in @model.getFields()



    renderField: (model, coordinates) ->
      view = FieldViewFactory::create model
      view.render @stage, @graphics, coordinates

    getFieldCoordinates: (coordinates)->
      x: coordinates.x * World::FIELD_WIDTH
      y: coordinates.y * World::FIELD_HEIGHT

    addBackground: (stage) ->
      background = new pixi.Sprite.fromImage '/images/map.jpg'
      background.position.x = 0
      background.position.y = 0
      background.width = World::CANVAS_WIDTH
      background.height = World::CANVAS_HEIGTH

      stage.addChild background


