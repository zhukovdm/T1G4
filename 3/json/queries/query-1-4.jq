.agencies[] | .owns.vehicle[] | select (.train , .rides) | 
.rides.Connection.belongsTo.transitRoute.startsWith.station.stationName | 
if . != null then . else "null" end | 
select( . != "null" ) | 
{ stationName: . }
