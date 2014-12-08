<?php

	session_start();

	unset($_SESSION['usr']);
	$_SESSION['loggedin'] = false;
	header("Location: index.php");

?>