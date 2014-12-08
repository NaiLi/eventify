<?php

	session_start();

	$firstname = $_POST['firstname'];
	$lastname = $_POST['lastname'];
	$pwd = $_POST['pwd'];

	mysql_connect("localhost", "root", "")
		or die("Could not connect");

	mysql_select_db("eventify");

	$query = "INSERT INTO user (firstname,lastname,pwd)
	VALUES ('$firstname','$lastname','$pwd')";

	if(!mysql_query($query)) {
		echo mysql_error();
	}

	$_SESSION['loggedin'] = true;
	$_SESSION['user'] = "$firstname";
	header("Location: index.php");

?>