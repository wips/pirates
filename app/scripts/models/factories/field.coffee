define (require) ->

  Ocean = require "models/ocean"
  Port = require "models/port"
  Ground = require "models/ground"

  class FieldFactory
    OCEAN_NO_DRIFT: 1
    OCEAN_NORTH_DRIFT: 2
    OCEAN_SOUTH_DRIFT: 3
    OCEAN_WEST_DRIFT: 4
    OCEAN_EAST_DRIFT: 5
    OCEAN_NORTHWEST_DRIFT: 6
    OCEAN_NORTHEAST_DRIFT: 7
    OCEAN_SOUTHWEST_DRIFT: 8
    OCEAN_SOUTHEAST_DRIFT: 9

    PORT_PIRATES: 10
    PORT_SPANISH: 11
    PORT_ENGLISH: 12
    PORT_PORTUGUESE: 13
    PORT_DUTCH: 14
    PORT_FRENCH: 15

    GROUND: 16

    create: (fieldType) ->
      if fieldType in @getOceanTypes()
        field = new Ocean
      else if fieldType in @getPortTypes()
        field = new Port
      else if fieldType is @GROUND
        field = new Ground
      field.init fieldType: fieldType
      field
    
    getPortTypes: ->
      [
        @PORT_PIRATES
        @PORT_SPANISH
        @PORT_ENGLISH
        @PORT_PORTUGUESE
        @PORT_DUTCH
        @PORT_FRENCH
      ]

    getOceanTypes: ->
      [
        @OCEAN_NO_DRIFT
        @OCEAN_NORTH_DRIFT
        @OCEAN_SOUTH_DRIFT
        @OCEAN_WEST_DRIFT
        @OCEAN_EAST_DRIFT
        @OCEAN_NORTHWEST_DRIFT
        @OCEAN_NORTHEAST_DRIFT
        @OCEAN_SOUTHWEST_DRIFT
        @OCEAN_SOUTHEAST_DRIFT
      ]


  FieldFactory