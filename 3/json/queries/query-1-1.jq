#Select all routes served by train and having length over 20 km
.agency[] | try.owns.vehicle[] |
 try.rides.Connection.belongsTo.transitRoute |
 select(.startsWith.station.kind=="Train") |
 select(.length|tonumber>=20) |
 { firstStation: .startsWith.station.stationName,
 lastStation: .endsWith.station.stationName,
 length: .length}
