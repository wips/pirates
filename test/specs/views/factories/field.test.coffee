define (require) ->

  FieldViewFactory = require "views/factories/field"

  Ocean = require "models/ocean"
  OceanView = require "views/ocean"

  Port = require "models/port"
  PortView = require "views/port"

  Ground = require "models/ground"
  GroundView = require "views/ground"

  describe "Field View Factory", ->

    it "should create view for ocean", ->
      FieldViewFactory::create(new Ocean).should.be.instanceOf OceanView

    it "should create view for port", ->
      FieldViewFactory::create(new Port).should.be.instanceOf PortView

    it "should create view for ground", ->
      FieldViewFactory::create(new Ground).should.be.instanceOf GroundView
