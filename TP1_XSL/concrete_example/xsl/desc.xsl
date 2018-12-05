<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<html>
			<head>
                <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
				<title>CRITIQUES</title>
			</head>
			<body>
				<xsl:apply-templates select="FILMS/Film" />
			</body>
		</html>
	</xsl:template>

	<xsl:template match="Film">
        <div>
            <xsl:attribute name="id">
                <xsl:value-of select="@ID" />
            </xsl:attribute>
            <div style="font-size:30px;">
                <b><xsl:value-of select="Titre" /></b>
            </div>
            <div>
                <xsl:apply-templates select="Critique" />
            </div> 
        </div>
	</xsl:template> 

    <xsl:template match="Critique">
        <div>
            <div style="color:steelblue">
                <b><xsl:value-of select="Media" /></b>&#160;(<i><xsl:value-of select="Auteur" /></i>)
            </div>
            <div class="content">
                <xsl:value-of select="Texte" />
            </div>
        </div>
        <br/>
	</xsl:template> 

	<xsl:output method="html" version="5.0" encoding="UTF-8" />

</xsl:stylesheet>