define (require) ->

  Ocean = require "models/ocean"
  OceanView = require "views/ocean"

  Port = require "models/port"
  PortView = require "views/port"

  Ground = require "models/ground"
  GroundView = require "views/ground"

  class FieldViewFactory
    create: (model) ->
      view = new OceanView if model instanceof Ocean
      view = new PortView if model instanceof Port
      view = new GroundView if model instanceof Ground
      view.model = model
      view
