define (require) ->

  Ocean = require "models/ocean"
  OceanView = require "views/ocean"

  Port = require "models/port"
  PortView = require "views/port"

  Ground = require "models/ground"
  GroundView = require "views/ground"

  class FieldViewFactory
    create: (model) ->
      return new OceanView if model instanceof Ocean
      return new PortView if model instanceof Port
      return new GroundView if model instanceof Ground
