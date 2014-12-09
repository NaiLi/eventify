<?php
	mysql_connect("localhost:8889", "root", "root")
	//mysql_connect("localhost", "root", "")
		or die("Could not connect");
	mysql_select_db("eventify")
		or die("Could not connect to database");
?>