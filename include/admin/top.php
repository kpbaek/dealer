<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

	<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
	<title>jQuery treeView</title>
	
	<link rel="stylesheet" href="/lib/jquery.treeview/jquery.treeview.css" />
	<link rel="stylesheet" href="/lib/jquery.treeview/screen.css" />
	
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.2.6/jquery.min.js"></script>
	<script src="/lib/jquery.cookie.js" type="text/javascript"></script>
	<script src="/lib/jquery.treeview/jquery.treeview.js" type="text/javascript"></script>

	<script type="text/javascript">
	$(document).ready(function(){
		$("#browser").treeview({
			toggle: function() {
				console.log("%s was toggled.", $(this).find(">span").text());
			}
		});
	});
	</script>
	
	</head>
	
<h1 id="banner"><a href="/admin">수주관리시스템 Admin</a> </h1>
<div id=loginDiv style="display:">
<h1><a href="/admin">Login</a></h1>
</div>
<div id=logoutDiv style="display:none">
<h1>tester님 <img src="/images/common/btn_gnb_logout.gif"></h1>
</div>
