<?php

	$action = $_GET['action'];

	header("Content-type:text/xml;charset=utf-8");

	$xml_text = 
	"<?xml version='1.0' encoding='UTF-8'?> 
	<?xml-stylesheet type='text/xsl' href='eventForm.xsl'?>
	<form>";

	mysql_connect("localhost", "root", "")
		or die("Could not connect");

	mysql_select_db("eventify");

	$xml_text .= "<action>" . $action . "</action>";

	// check if action is update --> get event data from DB
	if($action == 'update') {
		$eventID = $_GET['eventID'];

		$result = mysql_query("SELECT * FROM event WHERE eventID = '$eventID'");
		while($row = mysql_fetch_assoc($result)) {

			$xml_text .= "<event>";

		  	foreach($row as $key => $value) {
		    	$xml_text .= "<$key>$value</$key>\r\n";
		  	}

		  	$xml_text .= "</event>";

		}

	}

    $xml_text .= "</form>";
	print utf8_encode($xml_text);

	mysql_close();

?>