[ .[]
| select
  ( ."ex:owns"[]
  | ."@id"
  | startswith("bus")
  )
| select
  ( ."ex:owns"[]
  | ."ex:rides"."ex:connects"
  | length > 2
  )
| { name: ."@id"
  , email: ."ex:email"
  , phone: ."ex:phone"
  }
]
| unique_by(.name)
