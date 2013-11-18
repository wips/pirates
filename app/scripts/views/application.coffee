define (require) ->

  Backbone = require 'backbone'
  WorldView = require "views/world"
  WorldModel = require "models/world"
  DataSource = require "models/data/world"
  ShipsView = require "views/ships"
  pixi = require "pixi"

  class ApplicationView extends Backbone.View
    el: '#main'

    initialize: ->
      @worldView = new WorldView
      world = new WorldModel
      world.init DataSource
      @worldView.init
        model: world
      @shipsView = new ShipsView
      @shipsView.init DataSource.ships, @worldView
      @renderer = pixi.autoDetectRenderer 1060, 600
      @stage = new pixi.Stage

    render: ->
      @worldView.render @stage
      @shipsView.render @stage
      @renderer.render @stage
      @$el.html @renderer.view

  ApplicationView