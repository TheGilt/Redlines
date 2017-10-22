<?php
// get phrase input
$phrase = $_GET['phrase']; 

$serverName = "redlines.database.windows.net";
$connectionOptions = array(
    "Database" => "redlines_dubhacks2017",
    "Uid" => "redlines",
    "PWD" => "Dubhacks17"
);
//Establishes the connection
$con = sqlsrv_connect($serverName, $connectionOptions);
// Create connection
 

 
// This SQL statement selects ALL from the table 'Locations', but replace with whatever query is necessary
$sql = "SELECT * FROM Articles as A WHERE A.title LIKE '%##" . $phrase . "##%'";

$getResults= sqlsrv_query($con, $sql);

if ($getResults == FALSE)
    echo (sqlsrv_errors());
while ($row = sqlsrv_fetch_array($getResults, SQLSRV_FETCH_ASSOC)) {
	echo json_encode($row);
}

 
// Close connections
mysqli_close($con);
?>
