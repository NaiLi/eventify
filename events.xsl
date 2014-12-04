<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:php="http://php.net/xsl">

	<xsl:template match="events">
		<html>
			<head>
				<title>
					Eventify
				</title>
				<link rel="stylesheet" href="style.css"/>
			</head>

		  <body>
		  	<h1>Upcoming events</h1>
		  	<div class="event_list">
		  		<xsl:apply-templates/>
	  		</div>
		  </body>
		</html>
	</xsl:template>

	<xsl:template match="event">
			<div class="one_event">
				<xsl:apply-templates/>
			</div>
	</xsl:template>

	<xsl:template match="title">
		<h2>
			<xsl:apply-templates/>
			<form action="attend.php" method="POST">
			<input type="hidden" name="id" value="{../eventID}"/>
			<input type="text" name="name"/>
			<input type="submit" value="Jag vill me'!"/>
			</form>
		</h2>
	</xsl:template>

	<xsl:template match="category">
		<p>
			<xsl:apply-templates/>
		</p>
	</xsl:template>

	<xsl:template match="min_attend">
		<p class="spots">
			<xsl:value-of select="."/> - 
			<xsl:value-of select="../max_attend"/>
		</p>
	</xsl:template>

		<xsl:template match="date">
		<p>
			<xsl:apply-templates/>
		</p>
	</xsl:template>

	<xsl:template match="description">
		<p>
			<xsl:apply-templates/>
		</p>
	</xsl:template>

	<xsl:template match="eventID"/>
	<xsl:template match="max_attend"/>
</xsl:stylesheet>









