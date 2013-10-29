define (require) ->

  Backbone = require 'backbone'
  WorldView = require "views/world"
  WorldModel = require "models/world"

  class ApplicationView extends Backbone.View
    el: '#main'

    initialize: ->
      @worldView = new WorldView
      world = new WorldModel
      @worldView.init
        model: world

    render: ->
      @$el.html @worldView.render()