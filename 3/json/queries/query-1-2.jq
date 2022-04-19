#Get name, email and phone of an agency which owns bus that rides a connection with more than two stops //add: remove duplicates
.agency[] | 
select( try.owns.vehicle[] |
try.rides.Connection.connects[] |
length > 2) |  
{name: .legalName, email: .email, phone: .phone}