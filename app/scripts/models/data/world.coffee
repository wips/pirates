define (require) ->
  fakeFields  = [
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 1,  16, 1,  3,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  10, 12, 1,  10
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 1,  1,  1,  16, 16, 1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  10, 16, 16
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 1,  1,  16, 16, 16, 1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  16, 16, 16, 16
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 1,  1,  1,  16, 1,  8,  1,  1,  1,  1,  7,  1,  1,  1,  1,  7,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  16, 16
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 1,  8,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  7,  1,  1,  1,  1,  1,  1,  1,  1,  5,  1,  1,  1,  1,  1,  1,  1,  1,  1,  16, 16
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 1,  1,  16, 8,  1,  1,  1,  1,  1,  1,  1,  1,  7,  1,  1,  1,  1 , 7,  1,  1,  1,  1,  1,  1,  5,  1,  1,  9,  1,  9,  1,  1,  1,  1,  1,  16, 16
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 1,  1,  1,  8,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  5,  1,  1,  7,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  16, 16, 16, 16, 16, 16
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 1,  1,  8,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  5,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  3,  1,  16, 16, 16, 16, 16, 16
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 10, 1,  1,  1,  1,  5,  1,  1,  1,  5,  1,  1,  1,  5,  1,  1,  1,  1,  1,  1,  1,  1,  1,  13, 1,  1,  1,  1,  1,  1,  3,  1,  1,  16, 16, 16, 16, 16, 16
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 1,  1,  1,  1,  1,  1,  1,  1,  5,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  3,  1,  1,  3,  16, 11, 16, 16, 16, 16
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 1,  1,  1,  7,  1,  7,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  3,  1,  1,  1,  1,  1,  16, 16
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 1,  7,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  16, 16, 16, 16
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 1,  1,  1,  7,  7,  1,  1,  11, 1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  13, 1,  1,  1,  16, 16, 16, 16, 16, 16
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 1,  2,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  8,  1,  8,  1,  1,  16, 16, 16, 16, 16, 16
    16, 16, 16, 16, 1,  1,  5,  1,  9,  1,  16, 16, 2,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  16, 16, 16, 16, 16, 16, 16
    16, 16, 16, 1,  7,  1,  1,  5,  1,  1,  16, 16, 1,  1,  2,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  8,  1,  11, 1,  1,  16, 16, 16, 16, 16, 16, 16, 16
    16, 16, 16, 1,  7,  1,  1,  1,  1,  1,  1,  16, 2,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  8,  8,  1,  8,  16, 16, 16, 16, 16, 16, 16, 16, 16
    16, 16, 16, 2,  1,  1,  1,  1,  1,  1,  11, 1,  1,  1,  1,  1,  6,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  8,  1,  1,  1,  1,  1,  1,  16, 16, 16, 16, 16, 16, 16, 16, 16
    16, 16, 16, 1,  1,  1,  8,  1,  4,  1,  16, 16, 16, 1,  1,  1,  6,  1,  6,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  8,  8,  1,  3,  1,  1,  16, 16, 16, 16, 16, 16, 16, 16, 16
    16, 16, 16, 1,  6,  1,  16, 16, 1,  1,  16, 16, 16, 11, 1,  10, 1,  1,  1,  1,  6,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  8,  1,  8,  1,  1,  1,  1,  1,  3,  16, 16, 16, 16, 16, 16, 16, 16, 16, 16
    16, 16, 16, 11, 1,  1,  16, 16, 1,  6,  16, 16, 16, 16, 16, 16, 16, 11, 1,  6,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  8,  1,  1,  8,  1,  1,  1,  1,  1,  16, 16, 16, 16, 16, 16, 16, 16, 16, 16
    16, 16, 16, 16, 16, 16, 16, 16, 1,  1,  1,  16, 16, 16, 16, 16, 16, 1,  11, 1,  1,  1,  6,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  8,  1,  1,  8,  13, 1,  1,  1,  16, 16, 16, 16, 16, 16, 16, 16, 16, 16
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 6,  1,  6,  1,  1,  1,  1,  1,  1,  1,  1,  11, 1,  1,  1,  1,  1,  4,  1,  1,  4,  1,  1,  8,  1,  8,  1,  1,  1,  1,  3,  1,  13, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 1,  1,  1,  4,  1,  1,  1,  4,  1,  1,  4,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  8,  1,  1,  1,  1,  1,  1,  1,  1,  1,  16, 16, 16, 16, 16, 16, 16, 16, 16, 16
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 1,  1,  1,  1,  1,  16, 16, 16, 1,  1,  1,  1,  6,  1,  6,  1,  4,  1 , 1,  1,  4,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  16, 16, 16, 16, 16, 16, 16, 16, 16, 16
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 1,  11, 1,  16, 16, 16, 16, 16, 16, 16, 11, 14, 1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16
    16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16
  ]

  worldData =
    height: 30
    width: 53
    fields: fakeFields
    ships: [
      {position: {x: 20, y: 10}}
      {position: {x: 5, y: 5}}
      {position: {x: 1, y: 1}}
    ]
  worldData