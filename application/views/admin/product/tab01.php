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
	  td.style0 { vertical-align:bottom; border-bottom:none #000000; border-top:none #000000; border-left:none #000000; border-right:none #000000; color:#000000; font-family:'Calibri'; font-size:11pt; background-color:white }
	  td.style1 { vertical-align:bottom; border-bottom:none #000000; border-top:none #000000; border-left:none #000000; border-right:none #000000; color:#000000; font-family:'Calibri'; font-size:11pt; background-color:white }
	  td.style2 { vertical-align:bottom; border-bottom:none #000000; border-top:none #000000; border-left:none #000000; border-right:none #000000; font-weight:bold; text-decoration:underline; color:#000000; font-family:'Candara'; font-size:20pt; background-color:white }
	  td.style3 { vertical-align:bottom; text-align:right; padding-right:0px; border-bottom:none #000000; border-top:none #000000; border-left:none #000000; border-right:none #000000; color:#000000; font-family:'Calibri'; font-size:11pt; background-color:white }
	  td.style4 { vertical-align:middle; text-align:justify; border-bottom:none #000000; border-top:none #000000; border-left:none #000000; border-right:none #000000; color:#000000; font-family:'Calibri'; font-size:11pt; background-color:white }
	  td.style5 { vertical-align:bottom; border-bottom:none #000000; border-top:none #000000; border-left:none #000000; border-right:none #000000; color:#000000; font-family:'Calibri'; font-size:11pt; background-color:white }
	  td.style6 { vertical-align:bottom; border-bottom:none #000000; border-top:1px solid #000000 !important; border-left:1px solid #000000 !important; border-right:none #000000; color:#000000; font-family:'Calibri'; font-size:11pt; background-color:white }
	  td.style7 { vertical-align:bottom; border-bottom:none #000000; border-top:none #000000; border-left:1px solid #000000 !important; border-right:none #000000; color:#000000; font-family:'Calibri'; font-size:11pt; background-color:white }
	  td.style8 { vertical-align:bottom; border-bottom:1px solid #000000 !important; border-top:none #000000; border-left:1px solid #000000 !important; border-right:none #000000; color:#000000; font-family:'Calibri'; font-size:11pt; background-color:white }
	  td.style9 { vertical-align:bottom; border-bottom:none #000000; border-top:1px solid #000000 !important; border-left:none #000000; border-right:none #000000; color:#000000; font-family:'Calibri'; font-size:11pt; background-color:white }
	  td.style10 { vertical-align:bottom; border-bottom:1px solid #000000 !important; border-top:none #000000; border-left:none #000000; border-right:none #000000; color:#000000; font-family:'Calibri'; font-size:11pt; background-color:white }
	  td.style11 { vertical-align:bottom; border-bottom:none #000000; border-top:1px solid #000000 !important; border-left:none #000000; border-right:1px solid #000000 !important; color:#000000; font-family:'Calibri'; font-size:11pt; background-color:white }
	  td.style12 { vertical-align:bottom; border-bottom:none #000000; border-top:none #000000; border-left:none #000000; border-right:1px solid #000000 !important; color:#000000; font-family:'Calibri'; font-size:11pt; background-color:white }
	  td.style13 { vertical-align:bottom; border-bottom:1px solid #000000 !important; border-top:none #000000; border-left:none #000000; border-right:1px solid #000000 !important; color:#000000; font-family:'Calibri'; font-size:11pt; background-color:white }
	  td.style14 { vertical-align:bottom; text-align:right; padding-right:0px; border-bottom:3px solid #993300 !important; border-top:3px solid #993300 !important; border-left:3px solid #993300 !important; border-right:none #000000; font-weight:bold; color:#000000; font-family:'Calibri'; font-size:11pt; background-color:white }
	  td.style15 { vertical-align:bottom; border-bottom:3px solid #993300 !important; border-top:3px solid #993300 !important; border-left:none #000000; border-right:3px solid #993300 !important; font-weight:bold; color:#000000; font-family:'Calibri'; font-size:11pt; background-color:white }
	  td.style16 { vertical-align:bottom; border-bottom:none #000000; border-top:none #000000; border-left:none #000000; border-right:none #000000; color:#000000; font-family:'Calibri'; font-size:11pt; background-color:#808080 }
	  td.style17 { vertical-align:bottom; border-bottom:none #000000; border-top:none #000000; border-left:none #000000; border-right:none #000000; color:#FFFFFF; font-family:'Calibri'; font-size:11pt; background-color:#808080 }
	  td.style18 { vertical-align:bottom; border-bottom:none #000000; border-top:none #000000; border-left:none #000000; border-right:none #000000; color:#FFFFFF; font-family:'Calibri'; font-size:11pt; background-color:#808080 }
	  td.style19 { vertical-align:bottom; text-align:right; padding-right:0px; border-bottom:none #000000; border-top:1px solid #000000 !important; border-left:none #000000; border-right:none #000000; font-weight:bold; color:#000000; font-family:'Calibri'; font-size:11pt; background-color:#A0A0A0 }
	  td.style20 { vertical-align:bottom; text-align:left; padding-left:0px; border-bottom:none #000000; border-top:1px solid #000000 !important; border-left:1px solid #000000 !important; border-right:none #000000; font-weight:bold; color:#000000; font-family:'Calibri'; font-size:11pt; background-color:#A0A0A0 }
	  td.style21 { vertical-align:bottom; text-align:left; padding-left:0px; border-bottom:none #000000; border-top:1px solid #000000 !important; border-left:none #000000; border-right:none #000000; font-weight:bold; color:#000000; font-family:'Calibri'; font-size:11pt; background-color:#A0A0A0 }
	  td.style22 { vertical-align:bottom; text-align:right; padding-right:0px; border-bottom:none #000000; border-top:1px solid #000000 !important; border-left:none #000000; border-right:1px solid #000000 !important; font-weight:bold; color:#000000; font-family:'Calibri'; font-size:11pt; background-color:#A0A0A0 }
	  td.style23 { vertical-align:bottom; border-bottom:none #000000; border-top:none #000000; border-left:none #000000; border-right:none #000000; font-weight:bold; text-decoration:underline; color:#FFFFFF; font-family:'Candara'; font-size:20pt; background-color:#808080 }
	  td.style24 { vertical-align:bottom; border-bottom:none #000000; border-top:none #000000; border-left:none #000000; border-right:none #000000; color:#000000; font-family:'Calibri'; font-size:8pt; background-color:white }
	  table.sheet0 col.col0 { width:42pt }
	  table.sheet0 col.col1 { width:42pt }
	  table.sheet0 col.col2 { width:42pt }
	  table.sheet0 col.col3 { width:42pt }
	  table.sheet0 col.col4 { width:42pt }
	  table.sheet0 col.col5 { width:42pt }
	  table.sheet0 col.col6 { width:42pt }
	  table.sheet0 col.col7 { width:42pt }
	  table.sheet0 col.col8 { width:42pt }
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
    	<input type="button" value="신규" onclick="javascript:displayDiv(formDiv);"/>
    </td>
</tr>
</table>
</div>
<span id="postdata"></span>

<div id="formDiv" style="display:">
<form name="addForm" method="post" accept-charset="utf-8" enctype="multipart/form-data">
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
		<tr class="row2" style="background-color:#A0A0A0">
			<td class="column0 style20 null">Model</td>
			<td class="column1 style20 null">S/N</td>
			<td class="column2 style20 null">CODE</td>
			<td class="column3 style20 s">Part Name</td>
		</tr>
		<tr>
			<td><input type="text" id="id" name="id" size=5 style="border-style: none;"></td>
			<td><input type="text" id="invdate" name="invdate" size=12 style="border-style: none;"></td>
			<td></td>
			<td></td>
		</tr>
		<tr class="row2" style="background-color:#A0A0A0">
			<td class="column5 style20" colspan=3>IMAGE</td>
			<td class="column5 style20">Remark</td>
		</tr>
		<tr>
			<td colspan=3><input type="file" name="userfile" size="20">
			<iframe name="ifUpload" scrolling="no" marginheight="0" marginwidth="0" frameborder="0" width="50" height=50></iframe></td>
			<td><textarea rows="3" cols="70"></textarea></td>
		</tr>
		<tr>
			<td class="column6 style20 null">Recommend</td>
			<td class="column7 style20 null">Spare Part</td>
			<td class="column8 style20 null">Wear Parts</td>
			<td class="column9 style20 null">Without Warranty</td>
		</tr>
		  <tr>
			<td><input type="text" id="Recommend" name="id" size=5 style="border-style: none;"></td>
			<td><input type="text" id="SparePart" name="id" size=5 style="border-style: none;"></td>
			<td><input type="text" id="WearParts" name="id" size=5 style="border-style: none;"></td>
			<td><input type="text" id="Warranty" name="id" size=5 style="border-style: none;"></td>
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
	   		{name:'id',index:'name asc, invdate', width:70},
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
    
    function printData() {
        var targetUrl = "/admin/product/viewPart?id=2";
    	$.get(targetUrl, function(data, status){
            $("#postdata").append("data:" + data + "\nStatus: " + status);
		});
	}

    function displayDiv(targetDiv) {
       if(targetDiv.style.display=="none"){
    	   targetDiv.style.display="";    
       }
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