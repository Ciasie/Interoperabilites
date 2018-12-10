<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml" indent="yes"/>

<xsl:template match="/">
	<BASE>
		<Films>
			<xsl:apply-templates select="//Film" />
		</Films>
		<Acteurs>
			<xsl:apply-templates select="//Acteur" />
		</Acteurs>
		<Realisateurs>
			<xsl:apply-templates select="//Realisateur" />
		</Realisateurs>
	</BASE>
</xsl:template>


<xsl:template match="Film">
	<Film ID="{@ID}" Affiche="{@Affiche}" Langue="{@Langue}">
	
		<xsl:attribute name="Real">
            <xsl:apply-templates select="Realisateur/@ID"/>
        </xsl:attribute>

		<xsl:if test="count(Acteurs/Acteur) > 0">
			<xsl:attribute name="Acteurs">
				<xsl:apply-templates select="Acteurs/Acteur/@ID"/>
			</xsl:attribute>
		</xsl:if>

		<xsl:copy-of select="./*[not(self::Realisateur or self::Acteurs)]" />
	</Film>
</xsl:template>

<xsl:template match="Acteur/@ID">
	<xsl:if test="not(position() = 1)">
		<xsl:text> </xsl:text>
	</xsl:if>
	<xsl:value-of select="." />
</xsl:template>

<xsl:template match="Realisateur/@ID">
	<xsl:if test="not(position() = 1)">
		<xsl:text> </xsl:text>
	</xsl:if>
	<xsl:value-of select="." />
</xsl:template>


<xsl:template match="Acteur">
	<xsl:if test="not(../../preceding-sibling::*/Acteurs/Acteur/@ID=@ID)">
		<xsl:copy-of select="." />
	</xsl:if>
</xsl:template>


<xsl:template match="Realisateur">
	<xsl:if test="not(../preceding-sibling::*/Realisateur/@ID=@ID)">
		<xsl:copy-of select="." />
	</xsl:if>
</xsl:template>


</xsl:stylesheet>