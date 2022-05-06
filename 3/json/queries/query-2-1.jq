[ .[]
| select
  ( .uri
  | endswith("tatra")
  )
| .produces[]
| select
  ( .uri
  | startswith("bus")
  )
| select
  ( .consumption > 20
  )
| { license: .licensePlateNumber
  }
]
