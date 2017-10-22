<?php
$user = $_GET['user']; 
// Create connection
$con=mysqli_connect("redlines.database.windows.net","redlines","Dubhacks17","redlines_dubhacks2017");
 
// Check connection
if (mysqli_connect_errno())
{
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
}
 
// This SQL statement selects ALL from the table 'Locations', but replace with whatever query is necessary
$sql = "WITH correct(cnt) as (SELECT count(*) FROM UserVotes as U, Articles as A WHERE U.user_id = '##" . $user . "##' and U.url_long = A.url_long and 
	(U.vote + A.upvotes - A.downvotes > A.upvotes - A.downvotes and A.upvotes - A.downvotes > 0) or
	(U.vote + A.upvotes - A.downvotes < A.upvotes - A.downvotes and A.upvotes - A.downvotes < 0)),
	total(ttl) as (SELECT count(*) FROM UserVotes as U WHERE U.user_id = '##user##')

	SELECT (Cast(C.cnt as real))/T.ttl * 100, T.ttl
	FROM correct as C, total as T";

if ($result = mysqli_query($con, $sql))
{
	// If so, then create a results array and a temporary one
	// to hold the data
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
}

 
// Close connections
mysqli_close($con);
?>