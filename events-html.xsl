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
		  	<form id="addevent" action="form.php" method="POST">
		  	<fieldset>
		  		<legend>Add event</legend>
				<label>Title:</label><input type="text" name="title" class="input_text"/>
				<br/><br/>
				<label>Category:</label> <input type="text" name="category" class="input_text"/>
				<br/><br/>
				<label>Minimum attendings:</label> <input type="number" min="1" name="min_attend" class="input_text"/>
				<br/><br/>
				<label>Maximum attendings:</label> <input type="number" min="1" name="max_attend" class="input_text"/>
				<br/><br/>
				<label>Date:</label> <input type="date" name="event_date" class="input_text"/>
				<br/><br/>
				<label>Description:</label> <input type="text" name="description" class="input_text"/>
				<br/><br/>
				<input type="submit" value="Add event" name="submit" class="custom_button"/>
			</fieldset>
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









