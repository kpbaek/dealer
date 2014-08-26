
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

        <!-- 친구수--> 
        <div style="text-align:center;padding:10px;"></div> 
      
        <table class="table table-striped""> 
            <tbody> 
                <!-- 친구 목록 노출 영역--> 
            </tbody> 
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
//			        url: "/user/ajaxLogin",
			        url: "/common/user/ajaxLogin",
			        async: false,
			        dataType: "json",
			        data: {"uid":uid, "pswd":pswd},
			        cache: false,
			        beforeSend: function(){ $("#login").val('Connecting...');},
//			        success: response_json2 
			        success: function(result, status, xhr){
//			            alert(xhr.status);
			        	var userInfo = result.ss_user; 
						if(userInfo.active_yn=="Y")
				        {
			        		$.each(userInfo, function(key){ 
			     		       var html = key + ":" + userInfo[key] + "<br>"; 
			     		       $("#error").append(html);
			     		    }); 
//							$("#error").html("");
//							$("#login").val('로그인');
			     		    location.replace("/admin");
						}
				        else
				        {
				        	$('#box').shake();
							$("#login").val('로그인');
							$("#error").html("<span style='color:#cc0000'>Error:</span> Inactive user ID. ");
				        }
			        },
			        /* ajax options omitted */
			        error:function(){
			        	$('#box').shake();
						$("#login").val('로그인');
						$("#error").html("<span style='color:#cc0000'>Error:</span> Invalid user ID and password. ");
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
			        async: false,
			        dataType: "json",
			        data: {"uid":uid, "pswd":pswd},
			        cache: false,
			        beforeSend: function(){ $("#login").val('Connecting...');},
			        success: function(result, status, xhr){
			        	var userInfo = result.ss_user; 
						if(userInfo.active_yn=="Y")
				        {
			        		$.each(userInfo, function(key){ 
			     		       var html = key + ":" + userInfo[key] + "<br>"; 
//			     		       $("#error").append(html);
			     		    }); 
			     		    location.replace("/admin");
						}
				        else
				        {
				        	$('#box').shake();
							$("#login").val('로그인');
							$("#error").html("<span style='color:#cc0000'>Error:</span> Inactive user ID. ");
				        }
			        },
			        /* ajax options omitted */
			        error:function(){
			        	$('#box').shake();
						$("#login").val('로그인');
						$("#error").html("<span style='color:#cc0000'>Error:</span> Invalid user ID and password. ");
					}
			        
			});
		
		}
	
	});	
	
});

function response_json2(json) 
{ 
	alert(json);
	if(json)
    {
		var userInfo = json.ss_user; 

		   //친구수 만큼 루프를 돈다 
		   $.each(userInfo, function(key){ 

		       var html = "<tr>"; 
		       html += "<td>"+ key + ":" + userInfo[key] +"</td>"; 

		       $("#error").append(html);
		   }); 
    
        location.replace("/admin");
	}
    else
    {
    	$('#box').shake();
		$("#login").val('로그인');
		$("#error").html("<span style='color:#cc0000'>Error:</span> Invalid user ID and password. ");
    }
} 
 
function response_json(json) 
{ 
   var friend_list = json.UnoFriendList; 

   //친구수
   var friend_count =friend_list.length; 

//   $("div").html("<b>전체 친구수 : " + friend_count + " 명</b>"); 

   //친구수 만큼 루프를 돈다 
   $.each(friend_list, function(key){ 

       //친구 1명의 정보를 가진 변수 
       //{"UnoFriendList":[{"Friend":{친구정보}},{"Friend":{친구정보}}]} 
       //형태이므로 friend_list 의 배열에서 각 개체를 가져온다. 
       var friend_info = friend_list[key].Friend; 

       var friend_name = friend_info.name; 
       var friend_phone = friend_info.phone; 
       var friend_address = friend_info.address; 
       var friend_birth = friend_info.birth;    

       //family 의 수만큼 루프를 돌아 이름을 구한다. 
       var family_name = ""; 
       var family_list = friend_info.family; 

       //"family":{"family_name_1":"\ucc44\uc724","family_name_2":"\ucc44\ub9ac"} 
       //idx의 값은  family_name_1 , family_name_2 가 된다.                       
       $.each(family_list,function(idx){ 
           family_name += family_list[idx] + "<br/>"; 
       });                  
         
       var friend_date = friend_info.date; 
                         
       var html = "<tr>"; 
       html += "<td>"+ friend_name +"</td>"; 
       html += "<td>"+ friend_phone +"</td>"; 
       html += "<td>"+ friend_address +"</td>"; 
       html += "<td>"+ friend_birth +"</td>";                   
       html += "<td>"+ family_name + "</td>"; 
       html += "<td>"+ friend_date +"</td>"; 
       html += "</tr>"; 

       $("tbody").append(html);                 
   }); 
} 

</script>