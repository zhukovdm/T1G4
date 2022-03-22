// Find all distinct vehicles, that rides connections valid from
// the year 2010 till end of the year 2021. The result should be
// ordered by vehicle capacity.

MATCH (v)-[:RIDES]->(c:Connection)-[:BELONGS_TO]->(r:Route)
WHERE date(r.validFrom) >= date("2010-01-01") AND date(r.validTo) <= date("2021-12-31")
RETURN DISTINCT v
ORDER BY v.capacity ASC
