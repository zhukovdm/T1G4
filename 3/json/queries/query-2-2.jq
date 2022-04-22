[ .[]
| select
  ( ."ex:legalName"
  | has("de")
  )
| select
  ( ."ex:produces"[]
  | select
    ( ."ex:purchasePrice" > 150000
    )
  )
| { producer: ."ex:legalName"."de"
  }
]
| unique_by(.producer)
