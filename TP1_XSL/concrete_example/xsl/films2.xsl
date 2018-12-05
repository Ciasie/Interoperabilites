<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<html>
		<head>
			<title>xml et xsl pour films : version tableau</title>
		</head>
		<body>
			<h1>Liste des films de ma base</h1>
			<table border="1">
			<tr>
				<th>Titre</th>
				<th>Réalisateur</th>
				<th>Pays</th>
				<th>Genre</th>
				<th>Durée</th>
			</tr>
			<xsl:apply-templates select="FILMS/Film"/>
			</table>
		</body>
		</html>
	</xsl:template>

	<xsl:template match="FILMS/Film">
		<tr>
			<td><b><xsl:value-of select="Titre" /></b></td>
			<td><xsl:value-of select="Realisateur/Nom" /></td>
			<td><xsl:value-of select="Pays" /></td>
			<td><xsl:value-of select="Genre" /></td>
			<td><xsl:value-of select="Duree" /></td>
		</tr>
	</xsl:template>

	<xsl:output method="html" version="5.0" encoding="UTF-8" />
</xsl:stylesheet>