define (require) ->

  Backbone = require 'backbone'
  WorldView = require "views/world"
  WorldModel = require "models/world"
  DataSource = require "models/data/world"
  ShipsView = require "views/ships"

  class ApplicationView extends Backbone.View
    el: '#main'

    initialize: ->
      @worldView = new WorldView
      world = new WorldModel
      world.init DataSource
      @worldView.init
        model: world
      @shipsView = new ShipsView
      @shipsView.init DataSource.ships

    render: ->
      @$el.html @worldView.render()
      @shipsView.render @worldView
