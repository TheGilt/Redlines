<?php
// get url and id inputs
$urlLong = $_GET['urlLong'];
$urlShort = $_GET['urlShort'];
$user_id = $_GET['user_id'];
 
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

$sql = "UPDATE Articles SET downvotes = downvotes + 1 WHERE url_long = '" . $urlLong . "';";
$getResults= sqlsrv_query($con, $sql);
$sql = "INSERT INTO UserVotes (user_id, url_long, vote) VALUES 
		('" . $user_id . "', '" . $urlLong . "', -1);";
$getResults= sqlsrv_query($con, $sql);
$sql = "UPDATE WebSources SET downvotes = downvotes + 1 WHERE url_short = '" . $urlShort . "parsed short url';";
$getResults= sqlsrv_query($con, $sql);
 
// Close connections
sqlsrv_free_stmt($getResults);
?>
