<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <!-- TOUJOURS commencer par un template racine auquel on 
   les templates definis  -->

  <!-- Premier traitement xsl simple,
   mettre les titres de films dans une liste -->
	<xsl:template match="/">
		<html>
			<head>
				<title>Premier fichier xsl concret</title>
			</head>
			<body>
				<h1>Liste des films</h1>
				<ul>
					<xsl:apply-templates select="FILMS/Film/Titre"/>
				</ul>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="Film/Titre">
		<li><xsl:value-of select="." /></li>
	</xsl:template> 


	<xsl:output method="html" version="5.0" encoding="UTF-8" />

</xsl:stylesheet>