<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" type="text/css" media="screen" href="/lib/js/themes/redmond/jquery-ui.custom.css"></link>	
	<link rel="stylesheet" type="text/css" media="screen" href="/lib/jquery.jqGrid-4.6.0/plugins/ui.multiselect.css"></link>	
	<link rel="stylesheet" type="text/css" media="screen" href="/lib/jquery.jqGrid-4.6.0/css/ui.jqgrid.css"></link>	
	<link rel="stylesheet" type="text/css" media="screen" href="/lib/jquery.jqGrid-4.6.0/plugins/searchFilter.css"></link>	
		
	<script src="/js/cmn/common.js" type="text/javascript"></script>
	<script src="/lib/jquery.jqGrid-4.6.0/js/jquery-1.11.0.min.js" type="text/javascript"></script>
	
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
			<td colspan=10></td>
		  </tr>
		  <tr>
			<td width="20%" class="style01" colspan=2>Company Name</td>
			<td width="30%" colspan=3>Kosovo - Treo</td>
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
			<td class="style01">Date</td>
			<td>2004-03-14</td>
			<td class="style01">P/O NO.</td>
			<td><input type="text" id="remark" name="po_no" value="15220" size=10 style="border: 1"></td>
			<td colspan=3></td>
		  </tr>
		  <tr>
			<td class="style01" colspan=2>P/I NO. </td>
			<td>PI-120403-2</td>
			<td></td>
			<td></td>
			<td class="style01">Q'TY</td>
			<td><input type="text" id="remark" name="qty" value="20" size=10 style="border: 1"></td>
			<td colspan=3></td>
		  </tr>
		  <tr>
			<td rowspan="4" class="style01" colspan=2>Currency</td>
			<td class="style02">C1</td>
			<td class="style02">C2</td>
			<td class="style02">C3</td>
			<td class="style02">C4</td>
			<td class="style02">C5</td>
		  	<td colspan=3></td>
		  </tr>
		  <tr>
			<td>
				<select name="C1">
				</select>
			</td>
			<td>
				<select name="C2">
				</select>
			</td>
			<td>
				<select name="C3">
				</select>
			</td>
			<td>
				<select name="C4">
				</select>
			</td>
			<td>
				<select name="C5">
				</select>
			</td>
		  </tr>
		  <tr>
			<td class="style02">C6</td>
			<td class="style02">C7</td>
			<td class="style02">C8</td>
			<td class="style02">C9</td>
			<td class="style02">C10</td>
		   	<td colspan=3></td>
		  </tr>
		  <tr>
			<td>
				<select name="C6">
				</select>
			</td>
			<td>
				<select name="C7">
				</select>
			</td>
			<td>
				<select name="C8">
				</select>
			</td>
			<td>
				<select name="C9">
				</select>
			</td>
			<td>
				<select name="C10">
				</select>
			</td>
		  	<td colspan=3></td>
		  </tr>
		  <tr>
			<td rowspan="2" class="style01">Serial Number</td>
			<td rowspan="2" class="style01">
				<select name="srl">
				</select>
			</td>
			<td class="style02">C1</td>
			<td class="style02">C2</td>
			<td class="style02">C3</td>
			<td class="style02">C4</td>
			<td class="style02">C5</td>
		   	<td colspan=3></td>
		  </tr>
		  <tr>
			<td>
				<select name="C1">
				</select>
			</td>
			<td>
				<select name="C2">
				</select>
			</td>
			<td>
				<select name="C3">
				</select>
			</td>
			<td>
				<select name="C4">
				</select>
			</td>
			<td>
				<select name="C5">
				</select>
			</td>
			<td colspan="3"></td>
		  </tr>
		  <tr>
			<td class="style01" colspan=2 rowspan=2>Detector</td>
			<td class="style02">UV</td>
			<td class="style02">MG</td>
			<td class="style02">MRA</td>
			<td class="style02">IR</td>
			<td class="style02">MDD</td>
			<td class="style02" width="10%">CIS</td>
			<td class="style02" width="10%">Tape Detector</td>
			<td></td>
		  </tr>
		  <tr>
			<td>
				<select name="uv">
				</select>
			</td>
			<td>
				<select name="mg">
				</select>
			</td>
			<td>
				<select name="mra">
				</select>
			</td>
			<td>
				<select name="ir">
				</select>
			</td>
			<td>
				<select name="mdd">
				</select>
			</td>
			<td>
				<select name="cis">
				</select>
			</td>
			<td>
				<select name="tape_detector">
				</select>
			</td>
		   	<td></td>
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
				<select name="power_cable">
				</select>
			</td>
		   	<td colspan=7></td>
		  </tr>
		  <tr class="row18">
			<td class="style01" colspan=2>Other Options</td>
			<td class="style02">LAN</td>
			<td>
				<select name="lan">
				</select>
			</td>
			<td class="style02">SV-200</td>
			<td>
				<select name="sv200">
				</select>
			</td>
			<td class="style02">Printer</td>
			<td>
				<select name="printer">
				</select>
			</td>
			<td class="style02">SDP-7</td>
			<td>
				<select name="sdp7">
				</select>
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
			<td class="style01" colspan=2>Unit Price</td>
			<td colspan=2><input type="text" id="unit_price" name="unit_price" value="USD 10,000" size=10 style="border: 1"></td>
			<td class="style01">Total Amount</td>
			<td colspan=2><input type="text" id="tot_amt" name=""tot_amt"" value="USD 2,000.00" size=20 style="border: 1"></td>
		   	<td colspan=5></td>
		  </tr>
		  <tr>
			<td class="style01" colspan=2>Remark</td>
			<td colspan=9><input type="text" id="remark" name="tel" size=120 style="border: 1"></td>
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

initForm();

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
		getCodeCombo("01", f.power_cable);
		getCodeCombo("01", f.lan);
		getCodeCombo("01", f.sv200);
		getCodeCombo("01", f.printer);
		getCodeCombo("01", f.sdp7);
		getCodeCombo("01", f.uv);
		getCodeCombo("01", f.mg);
		getCodeCombo("01", f.mra);
		getCodeCombo("01", f.ir);
		getCodeCombo("01", f.mdd);
		getCodeCombo("01", f.cis);
		getCodeCombo("01", f.tape_detector);
		getCodeCombo("02", f.rej_pocket_tp);
}
</script>


