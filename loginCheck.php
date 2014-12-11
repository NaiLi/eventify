<?php

	include "db_connect.php";

	session_start();

	$usr = $_POST['usr'];
	$pwd = $_POST['pwd'];

	$query = "SELECT * FROM user WHERE firstname = '$usr' AND pwd = '$pwd'";

	$result = mysql_query($query);

	// Login successful
	if(mysql_num_rows($result) != 0) {
		$user = mysql_fetch_assoc($result);
		$_SESSION['loggedin'] = true;
		$_SESSION['user'] = $user['firstname'];
		$_SESSION['userid'] = $user['userID'];
		$_SESSION['authority'] = $user['authority'];
		include "db_disconnect.php";
		header("Location: index.php");
	} else {
		include "db_disconnect.php";
		header("Location: index.php?login_status_message=wrongCredentials");
	}	

?>