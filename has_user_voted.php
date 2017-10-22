<?php
// get arguments
$user = $_GET['user'];
$url = $_GET['url'];

 
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
$sql = "SELECT U.vote FROM UserVotes as U WHERE U.user_id = '" . $user . "' and U.url_long = '" . $url . "'";

$getResults= sqlsrv_query($con, $sql);

if ($getResults == FALSE)
    echo (sqlsrv_errors());
while ($row = sqlsrv_fetch_array($getResults, SQLSRV_FETCH_ASSOC)) {
	echo json_encode($row);
}

 
// Close connections
sqlsrv_free_stmt($getResults);
?>
