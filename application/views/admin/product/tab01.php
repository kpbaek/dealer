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
</head>
<div id="searchDiv" style="display:none">
<form name="searchForm">
<input type="text" name="page">
<a href="javascript:gridReload();" id="search">page</a>
</form>
</div>
<table id="list"></table>
<div id="pager2"></div>
<div id="myDiv">
<form id="viewForm">
<input type="text" id="id" name="id">
<input type="text" id="invdate" name="invdate">
</form>
</div>
<span id="postdata"></span>
<?php #echo form_open_multipart('upload/do_upload');?>
<form name="addForm" method="post" accept-charset="utf-8" enctype="multipart/form-data">
<table width="400" border="0">
    <tr>
        <td width="350" align="left">
			<input type="file" name="userfile" size="20" />
        </td>
        <td width="50" align="left" valign=absmiddle>
            <iframe name="ifUpload" scrolling="no" marginheight="0" marginwidth="0" frameborder="0" width="50" height=50></iframe>
        </td>
    </tr>
    <tr>
        <td colspan=2 align="left">
			<input type="button" value="upload" onclick="javascript:createData();"/>
        </td>
    </tr>
    </table>
</form>


<script type="text/javascript">

	var targetUrl = "/admin/product/listPart";
	jQuery("#list").jqGrid({
	   	//url:'/test/main/server',
	   	url:targetUrl,
	   	datatype: "json",
	   	//colNames:['Inv No','Date', 'Client', 'Amount','Tax','Total','Notes'],
	   	colNames:['Model', 'S/N', 'CODE', 'Part Name', 'IMAGE', 'Remark', 'Recommend', 'Spare Part', 'Wear Parts',  'Without Warranty'],
   	              //, '(1CIS)', '(2CIS)', 'Q(Per 1Unit)', 'Order Price', 'Amount'
	   	colModel:[
	   		{name:'id',index:'id', width:70, align:"right"},
	   		{name:'invdate',index:'invdate', width:70},
	   		{name:'id',index:'name asc, invdate', width:70},
	   		{name:'id',index:'amount', width:70, align:"right"},
	   		{name:'id',index:'tax', width:70, align:"right"},		
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
	   	pager: '#pager2',
	    viewrecords: true,
	    autowidth: false,
	    width:950,
	    height:230,
	    sortname: 'id',
	    sortorder: "desc",
	    caption:"부품관리"
	});
	jQuery("#list").jqGrid('navGrid','#pager2',{edit:false,add:false,del:false,search:false});


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
        var chk_data = jQuery(list).jqGrid('getRowData',id);
        var targetUrl = '/admin/product/viewPart?id=' + chk_data.id;
        $.getJSON(targetUrl, function(result){
	        $.each(result, function(i, field){
            	document.getElementById("id").value = field.id;
                document.getElementById("invdate").value = result['viewPart']['invdate'];
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
    
    function printData(params) {
        var targetUrl = "/admin/product/viewPart?id=2";
    	$.get(targetUrl, function(data, status){
            alert("data:" + data + "\nStatus: " + status);
            $("#postdata").append(data);
		});
	}

    function createData() {
		var f = document.addForm;
		f.target ="ifUpload";
		f.action = "/upload/do_upload";
		f.submit();
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