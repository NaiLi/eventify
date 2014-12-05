<?php 

	header("Content-type:text/xml;charset=utf-8");
	mysql_connect("localhost", "root", "")
		or die("Could not connect");
	mysql_select_db("eventify");    

	$query = "SELECT * FROM event";

	$data = mysql_query($query);
	if(!$data) { echo "No data found\n";}

	$xml_text = 
	"<?xml version='1.0' encoding='UTF-8'?> 
	<?xml-stylesheet type='text/xsl' href='events.xsl'?>
	<events>";

	while($row = mysql_fetch_assoc($data)) {
		$xml_text .= "<event>";

  	foreach($row as $key => $value) {
    	$xml_text .= "<$key>$value</$key>\r\n";
  	}

  	$xml_text .= "</event>";
	}

	$xml_text .= "</events>";
	print utf8_encode($xml_text);

	mysql_close();
	
?>