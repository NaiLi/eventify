<?php

	session_start();

	unset($_SESSION['user']);
	unset($_SESSION['userid']);
	unset($_SESSION['authority']);
	unset($_SESSION['loggedin']);
	header("Location: index.php");

?>