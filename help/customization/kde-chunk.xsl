<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		version="1.0">

<xsl:import href="../docbook/xsl/html/chunk-common.xsl"/>
<xsl:include href="kde-navig.xsl"/>
<xsl:include href="kde-ttlpg.xsl"/>

<xsl:template name="make-relative-filename">
  <xsl:param name="base.dir" select="'./'"/>
  <xsl:param name="base.name" select="''"/>

  <!-- XT makes chunks relative -->
  <xsl:choose>
    <xsl:when test="count(parent::*) = 0">
      <xsl:value-of select="concat($base.dir,$base.name)"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$base.name"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="write.chunk">
  <xsl:param name="filename" select="''"/>
  <xsl:param name="method" select="'html'"/>
  <xsl:param name="encoding" select="'utf-8'"/>
  <xsl:param name="content" select="''"/>
  
  <FILENAME filename="{$filename}"> 
  <xsl:copy-of select="$content"/>
  </FILENAME>
</xsl:template>

<xsl:param name="use.id.as.filename">1</xsl:param>
<xsl:param name="generate.section.toc">1</xsl:param>
<xsl:param name="use.extensions">0</xsl:param>

<xsl:template name="dbhtml-filename">
<xsl:choose>
     <xsl:when test=". != /*">
      <xsl:value-of select="@id"/>
      <xsl:value-of select="$html.ext"/>
     </xsl:when>
     <xsl:otherwise>
	<xsl:text>index.html</xsl:text>
      </xsl:otherwise>
</xsl:choose>
</xsl:template>

</xsl:stylesheet>
