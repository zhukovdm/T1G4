.agencies[] | 
select( try.owns.vehicle[] |
try.rides.Connection.connects[] |
length > 2) |=  
unique_by(.legalName) |
{name: .legalName, email: .email, phone: .phone}
