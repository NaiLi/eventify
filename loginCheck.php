<?php

	include "db_connect.php";

	session_start();

	$usr = $_POST['usr'];
	$pwd = $_POST['pwd'];

	$query = "SELECT * FROM user WHERE firstname = '$usr' AND pwd = '$pwd'";

	$user = mysql_query($user);

	// Login successful
	if(mysql_num_rows($user) != 0) {
		$_SESSION['loggedin'] = true;
		$_SESSION['user'] = "$usr";
		$_SESSION['userid'] = "$usr[userID]";
	}

	include "db_disconnect.php";

	header("Location: index.php?login_status_message=wrongCredentials");	

?>