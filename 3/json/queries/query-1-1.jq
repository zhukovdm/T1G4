[ .[]
| .owns[]
| select
  ( .uri
  | startswith("train")
  )
| .rides.belongsTo
| select(.length > 20)
| { firstStation: .startsWith.stationName."cs"
  , lastStation: .endsWith.stationName."cs"
  , length: .length
  }
]
