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
	
	<script src="/js/cmn/common.js" type="text/javascript"></script>
	<script src="/lib/jquery.jqGrid-4.6.0/js/jquery-1.11.0.min.js" type="text/javascript"></script>
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
	  td.style02 { vertical-align:middle; text-align:center; padding-left:0px; border-bottom:none #000000; border-top:1px solid #000000 !important; border-left:1px solid #000000 !important; border-right:none #000000; font-weight:bold; color:#000000; font-family:'Calibri'; font-size:11pt; background-color:#D0A0A0 }
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
		
		
<form id="addForm" name="addForm" method="post">
<table border="0" cellpadding="1" cellspacing="1" id="sheet0" width="950">
		<col class="col0">
		<col class="col1">
		<col class="col2">
		<col class="col3">
		<tbody>
		  <tr class="row0" bgcolor="white">
			<td colspan=10 class="style01">Purchase Order</td>
		  </tr>
		  <tr height="5px">
			<td width="20%" class="style01" colspan=2>Date</td>
			<td width="30%" colspan=3>2004-03-14</td>
		  	<td colspan=5></td>
		  </tr>
		  <tr>
			<td width="20%" class="style01" colspan=2>Company Name</td>
			<td width="30%" colspan=2>Kosovo - Treo</td>
			<td width="10%" class="style01">Model</td>
			<td width="10%">
				<select name="model">
				</select>
			</td>
			<td width="30%" colspan=3></td>
		  </tr>
		  <tr>
		  	<td class="style01" colspan=2>No.</td>
			<td>SWM-1204-07</td>
			<td></td>
			<td class="style01">P/O NO.</td>
			<td><input type="text" id="remark" name="po_no" value="15220" size=10 style="border: 1"></td>
			<td colspan=3></td>
		  </tr>
		  <tr>
			<td class="style01" colspan=2>P/I NO. </td>
			<td>PI-120403-2</td>
			<td></td>
			<td class="style01">Q'TY</td>
			<td><input type="text" id="remark" name="qty" value="20" size=10 style="border: 1"></td>
			<td colspan=3></td>
		  </tr>
		  <tr>
			<td rowspan="2" class="style01" colspan=2>Currency</td>
		  	<td colspan=8></td>
		  </tr>
		  <tr>
			<td>
			    <div class="form-group">
			        <select id="currency" multiple="multiple" class="form-control" style="width: 150px">
			            <option value="1" selected>CHF</option>
			            <option value="2">GBP</option>
			            <option value="3" selected>USD</option>
			            <option value="4">EUR</option>
			        </select>
			    </div>
			</td>
		  	<td></td>
			<td class="style01">Serial Number</td>
			<td class="style01">
				<select name="srl">
				</select>
			</td>
			<td>
			    <div class="form-group">
			        <select id="currency2" multiple="multiple" class="form-control" style="width: 150px">
			            <option value="1" selected>CHF</option>
			            <option value="2" selected>GBP</option>
			            <option value="3" selected>USD</option>
			            <option value="4">EUR</option>
			        </select>
			    </div>
			</td>
		  </tr>
		  <tr>
			<td class="style01" colspan=2>LCD Color</td>
			<td colspan=2>
				<select name="lcd_color">
				</select>
			</td>
			<td class="style01">LCD Language</td>
			<td>
				<select name="lcd_lang">
				</select>
			</td>
		   	<td colspan=4></td>
		  </tr>
		  <tr>
			<td class="style01" colspan=2>Reject Pocket Type</td>
			<td colspan=3>
				<select name="rej_pocket_tp">
				</select>
			</td>
			
			<td colspan=5></td>
		  </tr>
		  <tr class="row18">
			<td class="style01" colspan=2>Power Cable</td>
			<td>
			    <select style="width:200px" name="power_cable" id="power_cable">
			      <option value="006" data-image="/images/common/dropdown/image006.png">220V UK 향</option>
			      <option value="007" data-image="/images/common/dropdown/image007.png">220V India 향</option>
			      <option value="008" data-image="/images/common/dropdown/image008.png" name="cd">230V 호주 향</option>
			      <option value="011"  data-image="/images/common/dropdown/image011.png">110V 미국 향</option>
			      <option value="012" data-image="/images/common/dropdown/image012.png" selected>220V 한국 향</option>
			      <option value="013" data-image="/images/common/dropdown/image013.png">220V Israel향</option>
			    </select>
    		</td>
		   	<td colspan=1></td>
			<td class="style01" colspan=2>Other Options</td>
			<td colspan=3>
			    <div class="form-group">
			        <select id="other_options" multiple="multiple" class="form-control" style="width: 250px">
			            <option value="1">LAN</option>
			            <option value="2">SV-200</option>
			            <option value="3">Printer</option>
			            <option value="4">SDP-7</option>
			        </select>
			    </div>
			</td>
		  </tr>
		  <tr>
			<td class="style01" colspan=2>Accessaries(Bill Guide, Brush)</td>
			<td class="style02">Serial Printer Cable</td>
			<td>
				<select name="serial_prn_cable">
				</select>
			</td>
			<td class="style02">Calibration Sheet</td>
			<td>
				<select name="calibration_sheet">
				</select>
			</td>
			<td class="style02">PC Cable (USB A to B)</td>
			<td>
				<select name="pc_cable">
				</select>
			</td>
			<td colspan=2></td>
		  </tr>
		  <tr>
			<td class="style01" colspan=2>Shipped by</td>
			<td>
				<select name="shipped_by1">
				</select>
			</td>
			<td>
				<select name="shipped_by2">
				</select>
			</td>
			<td class="style01">Account no</td>
			<td><input type="text" id="acct_no" name="acct_no" value="" size=10 style="border: 1"></td>
			<td colspan=5></td>
		  </tr>
		  <tr>
			<td class="style01" colspan=2>Delivery</td>
			<td colspan=2><input type="text" id="delivery" name="tel" value="2014-02-05" size=30 style="border: 1"></td>
			<td class="style01">Payment</td>
			<td>
				<select name="payment">
				</select>
			</td>
			<td class="style01">Incoterms</td>
			<td>
				<select name="incoterms">
				</select>
			</td>
		   	<td colspan=3></td>
		  </tr>
		  <tr>
			<td class="style01" colspan=2>Remark</td>
			<td colspan=9><textarea id="remark" name="remark" cols=50 rows=5></textarea></td>
		  </tr>
		  <tr height=5px>
			<td colspan=10></td>
		  </tr>
		  <tr>
			<td colspan=10 align=center>
			<input type="button" value="Forwarder information or other requests" onclick="javascript:createData();"/>
			</td>
		  </tr>
		</tbody>
	</table>
</form>


<script type="text/javascript">


function initForm() {
		var f = document.addForm;
		getCodeCombo("02", f.model);
		getCodeCombo("02", f.srl);
		getCodeCombo("02", f.lcd_color);
		getCodeCombo("02", f.lcd_lang);
		getCodeCombo("02", f.shipped_by1);
		getCodeCombo("02", f.shipped_by2);
		getCodeCombo("02", f.payment);
		getCodeCombo("02", f.incoterms);
		getCodeCombo("01", f.serial_prn_cable);
		getCodeCombo("01", f.calibration_sheet);
		getCodeCombo("01", f.pc_cable);
//		getCodeCombo("01", f.power_cable);
		getCodeCombo("01", f.lan);
		getCodeCombo("01", f.sv200);
		getCodeCombo("01", f.printer);
		getCodeCombo("01", f.sdp7);

		getCodeCombo("02", f.rej_pocket_tp);
}

$(function() {
    $('#currency').change(function() {
        console.log($(this).val());
    }).multipleSelect();
});

$(function() {
    $('#currency2').change(function() {
        console.log($(this).val());
    }).multipleSelect();
});

$(function() {
    $('#other_options').change(function() {
        console.log($(this).val());
    }).multipleSelect();
});

$(document).ready(function(e) {	
	initForm();
	$("#power_cable").msDropdown({roundedBorder:false});
});


</script>


