<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:php="http://php.net/xsl">
  <xsl:output method="xml" doctype-public="-//OPENWAVE//DTD XHTML Mobile 1.0//EN" doctype-system="http://www.wapforum.org/DTD/wml_1.1.xml" indent="yes" media-type="text/vnd.wap.wml"/>

	<xsl:template match="events">
		<html>
			<head>
				<meta content='width=700'/>
				<link rel="stylesheet" href="style_mobile.css"/>
				<script type="text/javascript">
					function showform(){
						if(document.getElementById("eventForm").style.display != "inline") {
							document.getElementById("eventForm").style.display = "inline";
							document.getElementById("showaddevent").innerHTML = "Dölj ↑";
						} else {
							document.getElementById("eventForm").style.display = "none";
							document.getElementById("showaddevent").innerHTML = "Lägg till nytt event ↓";
						}						
					}
				</script>
				<title>
					EVENTIFY
				</title>
			</head>

		  <body>
		  	<h1>EVENTIFY</h1>
		  	<xsl:choose>
		  		<!-- User is logged in -->
		  		<xsl:when test="user">
					<p>
						Welcome, <xsl:value-of select="user/username"/>!<br/>
						<form action="logout.php" method="POST">
							<input type="submit" value="Logout"/>
						</form>
					</p>

					<button type="button" id="showaddevent" onclick="showform()">
						Lägg till nytt event ↓
					</button>

				  	<form id="eventForm" action="addOrUpdateEvent.php" method="POST" style="display:none">
					  	<fieldset>
					  		<legend>Lägg till event</legend>
							<label>Rubrik:</label>
							<br/>
							<input type="text" name="title" class="input_text"/>
							<br/>
							<label>Kategori:</label>
							<br/>
							<select name="chosen_category">
								<xsl:for-each select="categories/categoryname">
									<option value="."><xsl:value-of select="."/></option>
								</xsl:for-each>
							</select>
							<br/>
							<label>Min antal:</label>
							<br/>
							<input type="number" min="1" name="min_attend" class="input_text"/>
							<br/>
							<label>Max antal:</label>
							<br/>
							<input type="number" min="1" name="max_attend" class="input_text"/>
							<br/>
							<label>Datum:</label>
							<br/>
							<input type="date" name="event_date" class="input_text"/>
							<br/>
							<label>Beskrivning:</label>
							<br/>
							<input type="text" name="description" class="input_text"/>
							<br/>
							<input type="hidden" name="userid" value="{user/userid}"/>
							<input type="submit" value="Lägg till" name="submit" class="custom_button"/>
						</fieldset>
					</form>
				</xsl:when>

				<!-- User is NOT logged in -->
				<xsl:otherwise>
					<div class="loginbox">
						<xsl:if test="login_status_message">
							<br/>Error when logging in, try again!
						</xsl:if>
						<br/>Login...
						<form method="post" action="loginCheck.php">
							<input type="text" name= "usr" placeholder="Username"/><br/>
							<input type="password" name= "pwd" placeholder="Password"/><br/>
							<input type="submit" name="submit" value="Login"/>
						</form>

						... or sign up!

						<form method="post" action="addUser.php">
							<input type="text" name= "firstname" placeholder="First name"/><br/>
							<input type="text" name= "lastname" placeholder="Last name"/><br/>
							<input type="password" name= "pwd" placeholder="Password?"/><br/>
							<input type="submit" name="submit" value="Sign up"/>
						</form>
					</div>
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

			<xsl:if test="../user">
				<xsl:choose>
					<xsl:when test="loginattended &#61; 'true'">
						<form action="unattend.php" method="POST">
							<input type="hidden" name="eventid" value="{eventID}"/>
							<input type="hidden" name="userid" value="{../user/userid}"/>
								<input type="submit" value="Utebli"/>
						</form>
					</xsl:when>
					<xsl:otherwise>
						<form action="attend.php" method="POST">
							<input type="hidden" name="eventid" value="{eventID}"/>
							<input type="hidden" name="userid" value="{../user/userid}"/>
								<input type="submit" value="Delta"/>
						</form>						
					</xsl:otherwise>	
				</xsl:choose>	

				<xsl:if test="creatorID &#61; ../user/userid">
					<form action="eventForm.php?action=update&amp;eventID={eventID}" method="POST">
						<input type="submit" value="Uppdatera event"/>
					</form>
				</xsl:if>

			</xsl:if>
		</div>
	</xsl:template>

	<xsl:template match="title">
		<h2>
			<xsl:apply-templates/>
		</h2>
	</xsl:template>

	<xsl:template match="category">
		<p>
			Kategori: <xsl:apply-templates/>
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
	<xsl:template match="loginattended"/>
	<xsl:template match="creatorID"/>	
	<xsl:template match="categories"/>
</xsl:stylesheet>
