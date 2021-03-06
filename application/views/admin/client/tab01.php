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
		  <tr class="row0">
			<td colspan=4 class="style01">Please fill in your details below. Local distributor will contact you soon.</td>
		  </tr>
		  <tr height="5px">
			<td colspan=4></td>
		  </tr>
		  <tr>
			<td width="17%" class="style01">Name</td>
			<td width="3%"><sup>★</sup></td>
			<td width="35%"><input type="text" id="invdate" name="delernm" size=30 style="border: 1"></td>
			<td>&nbsp;</td>
		  </tr>
		  <tr>
			<td class="style01">Company</td>
			<td class="column1">&nbsp;</td>
			<td><input type="text" id="company" name="company" size=30 style="border: 1"></td>
			<td class="column3">&nbsp;</td>
		  </tr>
		  <tr>
			<td class="style01">Business type</td>
			<td width="3%"><sup>★</sup></td>
			<td>
				<select name="biztype">
				</select>
			</td>
			<td class="column3 style7 s">드롭박스. Bank, Cash centre, CIT, Distributor, Gaming, Retailer, Other</td>
		  </tr>
		  <tr>
			<td class="style01">Address</td>
			<td class="column1">&nbsp;</td>
			<td colspan=2><input type="text" id="address" name="address" size=50 style="border: 1;"></td>
		  </tr>
		  <tr>
			<td class="style01">Country</td>
			<td width="3%"><sup>★</sup></td>
			<td class="column2 style13 s">
				<select name="country">
				</select>
			</td>
			<td class="column3 style0 s">드롭박스. 국가리스트 시트 첨부합니다. 인터넷에서 찾은 자료이니, 사용하시던 것이 있으면, 다른 것을 이용하셔도 무관합니다.</td>
		  </tr>
		  <tr>
			<td class="style01">Email address</td>
			<td width="3%"><sup>★</sup></td>
			<td><input type="text" id="email" name="email" size=30 style="border: 1"></td>
			<td class="column3">&nbsp;</td>
		  </tr>
		  <tr>
			<td class="style01">Telephone number</td>
			<td width="3%"><sup>★</sup></td>
			<td><input type="text" id="tel" name="tel" size=30 style="border: 1"></td>
			<td class="column3">&nbsp;</td>
		  </tr>
		  <tr>
			<td class="style01">Comments</td>
			<td class="column1">&nbsp;</td>
			<td><textarea id="comment" name="comment" cols=50 rows=5></textarea></td>
			<td class="column2 style14 s">Please comment interesting model name.</td>
		  </tr>
		  <tr class="row19">
			<td class="column0">&nbsp;</td>
			<td class="column1">&nbsp;</td>
			<td class="column2 style11 null"></td>
			<td class="column3 style12 null"></td>
		  </tr>
		  <tr class="row23">
			<td class="column0">&nbsp;</td>
			<td class="column1">&nbsp;</td>
			<td class="column2 style15 s">
			<input type="button" value="submit" onclick="javascript:createData();"/>
			</td>
			<td class="column3">&nbsp;</td>
		  </tr>
		</tbody>
	</table>
</form>


<script type="text/javascript">

initForm();

function initForm() {
		var f = document.addForm;
		getCodeCombo("02", f.biztype);
		getCodeCombo("02", f.country);
}
</script>


