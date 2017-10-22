<?php
// get url and id inputs
$urlLong = $_GET['urlLong'];
$urlShort = $_GET['urlShort'];
$user_id = $_GET['user_id'];
 
// Create connection
$con=mysqli_connect("redlines.database.windows.net","redlines","Dubhacks17","redlines_dubhacks2017");
 
// Check connection
if (mysqli_connect_errno())
{
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
}
 
// This SQL statement selects ALL from the table 'Locations', but replace with whatever query is necessary

$sql = "UPDATE Articles SET downvotes = downvotes + 1 WHERE url_long = '##" . $urlLong . "##';";
mysqli_query($con, $sql);
$sql = "INSERT INTO UserVotes (user_id, url_long, vote) VALUES 
		('##" . $user_id . "##', '##" . $urlLong . "##', -1);";
mysqli_query($con, $sql);
$sql = "UPDATE WebSources SET downvotes = downvotes + 1 WHERE url_short = '##" . $urlShort . "parsed short url##';";
mysqli_query($con, $sql);

 
// Close connections
mysqli_close($con);
?>