<?php
	include("prefix.php");
	include("db_connect.php");
?>

<events>

<?php

	header("Content-type:text/xml;charset=utf-8");

	$query = "SELECT * FROM event WHERE event_date >= CURDATE() ORDER BY event_date ASC";

	$data = mysql_query($query);
	if(!$data) { echo "No data found\n";}

	$xml_text = "";

	if(isset($_GET['login_status_message'])) {
		if($_GET['login_status_message'] == "wrongCredentials") {
			$xml_text .= "<login_status_message>wrongCredentials</login_status_message>";
		}
	}

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
	
	while($row = mysql_fetch_assoc($data)) {
		$xml_text .= "<event>";

	  	foreach($row as $key => $value) {
	    	$xml_text .= "<$key>$value</$key>\r\n";
	  	}
		$event_query = "SELECT userID FROM attending WHERE eventID = '$row[eventID]'";
		$result2 = mysql_query($event_query);

		if(mysql_num_rows($result2) != 0) {
			$xml_text .= "<attending>";
			while($row = mysql_fetch_assoc($result2)) {
				$xml_text .= "<user><id>" . $row['userID'] . "</id></user>";

				if($_SESSION['loggedin']==true && $_SESSION['user']!="") {
					if($row['userID'] == $_SESSION['userid']) {
						$iamin = "true";
					} else {
						$iamin = "false";
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