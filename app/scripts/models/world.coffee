define (require) ->

  Backbone = require 'backbone'
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

    getFields: ->
      @fields

    getCoordinates: (position) ->
      x: position % @width, y: position / @width | 0


