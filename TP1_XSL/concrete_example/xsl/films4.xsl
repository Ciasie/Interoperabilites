<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Permet d'ignorer les valeurs vides  -->
  <xsl:strip-space elements="*" />
  
    <!-- TOUJOURS commencer par un template racine auquel on 
    les templates definis  -->
    <xsl:template match="/">
      <html>
      <head>
        <title>Premier fichier xsl concret</title>
      </head>
      <body>
        <h1>Liste des <xsl:value-of select="count(FILMS/Film)" /> films</h1>
        <table border="1">
          <tr>
            <th>N°</th>
            <th>Titre</th>
            <th>Réalisateur</th>
            <th>Pays</th>
            <th>Genre</th>
            <th>Durée</th>
            <th>Affiche</th>
            <th>Ils ont aimé</th>
          </tr>
          <xsl:apply-templates />
        </table>
      </body>
      </html>
    </xsl:template>

    <xsl:template match="node()">
      <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="Film">
      <tr>
        <td><xsl:value-of select="position()" /></td>
        <xsl:apply-templates select="Titre"/>
        <td>
            <xsl:choose>
              <xsl:when test="count(Realisateur)>2">
                <i>Film Collectif</i>
              </xsl:when>
              <xsl:otherwise>
                  <xsl:apply-templates select="Realisateur" />
              </xsl:otherwise>
            </xsl:choose>
        </td>
        <xsl:apply-templates select="Pays" />
        <xsl:apply-templates select="Genre" />
        <xsl:apply-templates select="Duree" />
        <xsl:apply-templates select="@Affiche" />
        <td><xsl:apply-templates select="Critique" /></td>
      </tr>
    </xsl:template>

    <xsl:template match="Titre">
      <td><b><xsl:value-of select="." /></b></td>
    </xsl:template>

    <xsl:template match="Realisateur">
      <b><xsl:value-of select="Nom" /></b><xsl:value-of select="Prenom" /><br/>
    </xsl:template>

    <xsl:template match="Pays">
      <td><xsl:value-of select="." /></td>
    </xsl:template>
    
    <xsl:template match="Genre">
      <td><xsl:value-of select="." /></td>
    </xsl:template>
    
    <xsl:template match="Duree">
      <td><xsl:value-of select="." /></td>
    </xsl:template> 
    
    <xsl:template match="@Affiche">
      <td><img width="70"> 
        <xsl:attribute name="src">
          <xsl:value-of select="." />
        </xsl:attribute>
      </img></td>
    </xsl:template>

    <xsl:template match="Critique">
      <xsl:if test="Note > 0">
        <xsl:apply-templates select="Media" />
      </xsl:if>
    </xsl:template>

    <xsl:template match="Media">
      <xsl:value-of select="." />
    </xsl:template>

    <xsl:output method="html" version="5.0" encoding="UTF-8" />
</xsl:stylesheet>