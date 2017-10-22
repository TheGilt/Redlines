<?php
 $num_articles = $_POST['num_articles'];

// Create connection
$serverName = "redlines.database.windows.net";
$connectionOptions = array(
    "Database" => "redlines_dubhacks2017",
    "Uid" => "redlines",
    "PWD" => "Dubhacks17"
);
$con = sqlsrv_connect($serverName, $connectionOptions);

 
// This SQL statement selects ALL from the table 'Locations', but replace with whatever query is necessary
$sql = "SELECT TOP " . $num_articles . " * FROM Articles as A ORDER BY A.downvotes + A.upvotes desc";
$getResults= sqlsrv_query($con, $sql);
	
if ($getResults == FALSE)
    echo (sqlsrv_errors());
while ($row = sqlsrv_fetch_array($getResults, SQLSRV_FETCH_ASSOC)) {
	echo json_encode($row);
}
 
// Close connections
sqlsrv_free_stmt($getResults);
?>
