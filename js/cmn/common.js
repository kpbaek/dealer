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
	
	function getCodeCombo(cd, selObj, sVal) {
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
	        addOptionElement(selObj, "", "select");
	    	for(var i=0; i<result['cdAttr'].length; i++){
	    		var value = result['cdAttr'][i]['value'];
            	addOptionElement(selObj, value, result['cdAttr'][i]['text']); 
	    		if(value == sVal){
	    			selObj.selectedIndex = (i+1);
	    		}
			}
	    });
	}
	
	function getOXCombo(selObj) {
        addOptionElement(selObj, "", "select");
        addOptionElement(selObj, "O", "O");
        addOptionElement(selObj, "X", "X");
	}
	
	function getCodeImgCombo(cd, selObj, sVal) {
		var opt = "";
		if (cd == "") {
			deleteOptionElements(selObj);
//	        addOptionElement(selObj, "", "----------------------");
			return;
		}
		var targetUrl = '/common/main/listCodeImg?cd=' + cd;
		$.getJSON(targetUrl, function(result){
//	    	$('#postdata').append(result['cd']['name'] + ":" + cd);
			deleteOptionElements(selObj);
			addOptionElement(selObj, "", "select");
			for(var i=0; i<result['cdAttr'].length; i++){
//				alert(result['opt'][i]);
	    		var value = result['cdAttr'][i]['value'];
	    		var text = result['cdAttr'][i]['text'];
				var opt = new Option(text, value);
//				$(opt).data("image", "/images/common/dropdown/00E0/00E00004.png");
				$(opt).data("image", result['opt'][i]['image']);
				selObj.add(opt);
	    		if(value == sVal){
	    			selObj.options[i].selected = "selected";
	    		}
			}
			$(selObj).msDropdown({roundedBorder:false});
			
		});
	}
	
	function getWorkerCombo(atcd, selObj, sVal) {
		var opt = "";
	    if (atcd == "") {
	        deleteOptionElements(selObj);
//	        addOptionElement(selObj, "", "----------------------");
	        return;
	    }
		var targetUrl = '/common/main/listWorker?atcd=' + atcd;
	    $.getJSON(targetUrl, function(result){
//	    	$('#postdata').append(result['cd']['name'] + ":" + cd);
	    	deleteOptionElements(selObj);
	        addOptionElement(selObj, "", "select");
	    	for(var i=0; i<result['cdAttr'].length; i++){
	    		var value = result['cdAttr'][i]['value'];
            	addOptionElement(selObj, value, result['cdAttr'][i]['text']); 
	    		if(value == sVal){
	    			selObj.selectedIndex = (i+1);
	    		}
			}
	    });
	}
	
	function getModelCombo(atcd, selObj, sVal) {
		var opt = "";
		var targetUrl = '/common/main/listModel?atcd=' + atcd;
	    $.getJSON(targetUrl, function(result){
//	    	$('#postdata').append(result['cd']['name'] + ":" + cd);
	    	deleteOptionElements(selObj);
	        addOptionElement(selObj, "", "select");
	    	for(var i=0; i<result['cdAttr'].length; i++){
	    		var value = result['cdAttr'][i]['value'];
            	addOptionElement(selObj, value, result['cdAttr'][i]['text']); 
	    		if(value == sVal){
	    			selObj.selectedIndex = (i+1);
	    		}
			}
	    });
	}
	
	function getCodeMultiCombo(cd, selObj, selAr) {
		var targetUrl = '/common/main/listCode?cd=' + cd;
	    $.getJSON(targetUrl, function(result){
//	    	$('#postdata').append(result['cd']['name'] + ":" + cd);
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
	