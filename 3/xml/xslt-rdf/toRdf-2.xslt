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
@prefix producer: &lt;https://T1G4.DOX.cz/Producer/#&gt; .
@prefix station: &lt;https://T1G4.DOX.cz/Station/#&gt; .
@prefix stop: &lt;https://T1G4.DOX.cz/Stop/#&gt; .

dbpedia-owl:Train rdfs:subClassOf pext:Vehicle .

ex:Bus a rdfs:Class ;
    rdfs:label &quot;bus&quot;@en ;
    rdfs:comment &quot;Public transport road vehicle&quot;@en .
ex:Bus rdfs:subClassOf pext:Vehicle .

ex:Producer a rdfs:Class ;
    rdfs:label &quot;producer&quot;@en ;
    rdfs:comment &quot;A company-producer of different kinds of vehicles&quot;@en .

ex:TrainStation a rdfs:Class ;
    rdfs:label &quot;train station&quot;@en ;
    rdfs:comment &quot;Named train station.&quot;@en .
ex:TrainStation rdfs:subClassOf dbpedia-owl:Station .

ex:BusStation a rdfs:Class ;
    rdfs:label &quot;bus station&quot;@en ;
    rdfs:comment &quot;Named bus station.&quot;@en.
ex:BusStation rdfs:subClassOf dbpedia-owl:Station .

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

ex:produces a rdf:Property ;
    rdfs:label &quot;produces&quot;@en ;
    rdfs:comment &quot;A producer produces a vehicle.&quot;@en ;
    rdfs:domain ex:Producer ;
    rdfs:range pext:Vehicle .

ex:followedBy a rdf:Property ;
    rdfs:label &quot;followed by&quot;@en ;
    rdfs:comment &quot;A stop is followed by the next stop.&quot;@en ;
    rdfs:domain gtfs:Stop ;
    rdfs:range gtfs:Stop .

ex:serves a rdf:Property ;
    rdfs:label &quot;serves&quot;@en ;
    rdfs:comment &quot;A station serves a stop.&quot;@en ;
    rdfs:domain dbpedia-owl:Station ;
    rdfs:range gtfs:Stop .
<xsl:apply-templates select="producers/producer/vehicles/vehicle"/>
<xsl:apply-templates select="producers/producer"/>
<xsl:apply-templates select="stations"/>
</xsl:template>

<xsl:template match="train">
train:<xsl:value-of select="id"/> a dbpedia-owl:Train ;
    ex:capacity <xsl:value-of select="parent::node()/capacity"/> ;
    ex:consumption <xsl:value-of select="parent::node()/consumption"/> ;
    ex:purchasePrice <xsl:value-of select="parent::node()/purchasePrice"/> ;
    ex:electricMotor &quot;<xsl:value-of select="electricMotor"/>&quot;^^xsd:boolean ;
    ex:europeanVehicleNumber &quot;<xsl:value-of select="europeanVehicleNumber"/>&quot; .

producer:<xsl:value-of select="parent::node()/parent::node()/parent::node()/id"/> ex:produces train:<xsl:value-of select="id"/> .
</xsl:template>

<xsl:template match="bus">
bus:<xsl:value-of select="id"/> a ex:Bus ;
    ex:capacity <xsl:value-of select="parent::node()/capacity"/> ;
    ex:consumption <xsl:value-of select="parent::node()/consumption"/> ;
    ex:purchasePrice <xsl:value-of select="parent::node()/purchasePrice"/> ;
    ex:licensePlateNumber &quot;<xsl:value-of select="licensePlateNumber"/>&quot; .

producer:<xsl:value-of select="parent::node()/parent::node()/parent::node()/id"/> ex:produces bus:<xsl:value-of select="id"/> .
</xsl:template>

<xsl:template match="producer">
producer:<xsl:value-of select="id"/> a ex:Producer ;
    ex:legalName &quot;<xsl:value-of select="legalName"/>&quot;@<xsl:value-of select="legalName/@xml:lang"/> .
</xsl:template>

<xsl:template match="station">
station:<xsl:value-of select="id"/> a ex:<xsl:value-of select="kind"/>Station ;
    ex:stationName &quot;<xsl:value-of select="stationName"/>&quot;@<xsl:value-of select="stationName/@xml:lang"/> ;
    ex:capacity <xsl:value-of select="capacity"/> .
<xsl:variable name="stationId" select="id"/>
<xsl:for-each select="serves/stop/id">
station:<xsl:value-of select="$stationId"/> ex:serves stop:<xsl:value-of select="text()"/> .
</xsl:for-each>
<xsl:apply-templates/>
</xsl:template>

<xsl:template match="stop">
stop:<xsl:value-of select="id"/> a gtfs:Stop ;
    ex:gps &quot;<xsl:value-of select="gps"/>&quot; ;
    ex:arrivalTime &quot;<xsl:value-of select="arrivalTime"/>&quot;^^xsd:time ;
    ex:departureTime &quot;<xsl:value-of select="departureTime"/>&quot;^^xsd:time .
<xsl:apply-templates select="followedBy"/>
</xsl:template>

<xsl:template match="followedBy">
stop:<xsl:value-of select="parent::node()/id"/> ex:followedBy stop:<xsl:value-of select="text()"/> .
</xsl:template>

<xsl:template match="text()"/>

</xsl:stylesheet>
