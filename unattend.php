<?php

	include "db_connect.php";

	$eventid = $_POST['eventid'];
	$userid = $_POST['userid'];

	//delete from attending table
	$query_unattend = "DELETE FROM attending WHERE eventID = '$eventid' AND userID = '$userid'";

	if (!mysql_query($query_unattend)) {
	    echo "Error: " . mysql_error();
	}

	include "db_disconnect.php";

	header("Location: index.php");
?>