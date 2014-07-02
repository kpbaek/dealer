<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" type="text/css" media="screen" href="/lib/js/themes/redmond/jquery-ui.custom.css"></link>	
	<link rel="stylesheet" type="text/css" media="screen" href="/lib/js/jqgrid/css/ui.jqgrid.css"></link>	
 
	<script src="/lib/js/jquery.min.js" type="text/javascript"></script>
	<script src="/lib/js/jqgrid/js/i18n/grid.locale-en.js" type="text/javascript"></script>
	<script src="/lib/js/jqgrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>	
	<script src="/lib/js/themes/jquery-ui.custom.min.js" type="text/javascript"></script>
	<script src="/lib/js/jquery.form.js" type="text/javascript"></script>
	
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
	  td.style01 { vertical-align:middle; text-align:left; padding-left:0px; border-bottom:none #000000; border-top:1px solid #000000 !important; border-left:1px solid #000000 !important; border-right:none #000000; font-weight:bold; color:#000000; font-family:'Calibri'; font-size:11pt; background-color:#A0A0A0 }
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
<div id="searchDiv" style="display:none">
<form name="searchForm">
<input type="text" name="page">
<a href="javascript:gridReload();" id="search">page</a>
</form>
</div>
<div id="myDiv">
<table id="list"></table>
<div id="pager"></div>
</div>
<div id="btnDiv">
<table border="0" cellpadding="0" cellspacing="0" style="width:950px;align:center; vertical-align:middle">
<tr>
    <td align=right>
		<input type="button" value="test" onclick="javascript:printData();"/>
    	<input type="button" id="btnNew" value="신규" onclick="javascript:newForm();"/>
    </td>
</tr>
</table>
</div>
<span id="postdata"></span>
<p>
<div id="formDiv" style="display:none">
<form id="addForm" name="addForm" method="post" accept-charset="utf-8" enctype="multipart/form-data">
<table border="1" cellpadding="0" cellspacing="0" id="sheet0" width="950">
		<col class="col0">
		<col class="col1">
		<col class="col2">
		<col class="col3">
		<col class="col4">
		<col class="col5">
		<col class="col6">
		<col class="col7">
		<col class="col8">
		<tbody>
		<tr>
			<td class="style01">Model</td>
			<td><input type="text" id="id" name="id" size=5 style="border-style: none;">
			<select name="cdGrp" onchange="javascript:getCodeList(this.value);">
			<option value="">-------------------</option>
			<option value="0.00">0.00</option>
			<option value="40.00">40.00</option>
			</select>
			<select name="cdDtl">
			</select>
			</td>
			<td class="style01">S/N</td>
			<td><input type="text" id="invdate" name="invdate" size=12 style="border-style: none;"></td>
			<td class="style01">CODE</td>
			<td><input type="text" id="code" name="code" size=12 style="border-style: none;"></td>
			</tr>
		<tr>
			<td class="style01">Part Name</td>
			<td colspan=5></td>
		</tr>
		<tr>
			<td class="style01">IMAGE</td>
			<td><input type="file" name="userfile" size="20">
			<div id="thumbDiv"></div>
			<!-- <iframe name="ifUpload" scrolling="no" marginheight="0" marginwidth="0" frameborder="0" width="50" height=50></iframe> -->
			</td>
		<td class="style01">Remark</td>
			<td colspan=5><textarea rows="3" cols="65"></textarea></td>
			</tr>
		<tr>
			<td class="style01">Recommend</td>
			<td><input type="text" id="Recommend" name="id" size=5 style="border-style: none;"></td>
			<td class="style01" width=80>Spare Part</td>
			<td><input type="text" id="SparePart" name="id" size=5 style="border-style: none;"></td>
			<td class="style01">Wear Parts</td>
			<td><input type="text" id="WearParts" name="id" size=5 style="border-style: none;"></td>
			</tr>
		</tbody>
	</table>
	<div id="btnSubDiv">
	<table border="0" cellpadding="0" cellspacing="0" style="width:950px;align:center; vertical-align:middle">
	<tr>
	    <td align=right>
			<input type="button" value="저장" onclick="javascript:createData();"/>
	    </td>
	</tr>
	</table>
	</div>
	
</form>

</div>

<script type="text/javascript">

	function getCodeList(cdGrp) {
		var f = document.addForm;
		var selObj = f.cdDtl;
	    if (cdGrp == "") {
	        deleteOptionElements(selObj);
	        addOptionElement(selObj, "", "------");
	        return;
	    }
		var targetUrl = '/common/main/listCode?cdGrp=' + cdGrp;
	    $.getJSON(targetUrl, function(result){
	    	$('#postdata').append(result['cdGrp']['name'] + ":" + cdGrp);
	    	deleteOptionElements(selObj);
	        for(var i=0; i<result['cdDtl'].length; i++){
            	addOptionElement(selObj, result['cdDtl'][i]['value'], result['cdDtl'][i]['text']); 
			}
	    });
	}
	
	function deleteOptionElements(slbObj){ 
		 for(i=slbObj.length-1;i>-1;i--){ 
		 	slbObj.remove(i); 
		 } 
	} 
	
	function addOptionElement(slbObj,value,text){ 
		 slbObj.add(new Option(text, value, false)); 
	} 
		 
	//선택 옵션항목을 제거 
	function deleteOptionSelElements(sel){ 
	    sel.options[sel.selectedIndex]=null; 
	}
	
	function setCodeList(xml, combo_id) {
	    deleteOptionElements(combo_id);
	    addOptionKind(xml, combo_id);
	
	}

	jQuery().ready(function () {
		var targetUrl = "/admin/product/listPart";
		jQuery("#list").jqGrid({
		   	//url:'/test/main/server',
		   	url:targetUrl,
		   	datatype: "json",
		   	//colNames:['Inv No','Date', 'Client', 'Amount','Tax','Total','Notes'],
		   	colNames:['Model', 'S/N', 'CODE', 'Part Name', 'IMAGE', 'Recommend', 'Spare Part', 'Wear Parts',  'Without Warranty', 'Remark'],
	   	              //, '(1CIS)', '(2CIS)', 'Q(Per 1Unit)', 'Order Price', 'Amount'
		   	colModel:[
		   		{name:'id',index:'id', width:70, align:"right"},
		   		{name:'invdate',index:'invdate', width:70},
		   		{name:'tax',index:'tax asc, invdate', width:70},
		   		{name:'id',index:'amount', width:100, align:"right"},
		   		{name:'id',index:'tax', width:50, align:"right"},		
		   		{name:'id',index:'total', width:70,align:"right"},		
		   		{name:'id',index:'note', width:70, sortable:false},		
		   		{name:'id',index:'note', width:70, sortable:false},		
		   		{name:'id',index:'note', width:70, sortable:false},		
		   		{name:'id',index:'note', width:70, sortable:false}		
			],
	        onSelectRow: function(id) {
	            view_detail("#list",id);
	        },
			mtype: "POST",
		   	rowNum:10,
		   	rowList:[10,20,30],
		   	pager: '#pager',
		    viewrecords: true,
		    autowidth: false,
		    width:950,
		    height:230,
		    sortname: 'id',
		    sortorder: "desc",
		    caption:"부품관리"
		});
		jQuery("#list").jqGrid('navGrid','#pager',{edit:false,add:false,del:false,search:false});
		newForm();
	})
	

    function gridReload() {
        var page = document.searchForm.page.value;
        jQuery("#list").jqGrid('setGridParam', {url:targetUrl,page:page}).trigger("reloadGrid");
    }

    function test_detail(list, id) {
        var chk_data = jQuery(list).jqGrid('getRowData',id);
        var targetUrl = '/admin/product/viewPart?id=' + chk_data.id;
        $.post(targetUrl, function(data, status){
            alert("data:" + data + "\nStatus: " + status);
	    });
    }
    
    function view_detail(list, id) {
    	displayDiv(formDiv);
    	document.getElementById("btnNew").disabled = false;
		var f = document.addForm;
    	f.reset();
    	
        var chk_data = jQuery(list).jqGrid('getRowData',id);
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
    
    function printData() {
        var targetUrl = "/admin/product/viewPart?id=2";
    	$.get(targetUrl, function(data, status){
            $("#postdata").html("data:" + data + "\nStatus: " + status);
//    	$("#postdata").append("data:" + data + "\nStatus: " + status);
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

    var timeoutHnd;
    var flAuto = false;


    function doSearch(ev) {
        if (!flAuto)
            return;
        //	var elem = ev.target||ev.srcElement;
        if (timeoutHnd)
            clearTimeout(timeoutHnd)
        timeoutHnd = setTimeout(gridReload, 500)
    }

</script>

</html>