define (require) ->

  FieldFactory = require "models/factories/field"

  pixi = require "pixi"

  class OceanView

    render: (stage, graphics, coordinates) ->
      graphics.beginFill 0xAFD6E8, 0
      graphics.lineStyle 1, 0xAFD6E8
      graphics.drawRect coordinates.x, coordinates.y, 20, 20
      graphics.endFill()
      @drawDirectionArrow stage, coordinates if @model.driftDirection isnt FieldFactory::OCEAN_NO_DRIFT

    drawDirectionArrow: (stage, coordinates) ->
      texture = pixi.Texture.fromImage '/images/arrow.png'
      arrow = new pixi.Sprite texture
      arrow.anchor.x = 0.5
      arrow.anchor.y = 0.5
      arrow.position.x = coordinates.x + 10
      arrow.position.y = coordinates.y + 10

      arrow.rotation = Math.PI * 3/2  if @model.driftDirection is FieldFactory::OCEAN_NORTH_DRIFT
      arrow.rotation = Math.PI / 2  if @model.driftDirection is FieldFactory::OCEAN_SOUTH_DRIFT
      arrow.rotation = Math.PI if @model.driftDirection is FieldFactory::OCEAN_WEST_DRIFT
      arrow.rotation = 0 if @model.driftDirection is FieldFactory::OCEAN_EAST_DRIFT
      arrow.rotation = Math.PI / 4 if @model.driftDirection is FieldFactory::OCEAN_SOUTHEAST_DRIFT
      arrow.rotation = Math.PI * 3 / 4 if @model.driftDirection is FieldFactory::OCEAN_SOUTHWEST_DRIFT
      arrow.rotation = Math.PI * 7 / 4 if @model.driftDirection is FieldFactory::OCEAN_NORTHWEST_DRIFT
      arrow.rotation = Math.PI * 9 / 4 if @model.driftDirection is FieldFactory::OCEAN_NORTHEAST_DRIFT

      stage.addChild arrow


  OceanView