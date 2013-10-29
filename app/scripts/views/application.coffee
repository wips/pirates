define (require) ->

  Backbone = require 'backbone'
  WorldView = require "views/world"

  class ApplicationView extends Backbone.View
    el: '#main'

    initialize: ->
      @worldView = new WorldView
      @worldView.init()

    render: ->
      @$el.html @worldView.render()