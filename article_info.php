<?php
// get URL
$urlLong = "www.test.com"


$serverName = "redlines.database.windows.net";
$connectionOptions = array(
    "Database" => "redlines_dubhacks2017",
    "Uid" => "redlines",
    "PWD" => "Dubhacks17"
);
//Establishes the connection
$con = sqlsrv_connect($serverName, $connectionOptions);
 
// This SQL statement selects ALL from the table 'Locations', but replace with whatever query is necessary
$sql = "SELECT upvotes, downvotes, title, wiki FROM Articles as A WHERE A.url_long = 
	'" . $urlLong . "';";

$getResults= sqlsrv_query($con, $sql);
	
if ($getResults == FALSE)
    echo (sqlsrv_errors());
while ($row = sqlsrv_fetch_array($getResults, SQLSRV_FETCH_ASSOC)) {
	echo json_encode($row);
}

 
// Close connections
sqlsrv_free_stmt($getResults);
?>
