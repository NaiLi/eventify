<?php

	include "db_connect.php";

	session_start();

	$usr = $_POST['usr'];
	$pwd = $_POST['pwd'];

	$query = "SELECT * FROM user WHERE firstname = '$usr' AND pwd = '$pwd'";

	// Login successful
	if(mysql_num_rows(mysql_query($query)) != 0) {
		$_SESSION['loggedin'] = true;
		$_SESSION['user'] = "$usr";
	}

	header("Location: index.php?login_status_message=wrongCredentials");	

?>