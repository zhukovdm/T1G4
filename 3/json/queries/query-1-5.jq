#Find Producers, which had produced vehicles with purchase price
#greater than 150000 units and legal name starts with 'T' or 'S'

.agencies[] |
try.owns.vehicle[] |
select(.purchasePrice|tonumber>150000) |
select(
    (.producer.legalName |startswith("B")) or
    (.producer.legalName | startswith("S"))
) |
try.producer | {legalName : .legalName}