.agencies[] | try.owns.vehicle[] |
select(.producer.legalName=="Siemens AG") |
.bus | select(.licensePlateNumber!=null) |
{licensePlateNumber: .licensePlateNumber}
