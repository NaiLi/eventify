<?php 

	mysql_connect("localhost:8889", "root", "root")
		or die("Could not connect");
	mysql_select_db("event");    

	$query = "SELECT * FROM event";

	echo $query;

	$data = mysql_query($query);

	while($row = mysql_fetch_assoc($data)) {
  	foreach($row as $key => $value) {
  		echo "working";
    	echo "<$key>$value</$key>";
  	}
	}
	echo "done";
?>