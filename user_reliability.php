<?php
$user = $_GET['user']; 
// Create connection
$serverName = "redlines.database.windows.net";
$connectionOptions = array(
    "Database" => "redlines_dubhacks2017",
    "Uid" => "redlines",
    "PWD" => "Dubhacks17"
);
//Establishes the connection
$con = sqlsrv_connect($serverName, $connectionOptions); 
// Check connection

 
// This SQL statement selects ALL from the table 'Locations', but replace with whatever query is necessary
$sql = "WITH correct(cnt) as (SELECT count(*) FROM UserVotes as U, Articles as A WHERE U.user_id = '" . $user . "' and U.url_long = A.url_long and 
	(U.vote + A.upvotes - A.downvotes > A.upvotes - A.downvotes and A.upvotes - A.downvotes > 0) or
	(U.vote + A.upvotes - A.downvotes < A.upvotes - A.downvotes and A.upvotes - A.downvotes < 0)),
	total(ttl) as (SELECT count(*) FROM UserVotes as U WHERE U.user_id = '" . $user . "')

	SELECT (Cast(C.cnt as real))/T.ttl * 100, T.ttl
	FROM correct as C, total as T";

$getResults= sqlsrv_query($con, $sql);
if ($getResults == FALSE)
    echo (sqlsrv_errors());
while ($row = sqlsrv_fetch_array($getResults, SQLSRV_FETCH_ASSOC)) {
	echo json_encode($row);
}
 
// Close connections
sqlsrv_free_stmt($getResults);
?>
