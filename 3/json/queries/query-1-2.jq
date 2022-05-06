[ .[]
| select
  ( .owns[]
  | .uri
  | startswith("bus")
  )
| select
  ( .owns[]
  | .rides.connects
  | length > 2
  )
| { name: .uri
  , email: .email
  , phone: .phone
  }
]
| unique_by(.name)
