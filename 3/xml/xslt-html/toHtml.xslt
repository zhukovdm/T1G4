<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xs="http://www.w3.org/2001/XMLSchema"
xmlns:fn="http://www.w3.org/2005/xpath-functions">

<xsl:output method="html" encoding="UTF-8" />
<xsl:template match="root">
<html> 
<body>
  <h1>Agencies</h1>
  <table border="2">
    <xsl:for-each select="agency">
    <tr bgcolor="#9acd38">
      <th style="text-align:left">Name</th>
      <th style="text-align:left">Email</th>
      <th style="text-align:left">Phone</th>

      <xsl:for-each select="owns/vehicle">
      <th style="text-align:left">vehicle</th>
      </xsl:for-each>
    </tr>
    <tr>
      <td><xsl:value-of select="legalName"/></td>
      <td><xsl:value-of select="email"/></td>
      <td><xsl:value-of select="phone"/></td>

      <xsl:for-each select="owns/vehicle">
      <td>
        <ul>
          <xsl:choose>
            <xsl:when test="train">
              <li>This vehicle is a train.</li>
            </xsl:when>
            <xsl:otherwise>
              <li>This vehicle is a bus.</li>
            </xsl:otherwise>
          </xsl:choose>
          <li>Capacity is <xsl:value-of select="capacity"/> people.</li>
          <li>Consumption is <xsl:value-of select="consumption"/> litres per 100 kilometers.</li>
          <li>Purchase price is <xsl:value-of select="purchasePrice"/> Kč.</li>
        </ul>
      </td>
      </xsl:for-each>
    </tr>
    </xsl:for-each>
  </table>
  </body>
  </html>
  </xsl:template>
  </xsl:stylesheet>