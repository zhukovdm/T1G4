#Get all known produced by Siemens, ordered by their consumption
MATCH(p:Producer)-[:PRODUCED]-(t:Train)
WHERE p.legalName = "Siemens AG" 
RETURN t 
ORDER BY t.consumption 
;