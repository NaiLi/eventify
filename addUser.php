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

	$query = "SELECT * FROM user WHERE firstname = '$usr' AND pwd = '$pwd'";
	$result = mysql_query($query);
	$user = mysql_fetch_assoc($result);
	
	$_SESSION['loggedin'] = true;
	$_SESSION['user'] = $user['firstname'];
	$_SESSION['userid'] = $user['userID'];

	include "db_disconnect.php";

	header("Location: index.php");

?>