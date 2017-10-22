<?php

$con=sqlsrv_connect("redlines.database.windows.net","redlines_dubhacks2017","redlines","Dubhacks17");
if (mysqli_connect_errno())
{
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
}
 
// Close connections
mysqli_close($con);
?>

