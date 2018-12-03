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
      <table>
        <tr>
          <th>N°</th>
          <th>Titre</th>
          <th>Réalisateur</th>
          <th>Pays</th>
          <th>Genre</th>
          <th>Durée</th>
        </tr>
      </table>
    </body>
    </html>
  </xsl:template>

  <xsl:template match="node()">
    <xsl:apply-templates  />
  </xsl:template>

  <xsl:template match="Film/Titre">
    <li><xsl:value-of select="." /></li>
  </xsl:template>


  <xsl:output method="html" version="5.0" encoding="UTF-8" />
</xsl:stylesheet>