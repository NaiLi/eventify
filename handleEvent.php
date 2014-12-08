<?php

	mysql_connect("localhost", "root", "")
		or die("Could not connect");

	mysql_select_db("eventify");

	if($_GET['eventID']) {
		$eventID = $_GET['eventID'];
		$query = "UPDATE event
    	SET title = '$_POST[title]', category = '$_POST[category]', min_attend = '$_POST[min_attend]', max_attend = '$_POST[max_attend]', event_date = '$_POST[event_date]', description = '$_POST[description]'
    	WHERE eventID = '$eventID'";
	} else {
		$query = "INSERT INTO event (title, category, min_attend, max_attend, event_date, description)
		VALUES ('$_POST[title]', '$_POST[category]', '$_POST[min_attend]', '$_POST[max_attend]', '$_POST[event_date]', '$_POST[description]')";
	}
	
    if (!mysql_query($query)) {
    	echo mysql_error();
    }

	mysql_close();

	header("Location: index.php");
	die();	
	
?>