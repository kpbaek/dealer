<?php
$cdGrp = $_REQUEST["cdGrp"];

// include db config
include_once("/config.php");

// set up DB
$db = mysql_connect(PHPGRID_DBHOST, PHPGRID_DBUSER, PHPGRID_DBPASS);
mysql_select_db(PHPGRID_DBNAME);

$SQL = "SELECT SEQ, CDGRP, CDDTL, CDNM, USE_YN, REGDT, UPTDT, REGMBKEY, UPTMBKEY FROM sbm.comncd a WHERE a.CDGRP=".$cdGrp;
$result = mysql_query( $SQL ) or die("Couldn t execute query.".mysql_error());

$i=0;
while($row = mysql_fetch_array($result,MYSQL_ASSOC)) {
	$responce['cdGrp']['name'] = "CDGRP";
	$responce['cdGrp']['value'] = $row['CDGRP'];
	$responce['cdDtl'][$i]['value'] = $row['CDDTL'];
	$responce['cdDtl'][$i]['text'] = $row['CDNM'];
	#    echo $row['id'];
	$i++;
}

echo json_encode($responce);
?>
