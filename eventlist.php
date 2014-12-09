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
		$xml_text .= "<user><username>" . $_SESSION['user'] . "</username><userid>" . $_SESSION['userid'] . "</userid></user>";
	}	

	while($row = mysql_fetch_assoc($data)) {
		$xml_text .= "<event>";

  	foreach($row as $key => $value) {
    	$xml_text .= "<$key>$value</$key>\r\n";
  	}
  	$xml_text .= "</event>";
  }

	print utf8_encode($xml_text);
?>

</events>

<?php
	include("db_disconnect.php");
	include("postfix.php");
?>