require.config
  baseUrl: "../scripts/"
  paths:
    jquery: "../components/jquery/jquery"
    handlebars: "../components/handlebars/handlebars"
    underscore: "../components/underscore/underscore"
    backbone: "../components/backbone/backbone"
    chai: "../components/chai/chai"
    chaiJquery: "../components/chai-jquery/chai-jquery"
    pixi: "../components/pixi/bin/pixi"

  shim:
    underscore:
      exports: "_"
    pixi:
      exports: 'PIXI'
    jquery:
      exports: "$"
    backbone:
      deps: ["underscore", "jquery"]
      exports: "Backbone"

    handlebars:
      exports: "Handlebars"

  urlArgs: "bust=" + (new Date()).getTime()

expect = chai.expect
chai.should()

env = null

mocha.setup
  ui: "bdd"
  ignoreLeaks: true

# Don't track
window.notrack = true

# Mocha run helper, used for browser
runMocha = ->
  if (window.mochaPhantomJS)
    mochaPhantomJS.run()
  else
    mocha.run()

using = (name, values, func) ->
  i = 0
  count = values.length
  while i < count
    values[i] = [values[i]] if "[object Array]" isnt Object::toString.call values[i]
    func.apply this, values[i]
    i++

usingValuesIt = (assumption, values, func) ->
  for parameters in values
    parameters = [parameters] if "[object Array]" isnt Object::toString.call parameters
    it "#{assumption} with #{parameters}", -> func.apply this, parameters

# initialize sinone sandbox
beforeEach ->
  env = sinon.sandbox.create()

afterEach ->
  env.restore()

