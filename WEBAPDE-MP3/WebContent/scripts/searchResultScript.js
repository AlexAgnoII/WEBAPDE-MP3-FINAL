    	

		$(document).ready(function() {
			$("a#searchbmodal").click(function() {
	        	var searchTerm = $("#searchbox").val();
	        	var temp = searchTerm;
	        	if(searchTerm.length == 0 || $.trim(temp) == '' )
	        		Materialize.toast('Please enter an input!', 3000) 
	        	else
	        		window.location = "photoSearch?searchTerm=" + searchTerm;
	        });
			
			$("#searchbox").on('keyup', function (e) {
			    if (e.keyCode == 13) {
		        	var searchTerm = $("#searchbox").val();
		        	var temp = searchTerm;
		        	if(searchTerm.length == 0 || $.trim(temp) == '' )
		        		Materialize.toast('Please enter an input!', 3000) 
		        	else
		        		window.location = "photoSearch?searchTerm=" + searchTerm;
			    }
			});
	        
            
            $('.modal').modal({
                dismissible: true, 
                opacity: 0.7,
                endingTop: '0%',
            });

             $('#sharepicmodal').modal({
                dismissible: true, 
                opacity: 0.85,
                startTop: '4%',
                endingTop: '10%',
            });

             $('#addtagmodal').modal({
                dismissible: true, 
                opacity: 0.85,
                startTop: '4%',
                endingTop: '10%',
            });
		});

           