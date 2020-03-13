<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="Articles">
    <Articles>
      <xsl:apply-templates/>
    </Articles>
  </xsl:template>

  <xsl:template match="Article">
    <Article>
      <xsl:for-each select="*">
        <xsl:attribute name="{name()}">
          <xsl:value-of select="text()"/>
        </xsl:attribute>
      </xsl:for-each>
    </Article>
  </xsl:template>
</xsl:stylesheet>