<?php
	include("prefix.php");
	include("db_connect.php");
?>

<events>

<?php

	$xml_text = "";

	$query = "SELECT * FROM event WHERE event_date >= CURDATE() ORDER BY event_date ASC";

	$data = mysql_query($query);
	if(!$data) { echo "No data found\n";}

	$query = "SELECT * FROM category";

	$categories = mysql_query($query);

	$xml_text .= "<categories>";
		while($row = mysql_fetch_assoc($categories)) {
			$xml_text .= "<categoryname>$row[name]</categoryname>";
		}
	$xml_text .= "</categories>";

	if(isset($_GET['login_status_message'])) {
		if($_GET['login_status_message'] == "wrongCredentials") {
			$xml_text .= "<login_status_message>wrongCredentials</login_status_message>";
		}
	}

	if(isset($_SESSION['loggedin'])) {
		if($_SESSION['loggedin']==true && $_SESSION['user']!="") {
			$user_query = "SELECT eventID FROM attending WHERE userID = '$_SESSION[userid]'";
			$result = mysql_query($user_query);

			$xml_text .= "<user><username>" . $_SESSION['user'] . "</username><userid>" . $_SESSION['userid'] . "</userid>";

			if(mysql_num_rows($result) != 0) {
				$xml_text .= "<attended>";
				while($row = mysql_fetch_assoc($result)) {
					$xml_text .= "<event><id>" . $row['eventID'] . "</id></event>";
				}
				$xml_text .= "</attended>";
			}

			$xml_text .= "</user>";	
		}
	}		
	
	while($row = mysql_fetch_assoc($data)) {
		$xml_text .= "<event>";
		$iamin = "false";

	  	foreach($row as $key => $value) {
	    	$xml_text .= "<$key>$value</$key>\r\n";
	  	}
		$event_query = "SELECT userID FROM attending WHERE eventID = '$row[eventID]'";
		$result2 = mysql_query($event_query);

		if(mysql_num_rows($result2) != 0) {
			$xml_text .= "<attending>";
			while($row = mysql_fetch_assoc($result2)) {
				$xml_text .= "<user><id>" . $row['userID'] . "</id></user>";

				if(isset($_SESSION['loggedin'])) {
					if($_SESSION['loggedin']==true && $_SESSION['user']!="") {
						if($row['userID'] == $_SESSION['userid']) {
							$iamin = "true";
						}
					}
				}				
			}
			$xml_text .= "</attending>";
		}
		$xml_text .= "<loginattended>$iamin</loginattended>";

	  	$xml_text .= "</event>";
  	}
	print utf8_encode($xml_text);
?>

</events>

<?php
	include("db_disconnect.php");
	include("postfix.php");
?>