<?php

	mysql_connect("localhost", "root", "")
		or die("Could not connect");

	mysql_select_db("eventify");

	$category_query = "SELECT * FROM category";
	$categories = mysql_query($category_query);
	
	$query = "INSERT INTO event (title, category, min_attend, max_attend, event_date, description)
	VALUES ('$_POST[title]', '$_POST[category]', '$_POST[min_attend]', '$_POST[max_attend]', '$_POST[event_date]', '$_POST[description]')";

	$result = mysql_query($query);

    if ($result) {
    	echo "Your event has been added!";
    } else {
    	echo mysql_error();
    }

	mysql_close();

	header("Location: index.php");
	die();	
	
?>