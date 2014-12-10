<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">
	<xsl:output indent="yes" method="xml"/>

	<xsl:template match="events">
		<html>
			<head>
				<link rel="stylesheet" href="style_desktop.css"/>
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

		  	<div id="header">
		  		<h1>Eventify</h1>
		  		<xsl:if test="user">
						<form id="logout" action="logout.php" method="POST">
							<input type="submit" value="Logout"/>
							</form>
					</xsl:if>
		  	</div>

		  	<div id="container">

		  		<div id="start">

		  			<xsl:choose>
			  		<xsl:when test="user">
							<p>
								Tjena, <xsl:value-of select="user/username"/>!<br/>
								Kul att se dig igen, hoppas du hittar några kul event som passar dig!
							</p>
						</xsl:when>
						<xsl:otherwise>
							<p>
								Hej du glade tjomme! Du har kommit till Eventify, sidan för dig som vill hänga mer, hänga med fler men inte vill lägga ner all din tid på det. 
								Här kan du enkelt anmäla dig till små evenemang och ha mer kul i vardagen!
							</p>
							<p>Logga in direkt och kom igång!</p>
							<p>
								/Eventify teamet
							</p>
						</xsl:otherwise>
						</xsl:choose>
					</div>

					<div id="listtitle">
						<div class="left">
					  		<h1>Upcoming events</h1>
						</div>
					</div>

			  	<div class="right">
			  		<xsl:choose>
				  		<!-- User is logged in -->
				  		<xsl:when test="user">
						  	<form class="eventForm" action="addOrUpdateEvent.php" method="POST">
							  	<fieldset>
							  		<legend>Nytt event</legend>
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
							</xsl:when>

							<!-- User is NOT logged in -->
							<xsl:otherwise>
								<xsl:if test="login_status_message">
									<br/>Error when logging in, try again!
								</xsl:if>

								<div id="loginForm">
									<br/>Login...
									<br/><br/>
									<form method="post" action="loginCheck.php">
										<input type="text" name= "usr" placeholder="Username"/>
										<br/><br/>
										<input type="password" name= "pwd" placeholder="Password"/>
										<input type="submit" name="submit" value="Login"/>
									</form>
									<br/><br/>

									... or sign up!
								<br/><br/>
									<form method="post" action="addUser.php">
										<input type="text" name= "firstname" placeholder="First name"/>
										<br/><br/>
										<input type="text" name= "lastname" placeholder="Last name"/>
										<br/><br/>
										<input type="password" name= "pwd" placeholder="Password?"/>
										<input type="submit" name="submit" value="Sign up"/>
									</form>
								</div>
							</xsl:otherwise>


			  		</xsl:choose>
		  		</div>
			  	<div class="left">
			  		<div id="eventList">
			  			<xsl:apply-templates/>
			  		</div>
		  		</div>

		  	</div> <!-- end container -->

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
								<input type="submit" value="Jag vill va' me'!" class="custom_button"/>
						</form>
					</xsl:when>
					<xsl:otherwise>
						<form action="attend.php" method="POST">
							<input type="hidden" name="eventid" value="{eventID}"/>
							<input type="hidden" name="userid" value="{../user/userid}"/>
								<input type="submit" value="Jag kan inte längre :(!" class="custom_button"/>
						</form>						
					</xsl:otherwise>	
				</xsl:choose>	

				<xsl:if test="creatorID &#61; ../user/userid">
					<form action="eventForm.php?action=update&amp;eventID={eventID}" method="POST">
						<input type="submit" value="Uppdatera event" class="custom_button"/>
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
			<xsl:apply-templates/>
		</p>
	</xsl:template>

	<xsl:template match="spotsleft">
		<p class="spots">
			<xsl:value-of select="."/> / 
			<xsl:value-of select="../max_attend"/> platser kvar
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
	<xsl:template match="min_attend"/>
</xsl:stylesheet>