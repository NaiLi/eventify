<?php

	include "db_connect.php";

	if($_GET['eventID']) {
		$eventID = $_GET['eventID'];
		$query = "UPDATE event
    	SET title = '$_POST[title]', category = '$_POST[chosen_category]', min_attend = '$_POST[min_attend]', max_attend = '$_POST[max_attend]', event_date = '$_POST[event_date]', description = '$_POST[description]'
    	WHERE eventID = '$eventID'";
	} else {
		$query = "INSERT INTO event (title, category, min_attend, max_attend, event_date, description, creatorID)
		VALUES ('$_POST[title]', '$_POST[chosen_category]', '$_POST[min_attend]', '$_POST[max_attend]', '$_POST[event_date]', '$_POST[description]', '$_POST[userid]')";
	}
	
    if (!mysql_query($query)) {
    	echo mysql_error();
    }

    include "db_disconnect.php";

	header("Location: index.php");
?>