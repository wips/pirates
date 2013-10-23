define (require) ->

  Ocean = require "models/ocean"

  class FieldFactory
    OCEAN_NO_DRIFT: 1
    NORTH: 2
    SOUTH: 3
    WEST: 4
    EAST: 5
    NORTHWEST: 6
    NORTHEAST: 7
    SOUTHWEST: 8
    SOUTHEAST: 9


    create: ->
      new Ocean

  FieldFactory