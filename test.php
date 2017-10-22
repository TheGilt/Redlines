<?php
echo("hello");
$serverName = "redlines.database.windows.net";
$connectionOptions = array(
    "Database" => "redlines_dubhacks2017",
    "Uid" => "redlines",
    "PWD" => "Dubhacks17"
);
//Establishes the connection
$pickle = sqlsrv_connect($serverName, $connectionOptions);
echo($pickle);

$tsql= "SELECT * FROM Articles";
$getResults= sqlsrv_query($pickle, $tsql);
echo ("Reading data from table" . PHP_EOL);
if ($getResults == FALSE)
    echo (sqlsrv_errors());
while ($row = sqlsrv_fetch_array($getResults, SQLSRV_FETCH_ASSOC)) {
 echo ($row['url_long'] . " " . $row['upvotes'] . PHP_EOL);
}
?>

