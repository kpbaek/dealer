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

<h3><a href="http://www.dynamicdrive.com/dynamicindex17/ajaxtabscontent/">order</a></h3>

<ul id="countrytabs" class="shadetabs">
<li><a href="#" rel="#default" class="selected">Tab 1</a></li>
<li><a href="/admin/main/external2.htm" rel="countrycontainer">Tab 2</a></li>
<li><a href="/external3.htm" rel="countrycontainer">Tab 3</a></li>
<li><a href="/external4.htm" rel="#iframe">Tab 4</a></li>
<li><a href="/user_guide/index.html" rel="#iframe">process</a></li>
</ul>

<div id="countrydivcontainer" style="border:1px solid gray; width:750px; height:500px; margin-bottom: 1em; padding: 10px">
<p>This is some default tab content, embedded directly inside this space and not via Ajax. It can be shown when no tabs are automatically selected, or associated with a certain tab, in this case, the first tab.</p>
</div>

<script type="text/javascript">

var countries=new ddajaxtabs("countrytabs", "countrydivcontainer")
countries.setpersist(true)
countries.setselectedClassTarget("link") //"link" or "linkparent"
countries.init()

</script>

<p><a href="/admin/client?countrytabs=0">Reload page and select 1nd tab using URL parameter</a> | <a href="javascript: countries.expandit(3)">Dynamically select last Tab</a></p>

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