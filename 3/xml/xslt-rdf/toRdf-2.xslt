<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:fn="http://www.w3.org/2005/xpath-functions">

<xsl:output method="text" encoding="UTF-8" />
    
<xsl:template match="producers">
@prefix dbpedia-owl: &lt;https://dbpedia.org/ontology/&gt; .
@prefix ex: &lt;http://example.org/vocabulary/&gt; .
@prefix pext: &lt;http://www.ontotext.com/proton/protonext#&gt; .
@prefix rdfs: &lt;http://www.w3.org/2000/01/rdf-schema#&gt; .
@prefix xsd: &lt;https://www.w3.org/TR/xmlschema-2/#&gt; .

dbpedia-owl:Train rdfs:subClassOf pext:Vehicle .

ex:Producer a rdfs:Class ;
    rdfs:label &quot;producer&quot;@en ;
    rdfs:comment &quot;A company-producer of different kinds of vehicles&quot;@en .

@prefix producer: &lt;https://T1G4.DOX.cz/Producer/#&gt; .
<xsl:apply-templates/>
</xsl:template>

<xsl:template match="producer">
producer:<xsl:value-of select="id"/> a ex:Producer ;
    ex:legalName &quot;<xsl:value-of select="legalName"/>&quot;@<xsl:value-of select="legalName/@xml:lang"/> .
</xsl:template>

<xsl:template match="text()"/>

</xsl:stylesheet>
