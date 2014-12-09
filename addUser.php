<?php

	include "db_connect.php";

	session_start();

	$firstname = $_POST['firstname'];
	$lastname = $_POST['lastname'];
	$pwd = $_POST['pwd'];

	$query = "INSERT INTO user (firstname,lastname,pwd)
	VALUES ('$firstname','$lastname','$pwd')";

	if(!mysql_query($query)) {
		echo mysql_error();
	}

	$_SESSION['loggedin'] = true;
	$_SESSION['user'] = "$firstname";

	include "db_disconnect.php";

	header("Location: index.php");

?>