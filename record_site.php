<?php

$urlLong = $_GET['urlLong'];
$urlShort = $_GET['urlShort'];
$title = $_GET['title'];

// Create connection
$con=mysqli_connect("redlines.database.windows.net","redlines","Dubhacks17","redlines_dubhacks2017");
 
// Check connection
if (mysqli_connect_errno())
{
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
}
 
// This SQL statement selects ALL from the table 'Locations', but replace with whatever query is necessary
$sql = "SELECT url_long FROM Articles as A WHERE A.url_long = '##" . $urlLong . "##';";
$res = mysqli_query($con, $sql);
if (count($res) = 0)
{
	$sql = "INSERT INTO dbo.Articles (url_long, upvotes, downvotes, title, wiki) VALUES 
		('##" . $urlLong . "##', 0, 0, '##" . $title . "##', '');";
	mysqli_query($con, $sql);
	$sql = "SELECT url_short FROM WebSources as W WHERE W.url_short = '##" . $urlShort . "##';";
	$res = mysqli_query($con, $sql);
	if (count($res) = 0)
	{
		$sql = "INSERT INTO WebSources (url_short, upvotes, downvotes) 
				VALUES ('##" . $urlShort . "##', 0);";
		mysqli_query($con, $sql);
	}
}
 
// Close connections
mysqli_close($con);
?>