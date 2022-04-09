<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:fn="http://www.w3.org/2005/xpath-functions">

<xsl:output method="text" encoding="UTF-8" />

<xsl:template match="root">
@prefix dbpedia-owl: &lt;https://dbpedia.org/ontology/&gt; .
@prefix ex: &lt;http://example.org/vocabulary/&gt; .
@prefix gtfs: &lt;http://vocab.gtfs.org/terms#&gt; .
@prefix pext: &lt;http://www.ontotext.com/proton/protonext#&gt; .
@prefix rdf: &lt;http://www.w3.org/1999/02/22-rdf-syntax-ns#&gt; .
@prefix rdfs: &lt;http://www.w3.org/2000/01/rdf-schema#&gt; .
@prefix xsd: &lt;https://www.w3.org/TR/xmlschema-2/#&gt; .

@prefix train: &lt;https://T1G4.DOX.cz/Train/#&gt; .
@prefix bus: &lt;https://T1G4.DOX.cz/Bus/#&gt; .
@prefix station: &lt;https://T1G4.DOX.cz/Station/#&gt; .
@prefix stop: &lt;https://T1G4.DOX.cz/Stop/#&gt; .
@prefix agency: &lt;https://T1G4.DOX.cz/Agency/#&gt; .
@prefix conn: &lt;https://T1G4.DOX.cz/Connection/#&gt; .
@prefix transitRoute: &lt;https://T1G4.DOX.cz/TransitRoute/#&gt; .

dbpedia-owl:Train rdfs:subClassOf pext:Vehicle .

ex:Bus a rdfs:Class ;
    rdfs:label &quot;bus&quot;@en ;
    rdfs:comment &quot;Public transport road vehicle&quot;@en .
ex:Bus rdfs:subClassOf pext:Vehicle .

ex:TrainStation a rdfs:Class ;
    rdfs:label &quot;train station&quot;@en ;
    rdfs:comment &quot;Named train station.&quot;@en .
ex:TrainStation rdfs:subClassOf dbpedia-owl:Station .

ex:BusStation a rdfs:Class ;
    rdfs:label &quot;bus station&quot;@en ;
    rdfs:comment &quot;Named bus station.&quot;@en.
ex:BusStation rdfs:subClassOf dbpedia-owl:Station .

ex:Connection a rdfs:Class ;
    rdfs:label &quot;connection&quot;@en ;
    rdfs:comment &quot;A particular instance of a transit route which has its id. Each connection goes through the set of stops&quot;@en .

ex:phone a rdf:Property ;
    rdfs:label &quot;phone number&quot;@en ;
    rdfs:comment &quot;Mobile or stationary phone number&quot;@en ;
    rdfs:domain gtfs:Agency ;
    rdfs:range addr:tel .

ex:email a rdf:Property ;
    rdfs:label "email"@en ;
    rdfs:comment "E-mail address"@en ;
    rdfs:domain gtfs:Agency ;
    rdfs:range xsd:string .

ex:legalName a rdf:Property ;
    rdfs:label &quot;legal name&quot;@en ;
    rdfs:comment &quot;Company legal name&quot;@en ;
    rdfs:domain rdfs:Class ;
    rdfs:range xsd:string .

ex:capacity a rdf:Property ;
    rdfs:label &quot;capacity&quot;@en ;
    rdfs:comment &quot;Number of people who can fit to a structure&quot;@en ;
    rdfs:domain rdfs:Class ;
    rdfs:range xsd:integer .

ex:electricMotor a rdf:Property ;
    rdfs:label &quot;Is motor electric?&quot;@en ;
    rdfs:comment &quot;Indication if a vehicle has electric motor or not&quot;@en ;
    rdfs:domain dbpedia-owl:Train ;
    rdfs:range xsd:boolean .

ex:europeanVehicleNumber a rdf:Property ;
    rdfs:label &quot;european vehicle number&quot;@en ;
    rdfs:comment &quot;Vehicle number issued by a European regulator.&quot;@en ;
    rdfs:domain dbpedia-owl:Train ;
    rdfs:range xsd:string .

ex:licensePlateNumber a rdf:Property ;
    rdfs:label &quot;license plate number&quot;@en ;
    rdfs:comment &quot;License plate number issued by a regulator.&quot;@en ;
    rdfs:domain ex:Bus ;
    rdfs:range xsd:string .

ex:consumption a rdf:Property ;
    rdfs:label &quot;consumption&quot;@en ;
    rdfs:comment &quot;Vehicle consumption of gasoline or electricity per km.&quot;@en ;
    rdfs:domain pext:Vehicle ;
    rdfs:range xsd:integer .

ex:purchasePrice a rdf:Property ;
    rdfs:label &quot;purchase price&quot;@en ;
    rdfs:comment &quot;Vehicle purchase price in CZK.&quot;@en ;
    rdfs:domain pext:Vehicle ;
    rdfs:range xsd:integer .

ex:gps a rdf:Property ;
    rdfs:label &quot;gps&quot;@en ;
    rdfs:comment &quot;Exact point on a map where stop is located.&quot;@en ;
    rdfs:domain gtfs:Stop ;
    rdfs:range xsd:string .

ex:arrivalTime a rdf:Property ;
    rdfs:label &quot;arrival time&quot;@en ;
    rdfs:comment &quot;Arrival time of a vehicle.&quot;@en ;
    rdfs:domain gtfs:Stop ;
    rdfs:range xsd:time .

ex:departureTime a rdf:Property ;
    rdfs:label &quot;departure time&quot;@en ;
    rdfs:comment &quot;Departure time of a vehicle.&quot;@en ;
    rdfs:domain gtfs:Stop ;
    rdfs:range xsd:time .

ex:length a rdf:Property ;
    rdfs:label &quot;length&quot;@en ;
    rdfs:comment &quot;A length of route in kilometers.&quot;@en ;
    rdfs:domain gtfs:Route ;
    rdfs:range xsd:decimal .

ex:validFrom a rdf:Property ;
    rdfs:label &quot;valid from&quot;@en ;
    rdfs:comment &quot;A date since when was operation on a route allowed.&quot;@en ;
    rdfs:domain gtfs:Route ;
    rdfs:range xsd:date .

ex:validTo a rdf:Property ;
    rdfs:label &quot;valid to&quot;@en ;
    rdfs:comment &quot;Last date of allowed operation on a route.&quot;@en ;
    rdfs:domain gtfs:Route ;
    rdfs:range xsd:date .

ex:stationName a rdf:Property ;
    rdfs:label &quot;station name&quot;@en ;
    rdfs:comment &quot;Actual station name.&quot;@en ;
    rdfs:domain dbpedia-owl:Station ;
    rdfs:range xsd:string .

ex:owns a rdf:Property ;
    rdfs:label &quot;owns&quot;@en ;
    rdfs:comment &quot;A transit agency owns a vehicle.&quot;@en ;
    rdfs:domain gtfs:Agency ;
    rdfs:range pext:Vehicle .

ex:rides a rdf:Property ;
    rdfs:label &quot;rides&quot;@en ;
    rdfs:comment &quot;A vehicle rides a connection.&quot;@en ;
    rdfs:domain pext:Vehicle ;
    rdfs:range ex:Connection .

ex:belongsTo a rdf:Property ;
    rdfs:label &quot;belongs to&quot;@en ;
    rdfs:comment &quot;A connection belongs to a transit route.&quot;@en ;
    rdfs:domain ex:Connection ;
    rdfs:range gtfs:Route .

ex:connects a rdf:Property ;
    rdfs:label &quot;connects&quot;@en ;
    rdfs:comment &quot;A connection connects a set of stops.&quot;@en ;
    rdfs:domain ex:Connection ;
    rdfs:range gtfs:Stop .

ex:startsWith a rdf:Property ;
    rdfs:label &quot;starts with&quot;@end ;
    rdfs:comment &quot;Name of a station, where the route begins.&quot;@en ;
    rdfs:domain gtfs:Route ;
    rdfs:range dbpedia-owl:Station .

ex:endsWith a rdf:Property ;
    rdfs:label &quot;ends with&quot;@end ;
    rdfs:comment &quot;Name of a stop, where the route ends.&quot;@en ;
    rdfs:domain gtfs:Route ;
    rdfs:range dbpedia-owl:Station .
<xsl:apply-templates/>
<xsl:apply-templates select="agency/owns/vehicle"/>
</xsl:template>

<xsl:template match="agency">
agency:<xsl:value-of select="id"/> a gtfs:Agency ;
    ex:legalName &quot;<xsl:value-of select="legalName"/>&quot; ;
    ex:email &quot;<xsl:value-of select="email"/>&quot; ;
    ex:phone <xsl:value-of select="phone"/> ;
<xsl:variable name="agencyId" select="id"/>
<xsl:for-each select="owns/vehicle/bus">
agency:<xsl:value-of select="$agencyId"/> ex:owns bus:<xsl:value-of select="id"/> .
</xsl:for-each>
<xsl:for-each select="owns/vehicle/train">
agency:<xsl:value-of select="$agencyId"/> ex:owns train:<xsl:value-of select="id"/> .
</xsl:for-each>
</xsl:template>

<xsl:template match="train">
train:<xsl:value-of select="id"/> a dbpedia-owl:Train ;
    ex:capacity <xsl:value-of select="parent::node()/capacity"/> ;
    ex:consumption <xsl:value-of select="parent::node()/consumption"/> ;
    ex:purchasePrice <xsl:value-of select="parent::node()/purchasePrice"/> ;
    ex:electricMotor &quot;<xsl:value-of select="electricMotor"/>&quot;^^xsd:boolean ;
    ex:europeanVehicleNumber &quot;<xsl:value-of select="europeanVehicleNumber"/>&quot; .
<xsl:variable name="trainId" select="id"/>
<xsl:for-each select="../rides/Connection">
train:<xsl:value-of select="$trainId"/> ex:rides conn:<xsl:value-of select="id"/> .
</xsl:for-each>
</xsl:template>

<xsl:template match="bus">
bus:<xsl:value-of select="id"/> a ex:Bus ;
    ex:capacity <xsl:value-of select="parent::node()/capacity"/> ;
    ex:consumption <xsl:value-of select="parent::node()/consumption"/> ;
    ex:purchasePrice <xsl:value-of select="parent::node()/purchasePrice"/> ;
    ex:licensePlateNumber &quot;<xsl:value-of select="licensePlateNumber"/>&quot; .
<xsl:variable name="busId" select="id"/>
<xsl:for-each select="../rides/Connection">
bus:<xsl:value-of select="$busId"/> ex:rides conn:<xsl:value-of select="id"/> .
</xsl:for-each>
</xsl:template>

<xsl:template match="Connection">
conn:<xsl:value-of select="id"/> a ex:Connection .
<xsl:variable name="connId" select="id"/>
conn:<xsl:value-of select="$connId"/> ex:belongsTo route:<xsl:value-of select="belongsTo/transitRoute/id"/> .
<xsl:for-each select="connects/stop">
conn:<xsl:value-of select="$connId"/> ex:connects stop:<xsl:value-of select="id"/> .
</xsl:for-each>
<xsl:apply-templates select="connects"/>
<xsl:apply-templates select="belongsTo"/>
</xsl:template>

<xsl:template match="stop">
stop:<xsl:value-of select="id"/> a gtfs:Stop ;
    ex:gps &quot;<xsl:value-of select="gps"/>&quot; ;
    ex:arrivalTime &quot;<xsl:value-of select="arrivalTime"/>&quot;^^xsd:time ;
    ex:departureTime &quot;<xsl:value-of select="departureTime"/>&quot;^^xsd:time .
</xsl:template>

<xsl:template match="transitRoute">
route:<xsl:value-of select="id"/> a gtfs:Route ;
    ex:length <xsl:value-of select="length"/> ;
    ex:validFrom &quot;<xsl:value-of select="validFrom"/>&quot;^^xsd:date ;
    ex:validTo &quot;<xsl:value-of select="validTo"/>&quot;^^xsd:date .

route:<xsl:value-of select="id"/> ex:startsWith station:<xsl:value-of select="startsWith/station/id"/> ;
    ex:endsWith station:<xsl:value-of select="endsWith/station/id"/> .
<xsl:apply-templates select="startsWith"/>
<xsl:apply-templates select="endsWith"/>
</xsl:template>

<xsl:template match="station">
station:<xsl:value-of select="id"/> a ex:<xsl:value-of select="kind"/>Station ;
    ex:stationName &quot;<xsl:value-of select="stationName"/>&quot;@<xsl:value-of select="stationName/@xml:lang"/> ;
    ex:capacity <xsl:value-of select="capacity"/> .
</xsl:template>

    <xsl:template match="text()"/>
</xsl:stylesheet>