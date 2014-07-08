<?php
$sidx = "id"; // get index row - i.e. user click to sort
if(isset($_REQUEST["sidx"])){
	$sidx = $_REQUEST["sidx"];
}
$sord = "desc"; 
if(isset($_REQUEST["sord"])){
	$sord = $_REQUEST["sord"];
}
$page = "1";
if(isset($_REQUEST["page"])){
	$page = $_REQUEST["page"];
}
$limit = "10"; // get how many rows we want to have into the grid
if(isset($_REQUEST["rows"])){
	$limit = $_REQUEST["rows"];
}
//search param
$searchModel = "";
if(isset($_REQUEST["searchModel"])){
	$searchModel = $_REQUEST["searchModel"];
}

// include db config
include_once("/config.php");

// set up DB
$db = mysql_connect(PHPGRID_DBHOST, PHPGRID_DBUSER, PHPGRID_DBPASS);
mysql_select_db(PHPGRID_DBNAME);

$start = $limit*$page - $limit; // do not put $limit*($page - 1)
#$SQL = "SELECT a.id, a.invdate, b.name, a.amount,a.tax,a.total,a.note FROM invheader a, clients b 
$SQL = "SELECT a.id, 'SB-1100' as model, id as sn, b.name as code, b.name as part_name, 1 as qty, id as price, id*1 as amount,a.tax,a.total,a.note 
		, 'x' as recomYN, 'o' as spareYN, 'o' as wearpartYN, '' as withoutWRT, '' as remark
		FROM invheader a, clients b"; 
$SQL_WHERE = " WHERE a.client_id=b.client_id 
		and id LIKE concat('%%', '" .$searchModel. "')";
$SQL_ORDER = "		ORDER BY "
		 . $sidx . " " . $sord . " LIMIT " . $start . "," . $limit;
$SQL = $SQL . $SQL_WHERE . $SQL_ORDER;
$result = mysql_query( $SQL ) or die("Couldn t execute query.".mysql_error());

$SQL_CNT = "SELECT COUNT(*) AS count FROM invheader a, clients b";
$SQL_CNT = $SQL_CNT . $SQL_WHERE;
$cntResult = mysql_query($SQL_CNT);
$cntRow = mysql_fetch_array($cntResult,MYSQL_ASSOC);
$count = $cntRow['count'];

if( $count >0 ) {
	$total_pages = ceil($count/$limit);
} else {
	$total_pages = 0;
}
if ($page > $total_pages) $page=$total_pages;

/**
$responce = array('page'=>$page
				 ,'total'=>$total_pages
				 ,'records'=>$count
				 ,'rows' => array(array('id'=>'1','name'=>'1','invdate'=>'1','name'=>'2')
				 		         ,array('id'=>'2','name'=>'2','invdate'=>'2','name'=>'2')
				 	)
);
#$responce['page'] = 2;
#$responce['rows'][1]['id'] = 3;
#echo $responce['rows'][1]['id'];
*/

$responce['page'] = $page;
$responce['total'] = $total_pages;
$responce['records'] = $count;

$i=0;
$qtytot = 0;
$amttot = 0;
while($row = mysql_fetch_array($result,MYSQL_ASSOC)) {
	$responce['rows'][$i]['id'] = $row['id'];
	$responce['rows'][$i]['model'] = $row['model'];
	$responce['rows'][$i]['sn'] = $row['sn'];
	$responce['rows'][$i]['code'] = $row['code'];
	$responce['rows'][$i]['part_name'] = $row['part_name'];
	$responce['rows'][$i]['price'] = $row['price'];
//	$responce['rows'][$i]['qty'] = $row['qty'];
//	$responce['rows'][$i]['amount'] = $row['amount'];
	$responce['rows'][$i]['qty'] = 0;
	$responce['rows'][$i]['amount'] = 0;
	$responce['rows'][$i]['tax'] = $row['tax'];
	$responce['rows'][$i]['total'] = $row['total'];
	$responce['rows'][$i]['note'] = $row['note'];
	$responce['rows'][$i]['recomYN'] = $row['recomYN'];
	$responce['rows'][$i]['spareYN'] = $row['spareYN'];
	$responce['rows'][$i]['wearpartYN'] = $row['wearpartYN'];
	$responce['rows'][$i]['withoutWRT'] = $row['withoutWRT'];
	$responce['rows'][$i]['remark'] = $row['remark'];
	
//	$qtytot += $row['qty'];
//	$amttot += $row['amount'];
	$qtytot += 0;
	$amttot += 0;
	
#    echo $row['id'];
    $i++;
}  

$responce['userdata']['qty'] = $qtytot;
$responce['userdata']['amount'] = $amttot;
$responce['userdata']['code'] = 'Totals:';

echo json_encode($responce);
?>
