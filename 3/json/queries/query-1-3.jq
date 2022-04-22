[.[]
| ."ex:owns"[]
| select
  ( ."@id"
  | startswith("train")
  )
| { name: ."ex:rides"."ex:belongsTo"."ex:startsWith"."ex:stationName"."cs"
  }
| select
  ( .name != null
  )
]
