<?php
echo("hello");
$serverName = "redlines.database.windows.net";
$connectionOptions = array(
    "Database" => "redlines_dubhacks2017",
    "Uid" => "redlines",
    "PWD" => "Dubhacks17"
);
//Establishes the connection
$conn = sqlsrv_connect($serverName, $connectionOptions);
echo($conn);
?>

