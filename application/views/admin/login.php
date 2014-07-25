<!DOCTYPE html>
<meta charset="utf-8" />
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	
	<style type="text/css">
	</style>	
</head>


<body  onload="//javascript:">
<form  id="loginForm" name="loginForm" method="post" action='login_ok.php'>
<table style="margin-top:50px;margin-left:150px;vertical-align:top" border="0" cellspacing="0" cellpadding="0">
<tr>
        <td>아이디</td>
        <td style='width:10px'></td>
        <td><input type='text' name='user_id' size="15" style='width:130px' tabindex='1'/></td>
        <td style='width:20px'></td>
        <td rowspan='3'>
        <input type='button' tabindex='3' value='로그인' style='width:70px;height:50px'/>
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
</table>
</form>
<table style="margin-top:50px;margin-left:150px;vertical-align:top" border="0" cellspacing="0" cellpadding="0">
<tr>
	<td>권한대행 아이디: 바이어의 email</td>
</tr>
</table>
</body>