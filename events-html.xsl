<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:php="http://php.net/xsl">
 <xsl:output indent="yes" method="html"/>

	<xsl:template match="events">
		<html>
			<head>
				<title>
					EVENTIFY
				</title>
				<link rel="stylesheet" href="style.css"/>
				<script src="script.js"></script>
			</head>

		  <body>
			<form action="eventForm.php?action=add" method="POST">
			<input type="submit" value="Lägg till event"/>
			</form>
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
			<form action="eventForm.php?action=update&amp;eventID={../eventID}" method="POST">
			<input type="submit" value="Uppdatera event"/>
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









