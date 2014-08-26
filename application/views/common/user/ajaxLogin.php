<?php
$uid = $_REQUEST["uid"];
$pswd = $_REQUEST["pswd"];

$auth = "";
if(isset($_POST["auth"])){
	$auth = $_POST["auth"];
}

// include db config
include_once("/config.php");

// set up DB
$db = mysql_connect(PHPGRID_DBHOST, PHPGRID_DBUSER, PHPGRID_DBPASS);
mysql_select_db(PHPGRID_DBNAME);

session_start();

if(isSet($_POST['uid']) && isSet($_POST['pswd'])){
	$uid = mysql_real_escape_string($uid);
	$pswd = mysql_real_escape_string($pswd);
	
	$sql = "SELECT uid, auth_grp_cd, perms_cd, usr_nm, usr_email, gender_atcd, nation_atcd, active_yn FROM om_user WHERE uid='" .$uid. "' and pswd='" .$pswd. "'";
	if($auth=="UD"){
		$sql_auth = " and auth_grp_cd='UD'";
		$sql = $sql . $sql_auth;
	}
	#	echo $query;
	
	$result=mysql_query($sql);
	$count=mysql_num_rows($result);
	
	$row=mysql_fetch_array($result,MYSQL_ASSOC);
	
	if($count==1)
	{
		if($row['active_yn']=="Y"){
			$_SESSION['ss_user']['uid'] = $row['uid'];
			$_SESSION['ss_user']['usr_nm'] = $row['usr_nm'];
			$_SESSION['ss_user']['auth_grp_cd'] = $row['auth_grp_cd'];
			$_SESSION['ss_user']['perms_cd'] = $row['perms_cd'];
			$_SESSION['ss_user']['usr_email'] = $row['usr_email'];
			$_SESSION['ss_user']['gender_atcd'] = $row['gender_atcd'];
			$_SESSION['ss_user']['nation_atcd'] = $row['nation_atcd'];
			$_SESSION['ss_user']['active_yn'] = $row['active_yn'];
				
			echo json_encode($_SESSION);
		}else{
			$userInfo['ss_user']['active_yn'] = $row['active_yn'];
			echo json_encode($userInfo);			
		}
	}
	
}
?>
