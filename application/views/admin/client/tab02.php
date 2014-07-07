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
	  td.style01 { text-align:center; padding-left:0px; border-bottom:none #000000; border-top:1px solid #000000 !important; border-left:1px solid #000000 !important; border-right:none #000000; font-weight:bold; color:#000000; font-family:'Calibri'; font-size:11pt; background-color:#A0A0A0; }
	  table.sheet0 tr { height:15pt }
	</style>	
		
		
<form id="addForm" name="addForm" method="post">

	<table border="0" cellpadding="1" cellspacing="1" id="sheet0" width=950>
		<col class="col0">
		<col class="col1">
		<col class="col2">
		<col class="col3">
		<col class="col4">
		<tbody>
		  <tr>
			<td colspan=6 class="style01">Please fill in your details below if you want to be a distributor of SB machines. We will contact you soon.</td>
		  </tr>
		  <tr height="5px">
			<td colspan=6></td>
		  </tr>
		  <tr>
			<td width="18%" class="style01">Name</td>
			<td width="5%"><sup>★</sup></td>
			<td width="27%"><input type="text" id="invdate" name="delernm" size=35 style="border: 1"></td>
			<td width="18%" class="style01">Job Title</td>
			<td width="5%"><sup></sup></td>
			<td width="27%"><input type="text" id="invdate" name="delernm" size=35 style="border: 1"></td>
		  </tr>
		  <tr>
			<td class="style01">Company</td>
			<td><sup>★</sup></td>
			<td><input type="text" id="invdate" name="delernm" size=35 style="border: 1"></td>
			<td colspan=3>&nbsp;</td>
		  </tr>
		  <tr>
			<td class="style01">Telephone number</td>
			<td><sup>★</sup></td>
			<td><input type="text" id="invdate" name="delernm" size=35 style="border: 1"></td>
			<td colspan=3>&nbsp;</td>
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
			<td colspan=3>드롭박스. 국가리스트 시트 첨부합니다. 인터넷에서 찾은 자료이니, 사용하시던 것이 있으면, 다른 것을 이용하셔도 무관합니다.</td>
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
			<td><input type="text" id="invdate" name="delernm" size=35 style="border: 1"></td>
			<td colspan=3>&nbsp;</td>
		  </tr>
		  <tr>
			<td class="style01">Main Customer</td>
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
			<td colspan=3><textarea cols="50" rows="3" name="comment"></textarea></td>
			<td>Please comment interesting model name.</td>
		  </tr>
		  <tr>
			<td class="style01">Market Information</td>
			<td><sup></sup></td>
			<td colspan=3><textarea name="comment" cols="50" rows="3"></textarea></td>
			<td>Please describe your market information.</td>
		  </tr>
		  <tr>
			<td class="style01">The number of banks and their branch, CIT, etc.</td>
			<td><sup></sup></td>
			<td><input type="text" id="invdate" name="delernm" size=35 style="border: 1"></td>
			<td colspan=5>&nbsp;</td>
		  </tr>
		  <tr>
			<td class="style01">Bank policies</td>
			<td><sup></sup></td>
			<td><input type="text" id="invdate" name="delernm" size=35 style="border: 1"></td>
			<td colspan=5>&nbsp;</td>
			
		  </tr>
		  <tr>
			<td class="style01">The names of popular models &amp; Price</td>
			<td><sup></sup></td>
			<td><input type="text" id="invdate" name="delernm" size=35 style="border: 1"></td>
			<td colspan=5>&nbsp;</td>
		  </tr>
		  <tr>
			<td colspan=6>&nbsp;</td>
		  </tr>
		  <tr>
			<td colspan=6 align=center>
			<input type="button" value="submit" onclick="javascript:createData();"/>
			</td>
		  </tr>
		</tbody>
	</table>
</form>


<script type="text/javascript">

initForm();

function initForm() {
		var f = document.addForm;
		getCodeCombo("02", f.cntry);
		getCodeCombo("02", f.main_cust);
}
</script>
