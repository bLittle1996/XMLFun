<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" indent="yes" />
	<xsl:param name="route" select="'170'" />

	<xsl:template match="/">
		<div>
			Displaying LTC Route <strong><xsl:value-of select="$route"/></strong>
			<xsl:choose>
				<xsl:when test="count(//routes[contains(., $route)]) = 0">
					<div class="no-routes">
						Unable to find stops for the route...
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div class="count">Stops Found: <xsl:value-of select="count(//stop[contains(routes, $route)])" /></div>
					<div class="stop ul">
						<div class="stop-number">Stop Number</div>
						<div class="stop-name">Stop Name</div>
						<div class="stop-routes">Routes on Stop</div>
						<div class="stop-location">Location</div>
					</div>
					<xsl:for-each select="allstops/stop">
						<xsl:sort select="@number" data-type="number"/>
						<xsl:apply-templates select="."/>
					</xsl:for-each>
					<div class="to-top">
						<a href="#top">Back to Top</a>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>
	<xsl:template match="stop">
		<xsl:if test="contains(routes, $route)">
			<div class="stop">
				<div class="stop-number">
					#<xsl:value-of select="@number"/>
				</div>
				<div class="stop-name">
					<xsl:value-of select="@name"/>
				</div>
				<div class="stop-routes">
					<xsl:value-of select="routes"/>
				</div>
				<div class="stop-location">
					<span class="lat">Lat: <xsl:value-of select="location/latitude"/></span>     	
					<br/>
					<span class="lng">Lng: <xsl:value-of select="location/longitude"/></span>
				</div>
			</div>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>