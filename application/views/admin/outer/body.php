<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml2/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link rel="stylesheet" type="text/css" href="/lib/ajaxtabs/ajaxtabs.css" />

<script type="text/javascript" src="/lib/ajaxtabs/ajaxtabs.js">

/***********************************************
* Ajax Tabs Content script v2.2- � Dynamic Drive DHTML code library (www.dynamicdrive.com)
* This notice MUST stay intact for legal use
* Visit Dynamic Drive at http://www.dynamicdrive.com/ for full source code
***********************************************/

</script>

</head>

<body>

<h3><a href="/admin/outer?countrytabs=0">외부발송문서</a></h3>

<ul id="countrytabs" class="shadetabs">
<li><a href="/admin/outer/tab01" rel="countrycontainer" class="selected">Proforma invoice</a></li>
<li><a href="/admin/outer/tab02" rel="countrycontainer">INVOICE</a></li>
<li><a href="/admin/outer/tab03" rel="countrycontainer">PACKING LIST</a></li>
</ul>

<div id="countrydivcontainer" style="border:1px solid gray; width:970px; height:550px; margin-bottom: 1em; padding: 10px;overflow: scroll;">
</div>

<script type="text/javascript">

var countries=new ddajaxtabs("countrytabs", "countrydivcontainer")
countries.setpersist(true)
countries.setselectedClassTarget("link") //"link" or "linkparent"
countries.init()

</script>

<p><a href="/admin/outer?countrytabs=0">Reload page and select 1nd tab using URL parameter</a> | <a href="javascript: countries.expandit(3)">Dynamically select last Tab</a></p>

<hr />









<br style="clear: left" />












<script type="text/javascript">

var mypets=new ddajaxtabs("pettabs", "petsdivcontainer")
mypets.setpersist(false)
mypets.setselectedClassTarget("link")
mypets.init()

</script>




</body>
</html>