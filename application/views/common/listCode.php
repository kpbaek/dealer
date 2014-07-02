<?php
$cdGrp = $_REQUEST["cdGrp"];

// include db config
include_once("/config.php");

// set up DB
$db = mysql_connect(PHPGRID_DBHOST, PHPGRID_DBUSER, PHPGRID_DBPASS);
mysql_select_db(PHPGRID_DBNAME);

$SQL = "SELECT a.id, a.invdate, a.amount,a.tax,a.total,a.note FROM invheader a WHERE a.tax=".$cdGrp;
$result = mysql_query( $SQL ) or die("Couldn t execute query.".mysql_error());

$i=0;
while($row = mysql_fetch_array($result,MYSQL_ASSOC)) {
	$responce['cdGrp']['name'] = "tax";
	$responce['cdGrp']['value'] = $cdGrp;
	$responce['cdDtl'][$i]['value'] = $row['tax'];
	$responce['cdDtl'][$i]['text'] = $row['invdate'];
	#    echo $row['id'];
	$i++;
}

echo json_encode($responce);
?>
