#Select all names of stations with which starts a route
#that belongs to connection which is ridden by a train

.agencies[] | .owns.vehicle[] | select (.train , .rides) | 
.rides.Connection.belongsTo.transitRoute.startsWith.station.stationName | 
if . != null then . else "null" end | 
select( . != "null" ) | 
{ stationName: . }