<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" type="text/css" media="screen" href="/lib/js/themes/redmond/jquery-ui.custom.css"></link>	
	<link rel="stylesheet" type="text/css" media="screen" href="/lib/jquery.jqGrid-4.6.0/plugins/ui.multiselect.css"></link>	
	<link rel="stylesheet" type="text/css" media="screen" href="/lib/jquery.jqGrid-4.6.0/css/ui.jqgrid.css"></link>	
	<link rel="stylesheet" type="text/css" media="screen" href="/lib/jquery.jqGrid-4.6.0/plugins/searchFilter.css"></link>	
    <link rel="stylesheet" href="/css/multiple-select.css" />
	<link rel="stylesheet" type="text/css" href="/css/msdropdown/dd.css" />
    
	<script src="/lib/jquery.jqGrid-4.6.0/js/jquery-1.11.0.min.js" type="text/javascript"></script>
	<script src="/lib/jquery.jqGrid-4.6.0/js/i18n/grid.locale-en.js" type="text/javascript"></script>
	<script src="/lib/jquery.jqGrid-4.6.0/js/jquery.jqGrid.min.js" type="text/javascript"></script>	
	<script src="/lib/jquery.jqGrid-4.6.0/plugins/grid.postext.js" type="text/javascript"></script>
	<script src="/lib/jquery.jqGrid-4.6.0/plugins/grid.addons.js" type="text/javascript"></script>
	<script src="/lib/js/jquery.form.js" type="text/javascript"></script>
	<script src="/lib/jquery.jqGrid-4.6.0/plugins/jquery.searchFilter.js" type="text/javascript"></script>
	<script src="/lib/jquery.jqGrid-4.6.0/plugins/ui.multiselect.js" type="text/javascript"></script>
	<script src="/js/cmn/common.js" type="text/javascript"></script>
	<script src="/lib/js/jquery.multiple.select.js"></script>
	<script src="/lib/js/msdropdown/jquery.dd.js"></script>
	
	<style type="text/css">
	  html { font-family:Calibri, Arial, Helvetica, sans-serif; font-size:11pt; background-color:white }
	  table { border-collapse:collapse; page-break-after:always; }
	  .gridlines td { border:1px dotted black }
	  .b { text-align:center }
	  .e { text-align:center }
	  .f { text-align:right }
	  .inlineStr { text-align:left }
	  .n { text-align:right }
	  .s { text-align:left }
	  td.style01 { vertical-align:middle; text-align:center; padding-left:0px; border-bottom:none #000000; border-top:1px solid #000000 !important; border-left:1px solid #000000 !important; border-right:none #000000; font-weight:bold; color:#000000; font-family:'Calibri'; font-size:11pt; background-color:#A0A0A0 }
	  td.style02 { vertical-align:middle; text-align:center; padding-left:0px; border-bottom:none #000000; border-top:1px solid #000000 !important; border-left:1px solid #000000 !important; border-right:none #000000; font-weight:bold; color:#000000; font-family:'Calibri'; font-size:11pt; background-color:#cc99ff }
	  table.sheet0 col.col0 { width:42pt }
	  table.sheet0 col.col1 { width:42pt }
	  table.sheet0 col.col2 { width:42pt }
	  table.sheet0 col.col3 { width:42pt }
	  table.sheet0 col.col4 { width:42pt }
	  table.sheet0 col.col5 { width:42pt }
	  table.sheet0 col.col6 { width:42pt }
	  table.sheet0 col.col7 { width:82pt }
	  table.sheet0 col.col8 { width:82pt }
	  table.sheet0 tr { height:15pt }
	</style>	
</head>

<body  onload="javascript:">

<div id="searchDiv" style="display:;text-align:right;">
<form name="searchForm">
<input type="text" name="page" style="display: none">
Name<input type="text" name="searchId">
<input type="button" id="btnSearch" value="Search" onclick="javascript:gridReload();"/>
</form>
</div>
<div id="gridDiv">
<table id="list"></table>
<div id="pager"></div>
</div>
<table border="0" cellpadding="0" cellspacing="0" style="width:950px;align:center; vertical-align:middle">
<tr>
    <td align=right>
    	<input type="button" id="btnNew" value="신규" onclick="javascript:newForm();"/>
    </td>
</tr>
</table>
</div>
<div id="postdata"></div>
<p>
<div id="formDiv" style="display:none">
<form id="addForm" name="addForm" method="post">

	<table border="0" cellpadding="1" cellspacing="1" id="sheet0" width=950>
		<col class="col0">
		<col class="col1">
		<col class="col2">
		<col class="col3">
		<col class="col4">
		<tbody>
		  <tr height="5px">
			<td colspan=6></td>
		  </tr>
		  <tr>
			<td width="18%" class="style01">Name</td>
			<td width="5%"><sup>★</sup></td>
			<td width="27%"><input type="text" id="invdate" name="delernm" size=35 style="border: 1"></td>
			<td width="18%" class="style01">담당부서/담당자</td>
			<td width="5%"><sup></sup></td>
			<td width="27%">
				<select name="team_cd" onchange="javascript:getWorkerCombo(this.value, document.addForm.worker_uid);" style="width: 120px;">
				</select>
				<select name="worker_uid">
				</select>
			</td>
		  </tr>
		  <tr>
			<td class="style01">Company</td>
			<td><sup>★</sup></td>
			<td><input type="text" id="invdate" name="delernm" size=35 style="border: 1"></td>
			<td width="18%" class="style01">부품할증요율</td>
			<td width="5%"><sup></sup></td>
			<td width="27%"><input type="text" id="perDisc" name="perDisc" size=10 style="border: 1;ime-mode:disabled" onKeyup="fncOnlyDecimal(this);">%</td>
		  </tr>
		  <tr>
			<td class="style01">Telephone number</td>
			<td><sup>★</sup></td>
			<td><input type="text" id="invdate" name="delernm" size=35 style="border: 1"></td>
			<td width="18%" class="style01">Bank Information</td>
			<td width="5%"><sup></sup></td>
			<td width="27%">
				<select name="bank_inf" style="width: 120px;">
				</select>
			</td>
		  </tr>
		  <tr>
			<td class="style01">Address</td>
			<td><sup>★</sup></td>
			<td colspan=4><input type="text" id="invdate" name="delernm" size=122 style="border: 1"></td>
		  </tr>
		  <tr>
			<td class="style01">국적</td>
			<td><sup>★</sup></td>
			<td>
				<select name="nation_atcd" style="width: 240px;">
				</select>
			</td>
			<td width="18%" class="style01">성별</td>
			<td width="5%"><sup></sup></td>
			<td width="27%">
			  <div id="div_gender_atcd">
			    <label></label>
			    <input type="radio" name="gender_atcd" value="M"/> 남성
			    <input type="radio" name="gender_atcd" value="F"/> 여성
			  </div>
			</td>
		  </tr>
		  <tr>
			<td class="style01">Email address</td>
			<td><sup>★</sup></td>
			<td><input type="text" id="usr_email" name="usr_email" size=35 style="border: 1" onchange="$('#btnChkEail').attr('disabled',false);">
			<input type="button" id="btnChkEail" value="중복검사" onclick="javascript:chkEmail();"/>
			</td>
			<td width="18%" class="style01">fax</td>
			<td width="5%"><sup></sup></td>
			<td width="27%"><input type="text" id="fax" name="fax" size=35 style="border: 1"></td>
		  </tr>
		  <tr>
			<td class="style01">Job Title</td>
			<td><sup></sup></td>
			<td><input type="text" id="invdate" name="delernm" size=35 style="border: 1"></td>
			<td width="18%" class="style01">대상국가</td>
			<td width="5%"><sup></sup></td>
			<td width="27%">
				<div class="form-group">
			        <select id="cntry_atcd" name="cntry_atcd" multiple="multiple" class="form-control" style="width: 250px;">
			        </select>
			    </div>
			</td>
		  </tr>
		  <tr>
			<td class="style01">Homepage</td>
			<td><sup></sup></td>
			<td><input type="text" id="invdate" name="delernm" size=35 style="border: 1"></td>
			<td colspan=3></td>
		  </tr>
		  <tr>
			<td class="style01">Expierence in cash handling machine</td>
			<td><sup></sup></td>
			<td><input type="text" id="invdate" name="delernm" size=5 style="border: 1;ime-mode:disabled" onKeyup="fncOnlyNumber(this);">years</td>
			<td colspan=3>&nbsp;</td>
		  </tr>
		  <tr>
			<td class="style01">Main customer</td>
			<td><sup></sup></td>
			<td class="column2 style14 s">
				<select name="main_cust" style="width: 120px;">
				</select>
			</td>
			<td colspan=3></td>
		  </tr>
		  <tr>
			<td class="style01">Comments</td>
			<td><sup></sup></td>
			<td colspan=3><textarea cols="50" rows="3" name="comment">Please comment interesting model name.</textarea></td>
			<td></td>
		  </tr>
		  <tr>
			<td class="style01">Market information</td>
			<td><sup></sup></td>
			<td colspan=3>
			<textarea name="comment" cols="50" rows="5">Please describe your market information.<?php echo chr(13) . chr(10);?>The number of banks and their branch, CIT, etc. Bank policies<?php echo chr(13) . chr(10);?>The names of popular models &amp; Price<?php echo chr(13) . chr(10);?>
			</textarea></td>
			<td></td>
		  </tr>
		  <tr>
			<td colspan=6>&nbsp;</td>
		  </tr>
		  <tr>
			<td colspan=6 align=center>
			<input type="button" value="저장" onclick="javascript:createData();"/>
			</td>
		  </tr>
		</tbody>
	</table>
</form>

</div>

    
</body>
<script type="text/javascript">

	jQuery().ready(function () {
		var targetUrl = "/admin/manage/listDealer";
		var mygrid = jQuery("#list").jqGrid({
		   	//url:'/test/main/server',
		   	url:targetUrl,
		   	datatype: "json",
		   	//colNames:['Inv No','Date', 'Client', 'Amount','Tax','Total','Notes'],
		   	colNames:['id', 'Name', 'Nation', 'Company', 'Tel', 'Email', '가입일', '담당부서', '담당자', '부품할증요율','승인여부'],
	   	              //, '(1CIS)', '(2CIS)', 'Q(Per 1Unit)', 'Order Price', 'Amount'
		   	colModel:[
		   	    {name:'id', index:'id', width:30,hidden:true,search:true}, 
		        {name:'name',index:'id', width:70, align:"right",search:true},
		   		{name:'invdate',index:'invdate', width:70,search:true},
		   		{name:'amount',index:'tax asc, invdate', width:70,search:true},
		   		{name:'amount',index:'amount', width:70, align:"right",search:true},
		   		{name:'tax',index:'tax', width:70, align:"right",search:true},		
		   		{name:'total',index:'total', width:70,align:"right",search:true},		
		   		{name:'total',index:'note', width:70, sortable:false,search:true},		
		   		{name:'total',index:'note', width:70, sortable:false,search:true},		
		   		{name:'total',index:'note', width:70, sortable:false,search:true},		
		   		{name:'total',index:'note', width:50, sortable:false,search:true}		
			],
	        onSelectRow: function(id) {
	            var params = {id:id};
	            view_detail("#list",params);
	            printData(params);
	        },
			mtype: "POST",
//			postData:{id:'2'},
            gridComplete: function(){
                var ids = jQuery("#list").jqGrid('getDataIDs');
                for(var i=0;i < ids.length;i++){
                    var cl = ids[i];
                    var rowData = jQuery("#list").jqGrid('getRowData',cl);
                    var cl_id = rowData.id;
                    be = "<img src='/images/ci_logo.jpg' height='20'>";
//                    jQuery("#list").jqGrid('setRowData',ids[i],{tax:be});
                }
            },	            
            
			rowNum:10,
		   	rowList:[10,20,30],
		   	pager: '#pager',
		    viewrecords: true,
		    autowidth: false,
		    width:950,
		    height:240,
		    sortname: 'id',
		    sortorder: "desc",
			toolbar: [true,"top"],
		    hiddengrid: false,
			caption:"딜러관리"
		});
		jQuery("#list").jqGrid('navGrid','#pager',{edit:false,add:false,del:false,search:false});
/**
		jQuery("#list").jqGrid('filterToolbar',{stringResult: true,searchOnEnter : false, defaultSearch : "cn"});
		jQuery("#list").jqGrid('navButtonAdd',"#pager",{caption:"Toggle",title:"Toggle Search Toolbar", buttonicon :'ui-icon-pin-s',
			onClickButton:function(){
				mygrid[0].toggleToolbar();
			} 
		});
*/		
		jQuery("#list").jqGrid('navButtonAdd',"#pager",{caption:"Search",title:"Toggle Search",
			onClickButton:function(){ 
				if(jQuery("#t_list").css("display")=="none") {
					jQuery("#t_list").css("display","");
				} else {
					jQuery("#t_list").css("display","none");
				}
				
			} 
		});		
		$("#t_list").append(searchDiv);
		
		initForm();
	})
	
    $("#cntry_atcd").multipleSelect({
            selectAll: false
//            ,multipleWidth: "70"
    });	
    
	$(function() {
	    $('#cntry_atcd').change(function() {
		    console.log($(this).val());
	    }).multipleSelect();
	});

	function printPostData(){
    	var pd = $("#list").jqGrid('getPostData');
        var r = "";
        $.each(pd, function(i) {
            r += i + ": " + pd[i] + ",";
            $("#postdata").html(r);
        })
    }
	
	function initForm() {
		var f = document.addForm;
		getCodeCombo("0060", f.team_cd);
		getCodeCombo("0021", f.nation_atcd);
		
		var selAr =  ["kr"];
		getCodeMultiCombo("0022", $('#cntry_atcd'), selAr);
/*
		var $opt = ("<option />", {
            value: "1111",
            text: "2222"
        });
    	$('#cntry_atcd').append($opt).multipleSelect("refresh");
*/    	
//		getWorkerCombo("00600SL0", f.worker_uid);
		getCodeCombo("0050", f.bank_inf);
		getCodeCombo("0120", f.main_cust);

		
		var gender_atcd = "";
		setCodeRadio("gender_atcd", gender_atcd);
		
		newForm();
    }
	
    function gridReload() {
		var targetUrl = "/admin/manage/listDealer";
    	var page = document.searchForm.page.value;
    	var searchId = document.searchForm.searchId.value;
        $("#list").jqGrid('setPostData', {test:'aa',searchId:searchId});
    	jQuery("#list").jqGrid('setGridParam', {url:targetUrl,page:'1'}).trigger("reloadGrid");
		printPostData();
	}

    function test_detail(list, id) {
        var chk_data = jQuery(list).jqGrid('getRowData',id);
        var targetUrl = '/admin/product/viewPart?id=' + chk_data.id;
        $.post(targetUrl, function(data, status){
            alert("data:" + data + "\nStatus: " + status);
	    });
    }
    
    function view_detail(list, params) {
    	displayDiv(formDiv);
    	document.getElementById("btnNew").disabled = false;
		var f = document.addForm;
    	f.reset();
    	
        var chk_data = jQuery(list).jqGrid('getRowData',params.id);
        var targetUrl = '/admin/product/viewPart?id=' + chk_data.id;
        $.getJSON(targetUrl, function(result){
	        $.each(result, function(i, field){
            	document.getElementById("id").value = field.id;
                document.getElementById("invdate").value = result['viewPart']['invdate'];
            	$("#thumbDiv").html("<img src='/uploads/" + result['viewPart']['invdate'] + "' width=50>");
            });
	    });
    }
    
    function ajax_detail(list, id) {
        var chk_data = jQuery(list).jqGrid('getRowData',id);
        targetUrl = "/admin/product/viewPart?id=" + chk_data.id;
        $.ajax({
            url: targetUrl,
            type: 'GET',
            dataType: 'json',
            timeout: 1000,
            error: function() {
                alert('Error loading targetUrl');
            },
            success: function(result) {
                $.each(result, function(i, field){
                	document.getElementById("id").value = field.id;
                    document.getElementById("invdate").value = result['viewPart']['invdate'];
                });
            }
        });
    }
    
    function printData(param) {
//        var targetUrl = "/admin/product/viewPart?id=" + param.id;
        var targetUrl = "/admin/product/viewPart";
        $.post(targetUrl, param, function(data, status){
        	$("#postdata").append("param:" + param.id + "<br>");
    		$("#postdata").append("data:" + data + "\nStatus: " + status);
		});
	}

    function displayDiv(targetDiv) {
       if(targetDiv.style.display=="none"){
    	   targetDiv.style.display="";    
       }
	}

    function newForm() {
    	displayDiv(formDiv);
    	var f = document.addForm;
    	f.reset();
    	document.getElementById("btnNew").disabled = true;
    	$("#thumbDiv").html("");
    	$("#list").jqGrid('resetSelection');
    	
	}

    function createData() {
		var f = document.addForm;
		if($("input:radio[name=gender_atcd]").is(':checked')==false){
		}else{
			var gender_atcd = $(':radio[name="gender_atcd"]:checked').val();
//			alert(gender_atcd);
		}			

		if($('#btnChkEail').attr('disabled')!="disabled"){
			alert("email 중복검사후 등록하세요");
			return;
		}
		return;
		
//		f.target ="ifUpload";
		f.action = "/upload/do_upload";
		var options = {
					type:"POST",
					dataType:"text",
			        beforeSubmit: function(formData, jqForm, options) {
			        },
			        success: function(responseText, statusText, xhr, $form) {
			            if(statusText == 'success'){		            	
				        	alert("저장되었습니다");
				        	$("#thumbDiv").html(responseText);
				        	document.getElementById("btnNew").disabled = false;
				        	gridReload();
				        	newForm();
			            }
			        }
			    };
		$("#addForm").ajaxSubmit(options);
    }


    function checkValue(){
		if($("#id").val().length == 0){
    		$("#id").focus();
    		return false;
		}else if($("#invdate").val().length == 0){
    		$("#invdate").focus();
    		return false;
		}
		return true;
    }

    function chkEmail(){
		if($("#usr_email").val().length == 0){
    		$("#usr_email").focus();
    		return;
		}

		if(!fncValidEmail($("#usr_email").val())){
			alert("email 형식이 맞지  않습니다.");
			return;
		}
		
		$.ajax({
	        type: "POST",
//	        url: "/user/ajaxLogin",
	        url: "/common/user/chkEmail",
	        async: false,
	        dataType: "json",
	        data: {"usr_email":$("#usr_email").val()},
	        cache: false,
//	        beforeSend: function(){ $('#btnChkEail').attr('disabled',true);},
	        success: function(result, status, xhr){
//	            alert(xhr.status);
	        	var usr_email = result.usr_email; 
				if(usr_email.dup_yn=="Y")
		        {
	        		alert("기등록된 email입니다.");
	        		$('#btnChkEail').attr('disabled',false);
	        		return;
				}else{
					$('#btnChkEail').attr('disabled',true);
				}
	        }
		});
		
		return true;
    }

   
</script>

</html>