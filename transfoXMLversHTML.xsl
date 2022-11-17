<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

	<xsl:strip-space elements="*" />

	<xsl:template match="DMJJR">

		<xsl:result-document href="ARTICLES/articles.json" method="text">
			<xsl:text>[ </xsl:text>
			<xsl:for-each select="descendant::ARTICLE[@RELU='OUI']">
				<xsl:sort select="./@id" lang="FR" />
				<xsl:text>"</xsl:text>
				<xsl:value-of select="./@id" />
				<xsl:text>", </xsl:text>
				<!--<xsl:if test="exists(./@id2)">
					<xsl:text>"</xsl:text>
					<xsl:value-of select="./@id2" />
					<xsl:text>", </xsl:text>
				</xsl:if>
				<xsl:if test="exists(./@id3)">
					<xsl:text>"</xsl:text>
					<xsl:value-of select="./@id3" />
					<xsl:text>", </xsl:text>
				</xsl:if>
				<xsl:text></xsl:text>-->
			</xsl:for-each>
			<xsl:text>""]</xsl:text>
		</xsl:result-document>

		<xsl:result-document href="ARTICLES/404.html">
			<html>
				<head>
					<title>DMJJR</title>
					<meta lang="fr" />
					<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
					<meta name="viewport" content="width=device-width, initial-scale=1.0" />
					<link rel="manifest" href="/DOC/manifest.webmanifest"></link>
					<link rel="stylesheet" type="text/css" href="../DOC/DECO.css" />

				</head>
				<body>
					<div id="ARTICLE">
					<div class="CDI">
						<p class="ITEMSEUL">ARTICLE NON TROUVÉ</p>
						<p class="U_GRAMMAIRE">
							(
							<span class="GRAM">s. m.</span>
							)
						</p>
					</div>
					<div class="CDT">
						<div class="DEFINITION">
							<p>Malheureusement, cet article est bien dans le Dictionnaire de Musique de Rousseau mais il n'est pas dans cet échantillion.</p>
						</div>
					</div>
					</div>

					<xsl:call-template name="buttons"/>
				</body>
			</html>
		</xsl:result-document>



		<xsl:result-document href="home.html">
			<html>
				<head>
					<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
					<title>DMJJR</title>
					<meta lang="fr"/>
					<meta name="theme-color" content="#ADA685"/>
					<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
					<link rel="manifest" href="/manifest.webmanifest"/>
					<script type="text/javascript" src="/DOC/function.js"></script>
					<link rel="apple-touch-icon" href="/DOC/rsz_logo_car.png"/>
					<link rel="stylesheet" type="text/css" href="/DOC/DECO.css"/>
					<script>
						  if (navigator.serviceWorker) {
						  navigator.serviceWorker.register('/service_worker1.js').then(function(registration) {
							 console.log('ServiceWorker registration successful with scope:',  registration.scope);
						  }).catch(function(error) {
							 console.log('ServiceWorker registration failed:', error);
						  });
						}
					</script>
				</head>
				<body>
					<div id="ARTICLE">
					<div class="CDI">
						<p class="ITEMSEUL">home</p>
						<p class="U_GRAMMAIRE">
							(
							<span class="GRAM">s. m.</span>
							)
						</p>
					</div>
					<div class="CDT">
						<div class="DEFINITION">
							<p>
								Page Principale.
							</p>
						</div>
					</div>
				</div>
					<xsl:call-template name="buttons"/>
				</body>
			</html>
		</xsl:result-document>


		<xsl:apply-templates>
			<xsl:sort select="/ARTICLE/@id" lang="FR" />
		</xsl:apply-templates>
	</xsl:template>

	<xsl:template name="buttons">

		<div id="buttons">
			<button onclick="Menu('{@id}')">A-Z</button>
			<button onclick="location.href='../home.html'">Home</button>
			<button onclick="recherche()">Q</button>
		</div>
	</xsl:template>

	<xsl:template match="ARTICLE">
		<xsl:if test="@RELU = 'OUI'">
			<xsl:result-document href="{concat('ARTICLES/', @id, '.html')}">
				<html>
					<head>
						<meta lang="fr" />
						<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
						<title>DMJJR</title>
						<meta name="viewport" content="width=device-width, initial-scale=1.0" />
						<link rel="stylesheet" type="text/css" href="../DOC/DECO.css" />
						<script type="text/javascript" src="../DOC/function.js"></script>
						<link rel="manifest" href="../DOC/manifest.webmanifest"></link>

					</head>
					<body>
						<div id="ARTICLE">
							<xsl:apply-templates />
							<div class="footer">
								<img src="../DOC/LOGO_Car.png" class="Img_Car"></img>

								<xsl:comment>href="mailto:pierretonnelier96@gmail.com"</xsl:comment>
								<a>pour me contacter :)</a>
							</div>
							<xsl:call-template name="buttons"/>
						</div>
					</body>
				</html>
			</xsl:result-document>
		</xsl:if>
	</xsl:template>


	<xsl:template match="CDT">
		<div class="CDT">
			<xsl:apply-templates />
		</div>
	</xsl:template>

	<xsl:template match="CDI">
		<div class="CDI">
			<xsl:apply-templates />
		</div>
	</xsl:template>

	<xsl:template match="CDI/ITEM">
		<p class="ITEMSEUL">
			<xsl:apply-templates />
		</p>
	</xsl:template>


	<xsl:template match="ITEMS/ITEM">

		<xsl:choose>
			<xsl:when test="preceding-sibling::ITEM and following-sibling::ITEM">
				<!-- suivant et précédant-->
				<span class="separateurItem">
					<xsl:text>, </xsl:text>
				</span>
			</xsl:when>
			<xsl:when test=" preceding-sibling::ITEM and not(following-sibling::ITEM)">
				<!-- antéposé et non suivit -->
				<span class="separateurItem">
					<xsl:text>, ou alors </xsl:text>
				</span>
			</xsl:when>
			<xsl:when test="not(preceding-sibling::ITEM)" /> <!-- ni l'un ni l'autre -->
		</xsl:choose>

		<span class="ITEM">
			<xsl:apply-templates />
		</span>
	</xsl:template>

	<xsl:template match="ITEMS">
		<p class="ITEMS">
			<xsl:apply-templates />
		</p>
	</xsl:template>

	<xsl:template match="U_GRAMMAIRE">
		<p class="U_GRAMMAIRE">
			<xsl:text> (</xsl:text>
			<xsl:apply-templates />
			<xsl:text>)</xsl:text>
		</p>
	</xsl:template>

	<xsl:template match="U_GRAMMAIRE/texte">
		<span class="GRAM">
			<xsl:apply-templates />
		</span>
	</xsl:template>
	<xsl:template match="DEFINITION">
		<div class="DEFINITION">
			<xsl:apply-templates />
		</div>
	</xsl:template>
	<xsl:template match="p">
		<p>
			<xsl:apply-templates />
		</p>
	</xsl:template>

	<xsl:template match="p/RENVOI">
		<a>
			<xsl:choose>
				<xsl:when test="not(exists(@planche))">
					<xsl:choose>
						<xsl:when test="not(@cible = (../ARTICLE[@RELU = 'OUI']/@id) or (../ARTICLE[@RELU = 'OUI']/@id2) or (../ARTICLE[@RELU = 'OUI']/@id3))">
							<xsl:attribute name="class" select="'p_nonRENVOI'" />
							<xsl:attribute name="href" select="'404.html'" />
							<xsl:apply-templates />
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="class" select="RENVOI" />
							<xsl:attribute name="href" select="@cible" />
							<xsl:apply-templates />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:when test="exists(@planche)">
					<xsl:variable name="apos">
						<xsl:text>'</xsl:text>
					</xsl:variable>
					<xsl:attribute name="class">
						<xsl:text>p_planche</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="onclick" select="concat( 'planche(', $apos , @page, $apos, ',', $apos, @vignette, $apos, ')' )" />
					<xsl:apply-templates />
				</xsl:when>
			</xsl:choose>
		</a>
	</xsl:template>

	<xsl:template match="U_RENVOI">
		<span class="U_RENVOI">
			<xsl:text>(Voyez</xsl:text>
			<xsl:apply-templates />
			<xsl:text>.)</xsl:text>
		</span>
	</xsl:template>

	<xsl:template match="U_RENVOI/RENVOI">

		<!--<xsl:if test="not(@cible = '')">-->
		<xsl:choose>
			<xsl:when test="preceding-sibling::RENVOI and following-sibling::RENVOI">
				<xsl:text>, </xsl:text>
			</xsl:when>
			<xsl:when test="preceding-sibling::RENVOI and not(following-sibling::RENVOI)">
				<xsl:text> &amp; </xsl:text>
			</xsl:when>
			<xsl:when test="not(preceding-sibling::RENVOI)">
				<xsl:text> </xsl:text>
			</xsl:when>
		</xsl:choose>
		<a>
			<xsl:choose>
				<xsl:when test="not(exists(@planche))">
					<xsl:choose>
						<xsl:when test="not(@cible = (../ARTICLE[@RELU = 'OUI']/@id))">
							<xsl:attribute name="class">
								<xsl:text>nonRENVOI</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="href" select="'404.html'" />
							<xsl:apply-templates />
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="class">
								<xsl:text>RENVOI</xsl:text>
							</xsl:attribute>

							<xsl:attribute name="href" select="@cible" />
							<xsl:apply-templates />
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="class" select="planche" />
					<xsl:attribute name="onclick" select="concat('planche(', @page, ',', @vignette, ')')" />
					<xsl:apply-templates />
				</xsl:otherwise>
			</xsl:choose>
		</a>
	</xsl:template>

	<xsl:template match="TXTDisparaitre" />

	<xsl:template match="
	italic |
	ITEM_TRAITE |
	bold | 
	AUTRE">
		<span>
			<xsl:attribute name="class" select="local-name()" />
			<xsl:apply-templates />
		</span>

	</xsl:template>

	<xsl:template match="*">

		<span>
			<xsl:attribute name="class" select="local-name()" />
			<xsl:message terminate="no">
				<xsl:value-of select="./ancestor::ARTICLE/ITEM[1]" />
				<xsl:text>$$$</xsl:text>
				<xsl:value-of select="local-name()" />
				<xsl:text>$$$</xsl:text>
				<xsl:apply-templates />
				<xsl:text>--</xsl:text>
			</xsl:message>
			<xsl:apply-templates />
		</span>
	</xsl:template>


</xsl:stylesheet>