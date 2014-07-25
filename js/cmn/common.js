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

	function getCodeCombo(cdGrp, selObj) {
	    if (cdGrp == "") {
	        deleteOptionElements(selObj);
//	        addOptionElement(selObj, "", "----------------------");
	        return;
	    }
		var targetUrl = '/common/main/listCode?cdGrp=' + cdGrp;
	    $.getJSON(targetUrl, function(result){
//	    	$('#postdata').append(result['cdGrp']['name'] + ":" + cdGrp);
	    	deleteOptionElements(selObj);
//	        addOptionElement(selObj, "", "----------------------");
	    	for(var i=0; i<result['cdDtl'].length; i++){
            	addOptionElement(selObj, result['cdDtl'][i]['value'], result['cdDtl'][i]['text']); 
			}
	    });
	}
	
	function fncOnlyNumber() { 
		if((event.keyCode<48)||(event.keyCode>57))event.returnValue =false;
	}


	function fncOnlyNumberVal(val)
	{
		return String(val).replace(/\..*|[^\d]/g,'');
	}

	function fncSetNumberFormat(obj)
	{
		var pre = '';
		if(obj.value.length>0)
		{
			if(obj.value.charAt(0)=='-') pre = '-';
		}
		obj.value = pre+(obj.value.replace(/\..*|[^\d]/g,'')).toCommify();
		alert(obj.value);
	}
	