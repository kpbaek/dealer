<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" type="text/css" media="screen" href="/lib/js/themes/redmond/jquery-ui.custom.css"></link>	
	<link rel="stylesheet" type="text/css" media="screen" href="/lib/jquery.jqGrid-4.6.0/plugins/ui.multiselect.css"></link>	
	<link rel="stylesheet" type="text/css" media="screen" href="/lib/jquery.jqGrid-4.6.0/css/ui.jqgrid.css"></link>	
	<link rel="stylesheet" type="text/css" media="screen" href="/lib/jquery.jqGrid-4.6.0/plugins/searchFilter.css"></link>	
 
	<script src="/lib/jquery.jqGrid-4.6.0/js/jquery-1.11.0.min.js" type="text/javascript"></script>
	<script src="/lib/jquery.jqGrid-4.6.0/js/i18n/grid.locale-en.js" type="text/javascript"></script>
	<script src="/lib/jquery.jqGrid-4.6.0/js/jquery.jqGrid.min.js" type="text/javascript"></script>	
	<script src="/lib/jquery.jqGrid-4.6.0/plugins/grid.postext.js" type="text/javascript"></script>
	<script src="/lib/jquery.jqGrid-4.6.0/plugins/grid.addons.js" type="text/javascript"></script>
	<script src="/lib/js/jquery.form.js" type="text/javascript"></script>
	<script src="/lib/jquery.jqGrid-4.6.0/plugins/jquery.searchFilter.js" type="text/javascript"></script>
	<script src="/lib/jquery.jqGrid-4.6.0/plugins/ui.multiselect.js" type="text/javascript"></script>
	<script src="/js/cmn/common.js" type="text/javascript"></script>
	
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

<div id="searchDiv" style="display:">
<form name="searchForm">
<input type="text" name="page" style="display: none">
searchName<input type="text" name="searchId">
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
			<td width="18%" class="style02">담당부서/담당자</td>
			<td width="5%"><sup></sup></td>
			<td width="27%">
				<select name="team_cd">
				</select>
				<select name="salesworker_id">
				</select>
			</td>
		  </tr>
		  <tr>
			<td class="style01">Company</td>
			<td><sup>★</sup></td>
			<td><input type="text" id="invdate" name="delernm" size=35 style="border: 1"></td>
			<td width="18%" class="style02">부품할증요율</td>
			<td width="5%"><sup></sup></td>
			<td width="27%"><input type="text" id="perDisc" name="perDisc" size=10 style="border: 1">%</td>
		  </tr>
		  <tr>
			<td class="style01">Telephone number</td>
			<td><sup>★</sup></td>
			<td><input type="text" id="invdate" name="delernm" size=35 style="border: 1"></td>
			<td width="18%" class="style02">Bank Information</td>
			<td width="5%"><sup></sup></td>
			<td width="27%">
				<select name="bank_inf">
				</select>
			</td>
		  </tr>
		  <tr>
			<td class="style01">Address</td>
			<td><sup>★</sup></td>
			<td colspan=4><input type="text" id="invdate" name="delernm" size=119 style="border: 1"></td>
		  </tr>
		  <tr>
			<td class="style01">Country</td>
			<td><sup>★</sup></td>
			<td>
				<select name="cntry">
				</select>
			</td>
			<td width="18%" class="style01">Job Title</td>
			<td width="5%"><sup></sup></td>
			<td width="27%"><input type="text" id="invdate" name="delernm" size=35 style="border: 1"></td>
		  </tr>
		  <tr>
			<td class="style01">Email address</td>
			<td><sup>★</sup></td>
			<td><input type="text" id="invdate" name="delernm" size=35 style="border: 1"></td>
			<td colspan=3>&nbsp;</td>
		  </tr>
		  <tr>
			<td class="style01">Homepage</td>
			<td><sup></sup></td>
			<td><input type="text" id="invdate" name="delernm" size=35 style="border: 1"></td>
			<td colspan=3>&nbsp;</td>
		  </tr>
		  <tr>
			<td class="style01">Expierence in cash handling machine</td>
			<td><sup></sup></td>
			<td><input type="text" id="invdate" name="delernm" size=5 style="border: 1">years</td>
			<td colspan=3>&nbsp;</td>
		  </tr>
		  <tr>
			<td class="style01">Main customer</td>
			<td><sup></sup></td>
			<td class="column2 style14 s">
				<select name="main_cust">
				</select>
			</td>
			<td colspan=3>드롭박스. Bank, Cash centre, CIT, Distributor, Gaming, Retailer, Other</td>
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
		   	colNames:['id', 'Name', 'Company', 'Country', 'Business type', 'Job Title',  'Tel number', 'Email', '가입일', '담당부서', '담당자', '부품할증요율'],
	   	              //, '(1CIS)', '(2CIS)', 'Q(Per 1Unit)', 'Order Price', 'Amount'
		   	colModel:[
		   	    {name:'id', index:'id', width:55,hidden:true,search:true}, 
		        {name:'name',index:'id', width:70, align:"right",search:true},
		   		{name:'invdate',index:'invdate', width:70,search:true},
		   		{name:'amount',index:'tax asc, invdate', width:70,search:true},
		   		{name:'amount',index:'amount', width:70, align:"right",search:true},
		   		{name:'tax',index:'tax', width:50, align:"right",search:true},		
		   		{name:'total',index:'total', width:70,align:"right",search:true},		
		   		{name:'total',index:'note', width:70, sortable:false,search:true},		
		   		{name:'total',index:'note', width:70, sortable:false,search:true},		
		   		{name:'total',index:'note', width:70, sortable:false,search:true},		
		   		{name:'total',index:'note', width:70, sortable:false,search:true},		
		   		{name:'total',index:'note', width:70, sortable:false,search:true}		
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
		getCodeCombo("02", f.team_cd);
		getCodeCombo("02", f.salesworker_id);
		getCodeCombo("02", f.cdDtl);
		getCodeCombo("01", f.bank_inf);
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


</script>

</html>