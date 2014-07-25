

<div id="box">

<form  id="loginForm" name="loginForm" method="post" action='login_ok.php'>
<table style="margin-top:50px;margin-left:150px;vertical-align:top" border="0" cellspacing="0" cellpadding="0">
<tr>
        <td>아이디</td>
        <td style='width:10px'></td>
        <td><input type='text' name='user_id' size="15" style='width:130px' tabindex='1'/></td>
        <td style='width:20px'></td>
        <td rowspan='3'>
        <input id="login" type='button' tabindex='3' value='로그인' style='width:70px;height:50px'/>
        <input type='button' tabindex='4' value='권한대행' style='width:70px;height:50px'/>
        </td>
</tr>
<tr>
	<td height="10px"></td>
</tr>
<tr>
        <td>비밀번호</td>
        <td style='width:10px'></td>
        <td><input type='password' name='user_pw' size="15" style='width:130px' tabindex='2'/></td>
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
</body>

	<script>
			$(document).ready(function() {
                
   			 $('#login').click(function()
			{
//                 $('#box').shake();
       			 $("#error").html("<span style='color:#cc0000'>Error:</span> Invalid userid and password. ");
			/**
			var username=$("#username").val();
			var password=$("#password").val();
		    var dataString = 'username='+username+'&password='+password;
			if($.trim(username).length>0 && $.trim(password).length>0)
			{
			
 
			$.ajax({
            type: "POST",
            url: "ajaxLogin.php",
            data: dataString,
            cache: false,
            beforeSend: function(){ $("#login").val('Connecting...');},
            success: function(data){
            if(data)
            {
            $("body").load("home.php").hide().fadeIn(1500).delay(6000);
			}
            else
            {
             $('#box').shake();
			 $("#login").val('Login')
			 $("#error").html("<span style='color:#cc0000'>Error:</span> Invalid username and password. ");
            }
            }
            });
			
			}
   			*/			
			return false;
			});
			
   			 
			});
			
		</script>