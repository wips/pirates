define (require) ->

  Port = require "models/port"
  FieldFactory = require "models/factories/field"

  describe "Port", ->
    it "should initalize port type according fieldType", ->
      sut = new Port
      sut.init fieldType: FieldFactory::PORT_PIRATES
      sut.type.should.equal FieldFactory::PORT_PIRATES
