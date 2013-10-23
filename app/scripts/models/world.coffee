define (require) ->

  Backbone = require 'backbone'
  Ocean = require "models/ocean"

  Backbone.Model.extend
    width: 0
    height: 0
    fields: []

    init: (params) ->
      @width = params.width
      @height = params.height
      @fields = new Array @width*@height
      @fields[i] = @initField params.fields[i] for i of params.fields when params.fields[i] in [1..9]

    initField: (type) ->
      field = new Ocean
      field.init direction: type
      field


