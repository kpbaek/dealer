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
	        addOptionElement(selObj, "", "----------------");
	        return;
	    }
		var targetUrl = '/common/main/listCode?cdGrp=' + cdGrp;
	    $.getJSON(targetUrl, function(result){
//	    	$('#postdata').append(result['cdGrp']['name'] + ":" + cdGrp);
	    	deleteOptionElements(selObj);
	        addOptionElement(selObj, "", "----------------");
	    	for(var i=0; i<result['cdDtl'].length; i++){
            	addOptionElement(selObj, result['cdDtl'][i]['value'], result['cdDtl'][i]['text']); 
			}
	    });
	}
	
