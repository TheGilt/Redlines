<?php
// get URL
$urlLong = $_GET['urlLong'];

$serverName = "redlines.database.windows.net";
$connectionOptions = array(
    "Database" => "redlines_dubhacks2017",
    "Uid" => "redlines",
    "PWD" => "Dubhacks17"
);
//Establishes the connection
$con = sqlsrv_connect($serverName, $connectionOptions);
 
// This SQL statement selects ALL from the table 'Locations', but replace with whatever query is necessary
$sql = "SELECT upvotes, downvotes, title, wiki FROM dbo.Articles as A WHERE A.url_long = 
	'" . $urlLong . "';";

$getResults= sqlsrv_query($con, $sql);
echo($getResults);
	$resultArray = array();
	$tempArray = array();

while ($row = sqlsrv_fetch_array($getResults, SQLSRV_FETCH_ASSOC)) {
	echo ($row['url_long'] . " " . $row['upvotes'] . PHP_EOL);
	echo json_encode($resultArray);
}

 
// Close connections
sqlsrv_free_stmt($getResults);
?>
