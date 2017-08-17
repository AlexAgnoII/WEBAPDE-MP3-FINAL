    	$("a#searchbmodal").click(function() {
	        	$("form#searchBar").submit();
	        });
	        
	        $('.modal').modal({
                dismissible: true, 
                opacity: 0.7,
                startTop: '0%',
                endingTop: '0%',
            });
           