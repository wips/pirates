define (require) ->

  Backbone = require 'backbone'
  templates = require 'templates'
  PIXI = require 'pixi'

  class ApplicationView extends Backbone.View
    template: templates.application
    render: ->
      console.log PIXI
      @.$el.html @template()
