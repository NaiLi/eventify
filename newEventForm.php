<?php 

	header("Content-type:text/xml;charset=utf-8");
	mysql_connect("localhost", "root", "root")
		or die("Could not connect");
	mysql_select_db("eventify");
?>
	<form action='attend.php' method='POST'>
	<input type='hidden' name='id' value='name'/>
	<input type='text' name='name'/>
	<input type='submit' value='Jag vill me'!'/></form>"

