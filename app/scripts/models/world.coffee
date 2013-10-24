define (require) ->

  Backbone = require 'backbone'
  Ocean = require "models/ocean"
  FieldFactory = require "models/factories/field"

  Backbone.Model.extend
    width: 0
    height: 0
    fields: []

    init: (params) ->
      @width = params.width
      @height = params.height
      @fields = new Array @width*@height
      @fields[i] = FieldFactory::create params.fields[i] for i of params.fields

    initField: (type) ->
      field = new Ocean
      field.init direction: type
      field


