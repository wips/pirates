define (require) ->

  Backbone = require 'backbone'
  Square = require 'models/square'

  Backbone.Model.extend
    width: 53
    height: 30
    squares: []

    init: ->
      @squares.push new Square for i in [1..@width*@height]
      console.dir @squares
