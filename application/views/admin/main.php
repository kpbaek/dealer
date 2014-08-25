<?php include("/include/admin/top.php");?>
<body>

<div id="main">
	
	<table>
	<tr><td style="width:220px;vertical-align: top">
		<div id="left" style="width: 200px;">

<?php 
if (isset($_SESSION['ss_user']['uid'])){
	include("/include/admin/left.php");
}
?>
		</div>
	</td>
	<td style="width:600px;align:center; vertical-align:top">
		<div id="body">
<?php include("home.php");?>
		</div>	
	</td>
	</tr>
	<tr><td colspan=2>
		<div id="footer">
		<?php include("/include/admin/footer.php");?>
		</div>
		</td>
	</tr>
	</table>

</div>

</body>

</html>