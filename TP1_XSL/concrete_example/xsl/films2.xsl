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
        <h1>Liste des films</h1>
        <table border="1">
          <tr>
            <th>Titre</th>
            <th>Réalisateur</th>
            <th>Pays</th>
            <th>Genre</th>
            <th>Durée</th>
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
      <xsl:apply-templates select="Titre"/>
      <xsl:apply-templates select="Realisateur" />
      <xsl:apply-templates select="Pays" />
      <xsl:apply-templates select="Genre" />
      <xsl:apply-templates select="Duree" />
      </tr>
    </xsl:template>

    <xsl:template match="Titre">
      <td><b><xsl:value-of select="." /></b></td>
      <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="Realisateur[1]">
      <td><xsl:value-of select="Nom" /></td>
      <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="Pays">
      <td><xsl:value-of select="." /></td>
      <xsl:apply-templates />
    </xsl:template>
    
    <xsl:template match="Genre">
      <td><xsl:value-of select="." /></td>
      <xsl:apply-templates />
    </xsl:template>
    
    <xsl:template match="Duree">
      <td><xsl:value-of select="." /></td>
      <xsl:apply-templates />
    </xsl:template>

    <xsl:output method="html" version="5.0" encoding="UTF-8" />
  </xsl:stylesheet>