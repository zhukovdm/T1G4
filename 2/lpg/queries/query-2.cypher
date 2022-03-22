//Get a license plate number of first bus departing from the station Budějovická.

MATCH(b:Bus)-[:RIDES]-(conn)-[:CONNECTS]-(stop)-[:SERVES]-(station)
WHERE station.stationName = "Budějovická"
RETURN b.licensePlateNumber
ORDER BY stop.departureTime 
;