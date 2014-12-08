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
			<link rel="stylesheet" href="style.css"/>
		</head>

		<body>

			<!-- Form for updating event -->
			<xsl:if test="action &#61; 'update'">
		   		<form id="eventForm" action="handleEvent.php?eventID={event/eventID}" method="POST">
				  	<fieldset>
				  		<legend>Update event</legend>
						<label>Title:</label><input type="text" id="eventTitle" name="title" class="input_text" value="{event/title}"/>
						<br/><br/>
						<label>Category:</label> <input type="text" name="category" class="input_text" value="{event/category}"/>
						<br/><br/>
						<label>Minimum attendings:</label> <input type="number" min="1" name="min_attend" class="input_text" value="{event/min_attend}"/>
						<br/><br/>
						<label>Maximum attendings:</label> <input type="number" min="1" name="max_attend" class="input_text" value="{event/max_attend}"/>
						<br/><br/>
						<label>Date:</label> <input type="date" name="event_date" class="input_text" value="{event/event_date}"/>
						<br/><br/>
						<label>Description:</label> <input type="text" name="description" class="input_text" value="{event/description}"/>
						<br/><br/>
						<input type="submit" value="Update event" name="submit" class="custom_button"/>
					</fieldset>
				</form>
			</xsl:if>

			<!-- Form for adding event -->
			<xsl:if test="action &#61; 'add'">
		   		<form id="eventForm" action="handleEvent.php" method="POST">
				  	<fieldset>
				  		<legend>Add event</legend>
						<label>Title:</label><input type="text" id="eventTitle" name="title" class="input_text"/>
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
			</xsl:if>

	   	</body>
   	</html>
   </xsl:template>

</xsl:stylesheet>









