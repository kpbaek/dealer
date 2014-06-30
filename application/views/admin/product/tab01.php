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
<table id="list2"></table>
<div id="pager2"></div>
<div id="myDiv">
<form name="viewForm">
<input type="text" id="id">
<input type="text" id="invdate">
</form>
</div>


<script type="text/javascript">

	var targetUrl = "/admin/product/listPart";
	jQuery("#list2").jqGrid({
	   	//url:'/test/main/server',
	   	url:'/admin/product/listPart',
	   	datatype: "json",
	   	//colNames:['Inv No','Date', 'Client', 'Amount','Tax','Total','Notes'],
	   	colNames:['Model', 'S/N', 'CODE', 'Part Name', 'IMAGE', 'Remark', 'Recommend', 'Spare Part', 'Wear Parts',  'Without Warranty'],
   	              //, '(1CIS)', '(2CIS)', 'Q(Per 1Unit)', 'Order Price', 'Amount'
	   	colModel:[
	   		{name:'id',index:'id', width:70, align:"right"},
	   		{name:'id',index:'invdate', width:70},
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
            view_detail("#list2",id);
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
	jQuery("#list2").jqGrid('navGrid','#pager2',{edit:false,add:false,del:false,search:false});


    function gridReload() {
        var page = document.searchForm.page.value;
        jQuery("#list2").jqGrid('setGridParam', {url:targetUrl,page:page}).trigger("reloadGrid");
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
    
    function view_detail2(list, id) {
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