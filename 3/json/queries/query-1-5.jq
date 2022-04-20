.agencies[] |
try.owns.vehicle[] |
select(.purchasePrice|tonumber>150000) |
select(
    (.producer.legalName |startswith("B")) or
    (.producer.legalName | startswith("S"))
) |
try.producer | {legalName : .legalName}
