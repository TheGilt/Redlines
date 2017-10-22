<?php

$con=sqlsrv_connect("redlines.database.windows.net","redlines_dubhacks2017","redlines","Dubhacks17");

$sql = "SELECT url_long FROM Articles"

$getResults= sqlsrv_query($con, $sql);

while ($row = sqlsrv_fetch_array($getResults, SQLSRV_FETCH_ASSOC)) {
 echo ($row['url_long'] . " " . PHP_EOL);
}
sqlsrv_free_stmt($getResults);
// Close connections
?>

