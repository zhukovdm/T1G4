[ .[]
| select
  ( ."@id"
  | endswith("tatra")
  )
| ."ex:produces"[]
| select
  ( ."@id"
  | startswith("bus")
  )
| select
  ( ."ex:consumption" > 20
  )
| { license: ."ex:licensePlateNumber"
  }
]
