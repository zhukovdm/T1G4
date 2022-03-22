// Get EVN of all trains owned by Leo Express and going on their shortest trainsit route.

MATCH(a:Agency)-[:OWNS]-(t:Train)-[:RIDES]-(conn)-[:BELONGS_TO]-(r:Route)
WHERE a.legalName = "Leo Express"
RETURN t.europeanVehicleNumber
ORDER BY r.length DESC
LIMIT 1
;