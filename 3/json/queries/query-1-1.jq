  .[]
| ."ex:owns"[]
| select
  ( ."@id"
  | startswith("train")
  )
| ."ex:rides"."ex:belongsTo"
| select(."ex:length" > 20)
| {
    firstStation: ."ex:startsWith"."ex:stationName"."cs",
    lastStation: ."ex:endsWith"."ex:stationName"."cs",
    length: ."ex:length"
  }
