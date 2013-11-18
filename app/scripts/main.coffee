require.config
  paths:
    jquery: '../components/jquery/jquery'
    underscore: '../components/underscore/underscore'
    backbone: '../components/backbone/backbone'
    bootstrap: '../components/bootstrap/dist/js/bootstrap'
    handlebars: "../components/handlebars/handlebars"
    pixi: "../components/pixi/bin/pixi"
  shim:
    underscore:
      exports: '_'
    pixi:
      exports: 'PIXI'
    backbone:
      deps: ['jquery', 'underscore']
      exports: 'Backbone'

    handlebars:
      exports: "Handlebars"
      init: ->
        @Handlebars = Handlebars
        @Handlebars

    bootstrap:
      deps: ['jquery']
      exports: 'jquery'

require [
  "jquery"
  "backbone"
  "routes/application"
  "pixi"
], ($, Backbone, ApplicationRouter, pixi) ->


  assetsToLoader = [
    "/images/map.jpg"
    "/images/arrow.png"
    "/images/ship.png"
    "/images/pirate_ship.png"
  ]
  loader = new pixi.AssetLoader assetsToLoader

  loader.onComplete = ->
    console.log "Enjoy okroshka!"
    new ApplicationRouter()
    Backbone.history.start()

  loader.load()

