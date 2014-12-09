<?php

	include "db_connect.php";

	$eventid = $_POST['eventid'];
	$userid = $_POST['userid'];

	//insert into attending table
	$query_attend = "INSERT INTO attending (eventID, userID)
		VALUES ($eventid, $userid)";

	if (!mysql_query($query_attend)) {
	    echo "Error: " . mysql_error();
	}

	header("Location: index.php");
	die();
?>