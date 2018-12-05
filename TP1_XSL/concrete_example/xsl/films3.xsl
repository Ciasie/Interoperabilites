<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<html>
		<head>
			<title>xml et xsl pour films : version tableau et templates</title>
		</head>
		<body>
			<h1>Liste des <xsl:value-of select="count(FILMS/Film)"/> films de ma base</h1>
			<table border="1">
			<tr>
        <th>N°</th>
				<th>Titre</th>
				<th>Réalisateur</th>
				<th>Pays</th>
				<th>Genre</th>
				<th>Durée</th>
        <th>Affiche</th>
			</tr>
			<xsl:apply-templates select="FILMS/Film"/>
			</table>
		</body>
		</html>
	</xsl:template>

	<xsl:template match="FILMS/Film">
		<tr>
      <td><xsl:value-of select="position()" /></td>
			<td><b><xsl:value-of select="Titre" /></b></td>

      <td><xsl:apply-templates select="Realisateur" /></td>
			<td><xsl:value-of select="Pays" /></td>
			<td><xsl:value-of select="Genre" /></td>
			<td><xsl:value-of select="Duree" /></td>
      
      <td>
        <img style="max-height:100px">
            <xsl:attribute name="src">
                <xsl:value-of select="@Affiche" />
            </xsl:attribute>  
        </img>
      </td>
		</tr>
	</xsl:template>

  <xsl:template match="FILMS/Film/Realisateur">
    <b><xsl:value-of select="Nom" /></b>&#160;<xsl:value-of select="Prenom" /><br />
  </xsl:template>

	<xsl:output method="html" version="5.0" encoding="UTF-8" />
</xsl:stylesheet>