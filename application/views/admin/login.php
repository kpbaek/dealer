
<div id="box">

<form  id="loginForm" name="loginForm" method="post" action='login_ok.php'>
<table style="margin-top:50px;margin-left:150px;vertical-align:top" border="0" cellspacing="0" cellpadding="0">
<tr>
        <td>아이디</td>
        <td style='width:10px'></td>
        <td><input type='text' id="uid" name='uid' size="15" style='width:130px' tabindex='1'/></td>
        <td style='width:20px'></td>
        <td rowspan='3'>
        <input id="login" type='button' tabindex='3' value='로그인' style='width:70px;height:50px'/>
        <input id="login2" type='button' tabindex='4' value='권한대행' style='width:70px;height:50px'/>
        </td>
</tr>
<tr>
	<td height="10px"></td>
</tr>
<tr>
        <td>비밀번호</td>
        <td style='width:10px'></td>
        <td><input type='password' id="pswd" name='pswd' size="15" style='width:130px' tabindex='2'/></td>
        <td style='width:30px'></td>
</tr>
<tr>
	<td colspan=4 align=center height="30px"><div id="error"></td>
</tr>
</table>
</div>	
</form>

</div>

<table style="margin-top:30px;margin-left:150px;vertical-align:top" border="0" cellspacing="0" cellpadding="0">
<tr>
	<td>권한대행 아이디: 바이어의 email</td>
</tr>
</table>

<script>
$(document).ready(function() {
    
	$('#login').click(function()
	{
		var uid=$("#uid").val();
		var pswd=$("#pswd").val();
//		var uid="admin";
//		var pswd="admin123";
		
		if($.trim(uid).length==0)
		{
        	$('#box').shake();
			$("#error").html("<span style='color:#cc0000'>Error:</span> user ID is required. ");
			return;
		}
		if($.trim(pswd).length==0)
		{
        	$('#box').shake();
			$("#error").html("<span style='color:#cc0000'>Error:</span> password is required. ");
			return;
		}
		if($.trim(uid).length>0 && $.trim(pswd).length>0)
		{
			$.ajax({
			        type: "POST",
			        url: "/common/user/ajaxLogin",
			        data: {"uid":uid, "pswd":pswd},
			        cache: false,
			        beforeSend: function(){ $("#login").val('Connecting...');},
			        success: function(result){
				        if(result)
				        {
//				        	$("#error").text(result);
					        location.replace("/admin");
						}
				        else
				        {
				        	$('#box').shake();
							$("#login").val('로그인');
							$("#error").html("<span style='color:#cc0000'>Error:</span> Invalid user ID and password. ");
				        }
			        }
			});
		
		}
	
	});

	$('#login2').click(function()
	{
		var uid= $("#uid").val();
//		var pswd=$("#pswd").val();
		var pswd="dealer123";
	
		if($.trim(uid).length==0)
		{
        	$('#box').shake();
			$("#error").html("<span style='color:#cc0000'>Error:</span> user ID is required. ");
			return;
		}
		if($.trim(uid).length>0 && $.trim(pswd).length>0)
		{
			$.ajax({
			        type: "POST",
			        url: "/common/user/ajaxLogin",
			        data: {"uid":uid, "pswd":pswd},
			        cache: false,
			        beforeSend: function(){ $("#login").val('Connecting...');},
			        success: function(data){
				        if(data)
				        {
					        location.replace("/admin");
						}
				        else
				        {
				        	$('#box').shake();
							$("#login").val('로그인');
							$("#error").html("<span style='color:#cc0000'>Error:</span> Invalid user ID. ");
				        }
			        }
			});
		
		}
	
	});	
	
});
</script>