// ---NODES DEFINITIONS---

// "train" definition
CREATE (train1:Train{capacity: 30, consumption: 500, purchasePrice: 550000, electricMotor:true, europeanVehicleNumber: "B 228 FK"})
CREATE (train2:Train{capacity: 100, consumption: 1000, purchasePrice: 1000000, electricMotor:true, europeanVehicleNumber: "CGI 964"})
CREATE (train3:Train{capacity: 123, consumption: 300, purchasePrice: 200000, electricMotor:false, europeanVehicleNumber: "EW 40 672"})

// "bus" definition
CREATE (bus1:Bus{capacity: 23, consumption: 42, purchasePrice: 523147, licensePlateNumber: "4A2 7983"})
CREATE (bus2:Bus{capacity: 5, consumption: 10, purchasePrice: 65000, licensePlateNumber: "5T1 9876"})
CREATE (bus3:Bus{capacity: 54, consumption: 98, purchasePrice: 123000, licensePlateNumber: "6M4 1426"})

// "producers" definition
CREATE (tatra:Producer{legalName: "TATRA TRUCKS a.s."})
CREATE (man:Producer{legalName: "Maschinenfabrik Augsburg-Nürnberg"})
CREATE (siemens:Producer{legalName: "Siemens AG"})
CREATE (bombardier:Producer{legalName: "Bombardier Inc."})

// "transport" agency definition
CREATE (student:Agency{legalName: "Student Agency", phone: "+420 630 784 245", email: "info@studentagency.cz"})
CREATE (leo:Agency{legalName: "Leo Express", phone: "+420 543 140 738", email: "info@leoexpress.com"})
CREATE (dpp:Agency{legalName: "Dopravní podnik hl. m. Prahy", phone: "+420 640 921 554", email: "info@dpp.cz"})

// "station" definition
CREATE (tst1:TrainStation{stationName: "Heřmánky", capacity: 50})
CREATE (tst2:TrainStation{stationName: "Vítkov", capacity: 40})
CREATE (tst3:TrainStation{stationName: "Jakubčovice nad Odrou", capacity: 60})
CREATE (tst4:TrainStation{stationName: "Malostranské náměstí", capacity: 120})
CREATE (tst5:TrainStation{stationName: "Doliny", capacity: 5})
CREATE (tst6:TrainStation{stationName: "Budějovická", capacity: 170})
CREATE (bst1:BusStation{stationName: "Oderská", capacity: 30})
CREATE (bst2:BusStation{stationName: "Budišovská", capacity: 20})
CREATE (bst3:BusStation{stationName: "Spojovací", capacity: 45})
CREATE (bst4:BusStation{stationName: "Na Vrstevnici", capacity: 35})
CREATE (bst5:BusStation{stationName: "Sídliště Novodvorská", capacity: 25})
CREATE (bst6:BusStation{stationName: "Limuzská", capacity: 80})

// "route" definition
CREATE (route1:Route{length: 120.5, validFrom: "2015-01-01", validTo: "2020-12-31"})
CREATE (route9:Route{length: 37.0, validFrom: "2005-10-01", validTo: "2025-09-25"})
CREATE (route37:Route{length: 11.6, validFrom: "2021-12-10", validTo: "2022-12-12"})
CREATE (route137:Route{length: 12.2, validFrom: "2021-12-13", validTo: "2022-12-12"})

// "connection" definition
CREATE (con11:Connection)
CREATE (con91:Connection)
CREATE (con371:Connection)
CREATE (con1371:Connection)
CREATE (con1372:Connection)

// "stop" definition
CREATE (stop1:Stop{gps: "49.7134667N, 17.7582722E", arrivalTime: "12:00:00", departureTime: "12:01:00"})
CREATE (stop2:Stop{gps: "49.7741814N, 17.7475375E", arrivalTime: "12:05:00", departureTime: "12:06:00"})
CREATE (stop3:Stop{gps: "49.6969069N, 17.7886239E", arrivalTime: "12:10:00", departureTime: "12:11:00"})
CREATE (stop4:Stop{gps: "49.6952592N, 17.7879486E", arrivalTime: "11:00:00", departureTime: "11:01:00"})
CREATE (stop5:Stop{gps: "49.7067069N, 17.7684325E", arrivalTime: "11:05:00", departureTime: "11:06:00"})
CREATE (stop6:Stop{gps: "49.7760583N, 17.7494736E", arrivalTime: "11:10:00", departureTime: "11:11:00"})
CREATE (stop7:Stop{gps: "45.0034761N 14.2635348E", arrivalTime: "10:00:00", departureTime: "10:01:00"})
CREATE (stop8:Stop{gps: "50.091689N 14.443813E", arrivalTime: "10:05:00", departureTime: "10:06:00"})
CREATE (stop9:Stop{gps: "50.100481N 14.464590E", arrivalTime: "10:10:00", departureTime: "10:11:00"})
CREATE (stop10:Stop{gps: "50.108388N 14.475745E", arrivalTime: "10:15:00", departureTime: "10:16:00"})
CREATE (stop11:Stop{gps: "50.108388N 14.475745E", arrivalTime: "14:00:00", departureTime: "14:01:00"})
CREATE (stop12:Stop{gps: "50.100481N 14.464590E", arrivalTime: "14:05:00", departureTime: "14:06:00"})
CREATE (stop13:Stop{gps: "50.108388N 14.475745E", arrivalTime: "15:00:00", departureTime: "15:01:00"})
CREATE (stop14:Stop{gps: "50.100481N 14.464590E", arrivalTime: "15:05:00", departureTime: "15:07:00"})

// ---RELATION DEFINITIONS---

// "ownership" definition
CREATE (dpp)-[:OWNS {since: 2015}]->(train1)
CREATE (dpp)-[:OWNS {since: 2018}]->(bus2)
CREATE (leo)-[:OWNS {since: 2020}]->(train2)
CREATE (leo)-[:OWNS {since: 2010}]->(train3)
CREATE (student)-[:OWNS {since: 2022}]->(bus3)

// "production" definition
CREATE (tatra)-[:PRODUCED {productionDate: 2000}]->(bus1)
CREATE (tatra)-[:PRODUCED {productionDate: 2015}]->(bus2)
CREATE (tatra)-[:PRODUCED {productionDate: 2010}]->(train3)
CREATE (man)-[:PRODUCED {productionDate: 2010}]->(bus3)
CREATE (siemens)-[:PRODUCED {productionDate: 2010}]->(train1)
CREATE (bombardier)-[:PRODUCED {productionDate: 2010}]->(train2)

// "ride" definition
CREATE (train1)-[:RIDES]->(con11)
CREATE (bus2)-[:RIDES]->(con91)
CREATE (bus3)-[:RIDES]->(con371)
CREATE (train3)-[:RIDES]->(con1371)
CREATE (bus1)-[:RIDES]->(con1372)

// "belongs to" definition
CREATE (con11)-[:BELONGS_TO]->(route1)
CREATE (con91)-[:BELONGS_TO]->(route9)
CREATE (con371)-[:BELONGS_TO]->(route37)
CREATE (con1371)-[:BELONGS_TO]->(route137)
CREATE (con1372)-[:BELONGS_TO]->(route137)

// "connects" definition
CREATE (con11)-[:CONNECTS]->(stop1)
CREATE (con11)-[:CONNECTS]->(stop2)
CREATE (con11)-[:CONNECTS]->(stop3)
CREATE (con91)-[:CONNECTS]->(stop4)
CREATE (con91)-[:CONNECTS]->(stop5)
CREATE (con91)-[:CONNECTS]->(stop6)
CREATE (con371)-[:CONNECTS]->(stop7)
CREATE (con371)-[:CONNECTS]->(stop8)
CREATE (con371)-[:CONNECTS]->(stop9)
CREATE (con371)-[:CONNECTS]->(stop10)
CREATE (con1371)-[:CONNECTS]->(stop11)
CREATE (con1371)-[:CONNECTS]->(stop12)
CREATE (con1372)-[:CONNECTS]->(stop13)
CREATE (con1372)-[:CONNECTS]->(stop14)

// "followed by" definition
CREATE (stop1)-[:FOLLOWED_BY]->(stop2)
CREATE (stop2)-[:FOLLOWED_BY]->(stop3)
CREATE (stop4)-[:FOLLOWED_BY]->(stop5)
CREATE (stop5)-[:FOLLOWED_BY]->(stop6)
CREATE (stop7)-[:FOLLOWED_BY]->(stop8)
CREATE (stop8)-[:FOLLOWED_BY]->(stop9)
CREATE (stop9)-[:FOLLOWED_BY]->(stop10)
CREATE (stop11)-[:FOLLOWED_BY]->(stop12)
CREATE (stop13)-[:FOLLOWED_BY]->(stop14)

// "serves" definition
CREATE (stop1)-[:SERVES]->(tst1)
CREATE (stop2)-[:SERVES]->(tst2)
CREATE (stop3)-[:SERVES]->(tst3)
CREATE (stop4)-[:SERVES]->(bst1)
CREATE (stop5)-[:SERVES]->(bst2)
CREATE (stop6)-[:SERVES]->(bst3)
CREATE (stop7)-[:SERVES]->(tst4)
CREATE (stop8)-[:SERVES]->(tst5)
CREATE (stop9)-[:SERVES]->(tst6)
CREATE (stop10)-[:SERVES]->(bst4)
CREATE (stop11)-[:SERVES]->(bst5)
CREATE (stop12)-[:SERVES]->(bst6)

// "starts with" definition
CREATE (route1)-[:STARTS_WITH]->(tst1)
CREATE (route9)-[:STARTS_WITH]->(bst1)
CREATE (route37)-[:STARTS_WITH]->(tst4)
CREATE (route137)-[:STARTS_WITH]->(bst4)

// "ends with" definition
CREATE (route1)-[:ENDS_WITH]->(tst3)
CREATE (route9)-[:ENDS_WITH]->(bst3)
CREATE (route37)-[:ENDS_WITH]->(tst5)
CREATE (route137)-[:ENDS_WITH]->(bst6)
