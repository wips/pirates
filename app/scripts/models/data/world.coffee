define (require) ->
  fakeFields  = []
  fakeFields.push parseInt(Math.random()*16) + 1 for i in [1..30*53]

  worldData =
    height: 30
    width: 53
    fields: fakeFields

  worldData