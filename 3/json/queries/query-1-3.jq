[ .[]
| .owns[]
| select
  ( .uri
  | startswith("train")
  )
| { name: .rides.belongsTo.startsWith.stationName."cs"
  }
| select
  ( .name != null
  )
]
