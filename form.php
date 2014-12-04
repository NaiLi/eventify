<?php

	mysql_connect("localhost", "root", "")
		or die("Could not connect");

	mysql_select_db("eventify");

	$category_query = "SELECT * FROM category";
	$categories = mysql_query($category_query);
	
	if(isset($_POST['submit'])) {

		$query = "INSERT INTO event (title, category, min_attend, max_attend, event_date, description)
		VALUES ('$_POST[title]', '$_POST[category]', '$_POST[min_attend]', '$_POST[max_attend]', '$_POST[event_date]', '$_POST[description]')";

		$result = mysql_query($query);

	    if ($result) {
	    	echo "Your event has been added!";
	    } else {
	    	echo mysql_error();
	    }

		mysql_close();
	}	
	
?>

<form action="" method="POST">
Title: <input type="text" name="title">
<br><br>
Category:
<?php
	echo "<select name=category>";
	while($row = mysql_fetch_array($categories)) {
		echo "<option value=$row[name]>$row[name]</option>";
	}
	echo "</select>";
?>
<br><br>
Minimum attendings: <input type="number" min="1" name="min_attend">
<br><br>
Maximum attendings: <input type="number" min="1" name="max_attend">
<br><br>
Date: <input type="date" name="event_date">
<br><br>
Description: <input type="text" name="description">
<br><br>
<input type="submit" value="Add event" name="submit">
</form>