<?php 
include("/include/admin/top.php");
?>
<body>

<div id="main">
	
	<table>
	<tr><td style="width:250px;vertical-align: top">
		<div id="left" style="width: 150px;">

<?php 
include("/include/admin/left.php");
?>
		
		
		</div>
	</td>
	<td style="width:700px;vertical-align: top">
		<div id="body" style="width: 700px;">
<?php 
include("body.php");
?>
		</div>	
	</td>
	</tr>
	<tr><td colspan=2>
<div id="footer">
<?php 
include("/include/admin/footer.php");
?>
</div>
	</td>
	</tr>
	</table>

</div>


</body>

</html>