<?php

$urlLong = $_GET['urlLong'];
$urlShort = $_GET['urlShort'];
$title = $_GET['title'];

// Create connection
$serverName = "redlines.database.windows.net";
$connectionOptions = array(
    "Database" => "redlines_dubhacks2017",
    "Uid" => "redlines",
    "PWD" => "Dubhacks17"
);
//Establishes the connection
$con = sqlsrv_connect($serverName, $connectionOptions);

 
// This SQL statement selects ALL from the table 'Locations', but replace with whatever query is necessary
$sql = "SELECT url_long FROM Articles as A WHERE A.url_long = '" . $urlLong . "';";

$getResults= sqlsrv_query($con, $sql);
echo("a");
if (sizeof($getResults) == 0) {
	echo("reached");
	$sql = "INSERT INTO dbo.Articles (url_long, upvotes, downvotes, title, wiki)
	VALUES ('" . urlLong . "', 0, 0, '" . title . "', '');";
	$getResults= sqlsrv_query($con, $sql);
}


 
// Close connections
sqlsrv_free_stmt($getResults);
?>
