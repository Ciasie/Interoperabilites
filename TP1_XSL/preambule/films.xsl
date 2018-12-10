<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- Permet d'ignorer les valeurs vides  -->
<xsl:strip-space elements="*" />
    <!-- TOUJOURS commencer par un template racine auquel on 
     les templates definis  -->
    <xsl:template match="/">
      <xsl:apply-templates />
    </xsl:template>


    <!-- Pour chaque noeud, si ils ont un attribut on applique
     le template d'attributs, puis on applique aussi les autres
     templates qu'on a definit au noeuds fils direct du noeud -->
    <xsl:template match="node()">
        <xsl:apply-templates select="@*"/>
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="@*">
        ATTRIBUTS :    <xsl:value-of select="."/>
    </xsl:template>

    <xsl:template match="Film/Titre">
      FILM TITRE : <xsl:value-of select="."/>
    </xsl:template>

    <xsl:template match="Resume/Titre">
     RESUME TITRE : <xsl:value-of select="."/>
    </xsl:template>

    <xsl:template match="Critique/Titre">
      CRITIQUE TITRE : <xsl:value-of select="."/>
    </xsl:template>

    <xsl:template match="text()">
       FEUILLE : <xsl:value-of select="."/>
    </xsl:template>
    


</xsl:stylesheet>