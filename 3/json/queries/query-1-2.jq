#Get name, email and phone of an agency which owns bus that rides a connection with more than two stops //add: remove duplicates
.agencies[] | 
select( try.owns.vehicle[] |
try.rides.Connection.connects[] |
length > 2) |=  
unique_by(.legalName) |
{name: .legalName, email: .email, phone: .phone}