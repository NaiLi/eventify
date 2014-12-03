<?php

	$eventid = $_POST['id'];
	$name = $_POST['name'];

	mysql_connect("localhost", "root", "root")
		or die("Could not connect");
	mysql_select_db("eventify");

	//TODO: check if user already exists

	//First, create user (not checking if it exists)
	$query_user = "INSERT INTO user (firstname, authority) VALUES ('$name', 2)";
	
	if (!mysql_query($query_user)) {
		echo "Error: " . mysql_error();
	}

	//Get the userID for the new user
	$userid = mysql_query("SELECT userID FROM user WHERE firstname = '$name'");
	$userid = mysql_fetch_array($userid)['userID'];

	//Then, connect the new user to the event
	$query_attend = "INSERT INTO attending (eventID, userID)
		VALUES ($eventid, $userid)";

	if (!mysql_query($query_attend)) {
	    echo "Error: " . mysql_error();
	}

	header("Location: index.php");
	die();
?>