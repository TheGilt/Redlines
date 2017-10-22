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

	$resultArray = array();
	$tempArray = array();
 
	// Loop through each row in the result set
	while($row = $result->fetch_object())
	{
		// Add each row into our results array
		$tempArray = $row;
	    array_push($resultArray, $tempArray);
	}
 
	// Finally, encode the array to JSON and output the results
	echo json_encode($resultArray);



 
// Close connections
sqlsrv_free_stmt($getResults);
?>
