[ .[]
| select
  ( .legalName
  | has("de")
  )
| select
  ( .produces[]
  | select
    ( .purchasePrice > 150000
    )
  )
| { producer: .legalName."de"
  }
]
| unique_by(.producer)
