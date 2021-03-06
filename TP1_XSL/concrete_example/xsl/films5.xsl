<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html" encoding="UTF-8" media-type="text/html"/>
  
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
        <th>Critique(<span style="color:red">Ils ont aimé</span>)</th>
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
      
      <td>
        <xsl:choose>
          <xsl:when test="count(Realisateur) &lt; 3">
            <xsl:apply-templates select="Realisateur" />
          </xsl:when>
          <xsl:otherwise>
            Film collectif
          </xsl:otherwise>
        </xsl:choose>
      </td>
     
			<td><xsl:value-of select="Pays" /></td>
			<td><xsl:value-of select="Genre" /></td>
			<td><xsl:value-of select="Duree" /></td>
      
      <td>
        <a>
          <xsl:attribute name="href">
            <xsl:value-of select="@Affiche" />
          </xsl:attribute>
          <img alt="img" style="max-height:100px">
              <xsl:attribute name="src">
                  <xsl:value-of select="@Affiche" />
              </xsl:attribute>  
          </img>
        </a>
      </td>

      <td>
        <xsl:apply-templates select="Critique" />
        <a style="display:block;text-align:right">
          <xsl:attribute name="href">
            ./desc.html#<xsl:value-of select="@ID"/>
          </xsl:attribute>
          Lire la critique
        </a>
      </td>
		</tr>
	</xsl:template>

  <xsl:template match="Critique">
    <xsl:if test="Note &gt; 0">
      <span style="color:red"><xsl:value-of select="Media" /></span><br />
    </xsl:if>
  </xsl:template>

  <xsl:template match="FILMS/Film/Realisateur">
    <b><xsl:value-of select="Nom" /></b>&#160;<xsl:value-of select="Prenom" /><br />
  </xsl:template>

</xsl:stylesheet>