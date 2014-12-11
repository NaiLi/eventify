<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:php="http://php.net/xsl">

   <xsl:template match="form">
   	<html>
   		<head>
			<title>
				EVENTIFY
			</title>
			<link rel="stylesheet" href="style_desktop.css"/>
			<script type="text/javascript">
				function cancelForm(){
				}
			</script>
		</head>

		<body>

			<!-- Form for updating event -->
			<xsl:if test="action &#61; 'update'">
		   		<form class="eventForm" action="addOrUpdateEvent.php?eventID={event/eventID}" method="POST">
				  	<fieldset>
				  		<legend>Uppdatera event</legend>
						<label>Titel:</label><input type="text" id="eventTitle" name="title" class="input_text" value="{event/title}"/>
						<br/><br/>
						<label>Kategori:</label> <input type="text" name="category" class="input_text" value="{event/category}"/>
						<br/><br/>
						<label>Min antal:</label> <input type="number" min="1" name="min_attend" class="input_text" value="{event/min_attend}"/>
						<br/><br/>
						<label>Max antal:</label> <input type="number" min="1" name="max_attend" class="input_text" value="{event/max_attend}"/>
						<br/><br/>
						<label>Datum:</label> <input type="date" name="event_date" class="input_text" value="{event/event_date}"/>
						<br/><br/>
						<label>Beskrivning:</label> <input type="text" name="description" class="input_text" value="{event/description}"/>
						<br/><br/>
						<input type="submit" value="Uppdatera" name="submit" class="custom_button"/>
						<input class="custom_button" type="button" onclick="cancelForm()" value="Cancel" />
					</fieldset>
				</form>

			</xsl:if>

	   	</body>
   	</html>
   </xsl:template>

</xsl:stylesheet>









