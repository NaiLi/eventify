<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:php="http://php.net/xsl">
 <xsl:output method="xml" doctype-public="-//WAPFORUM//DTD WML 1.1//EN" doctype-system="http://www.wapforum.org/DTD/wml_1.1.xml" indent="yes" media-type="text/vnd.wap.wml"/>

	<xsl:template match="events">
		<html>
			<head>
				<link rel="stylesheet" href="style.css"/>
				<script type="text/javascript">
					function showform(){
						console.log("log");
						document.getElementById("eventForm").style.display = "inline";
						document.getElementById("showaddevent").style.display = "none";
					}
				</script>
				<title>
					EVENTIFY
				</title>
			</head>

		  <body>
		  	<h1>WML style sheet</h1>
		  	
		  	<xsl:choose>
		  		<!-- User is logged in -->
		  		<xsl:when test="user">
				  	<form id="eventForm" action="addOrUpdateEvent.php" method="POST" style="display:none">
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
							<input type="hidden" name="userid" value="{user/userid}"/>
							<input type="submit" value="Add event" name="submit" class="custom_button"/>
						</fieldset>
					</form>
					<button type="button" id="showaddevent" onclick="showform()">
						Lägg till event
					</button>

					<p>
						Welcome, <xsl:value-of select="user/username"/>!<br/>
						<form action="logout.php" method="POST">
							<input type="submit" value="Logout"/>
						</form>
					</p>
				</xsl:when>

				<!-- User is NOT logged in -->
				<xsl:otherwise>
					<xsl:if test="login_status_message">
						<br/>Error when logging in, try again!
					</xsl:if>
					<br/>Login...
					<form method="post" action="loginCheck.php">
						<input type="text" name= "usr" placeholder="Username"/>
						<input type="password" name= "pwd" placeholder="Password"/>
						<input type="submit" name="submit" value="Login"/>
					</form>

					... or sign up!

					<form method="post" action="addUser.php">
						<input type="text" name= "firstname" placeholder="First name"/>
						<input type="text" name= "lastname" placeholder="Last name"/>
						<input type="password" name= "pwd" placeholder="Password?"/>
						<input type="submit" name="submit" value="Sign up"/>
					</form>
				</xsl:otherwise>
		  	</xsl:choose>

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
			<xsl:if test="../../user">
				<form action="attend.php" method="POST">
				<input type="hidden" name="eventid" value="{../eventID}"/>
				<input type="hidden" name="userid" value="{../../user/userid}"/>
					<input type="submit" value="Jag heter {../../user/username} och vill va' me'!"/>
				</form>
			</xsl:if>
			<xsl:if test="../creatorID &#61; ../../user/userid">
				<form action="eventForm.php?action=update&amp;eventID={../eventID}" method="POST">
					<input type="submit" value="Uppdatera event"/>
				</form>
			</xsl:if>
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
	<xsl:template match="user"/>
	<xsl:template match="login_status_message"/>
</xsl:stylesheet>









