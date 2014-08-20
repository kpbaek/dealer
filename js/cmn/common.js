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

	function getCodeCombo(cd, selObj) {
		var opt = "";
	    if (cd == "") {
	        deleteOptionElements(selObj);
//	        addOptionElement(selObj, "", "----------------------");
	        return;
	    }
		var targetUrl = '/common/main/listCode?cd=' + cd;
	    $.getJSON(targetUrl, function(result){
//	    	$('#postdata').append(result['cd']['name'] + ":" + cd);
	    	deleteOptionElements(selObj);
//	        addOptionElement(selObj, "", "----------------------");
	    	for(var i=0; i<result['cdAttr'].length; i++){
            	addOptionElement(selObj, result['cdAttr'][i]['value'], result['cdAttr'][i]['text']); 
			}
	    });
	}
	
	function getCodeMultiCombo(cd, selObj, selAr) {
		var targetUrl = '/common/main/listCode?cd=' + cd;
	    $.getJSON(targetUrl, function(result){
	    	$('#postdata').append(result['cd']['name'] + ":" + cd);
	    	for(var i=0; i<result['cdAttr'].length; i++){
	    		var opt = $("<option />", {
	                value: result['cdAttr'][i]['value'],
	                text: result['cdAttr'][i]['text']
	            });
	    		opt.prop("selected", false);
	            selObj.append(opt);
			}
			selObj.multipleSelect("refresh");
			selObj.multipleSelect("setSelects", selAr);
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
	