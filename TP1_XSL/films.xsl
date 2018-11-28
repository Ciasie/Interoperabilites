<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


    <xsl:template match="/"> 
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="text()"> 
        FEUILLE :    <xsl:value-of select="." />
    </xsl:template>

    <xsl:template match="node()">
        <xsl:for-each select="@*">
        ATTR :    <xsl:value-of select="." />
        </xsl:for-each>
         <xsl:apply-templates />
    </xsl:template>


</xsl:stylesheet>