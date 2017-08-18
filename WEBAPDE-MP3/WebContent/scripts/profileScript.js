            $(function () {
                $(".img").slice(0, 6).show();
                $("#showb").on('click', function (e) {
                    e.preventDefault();
                    $(".img:hidden").slice(0, 3).slideDown("slow");
                    if ($(".img:hidden").length == 0) {
                        $("#showb").fadeOut("fast");
                    } 
                });
              
            });
            
            var photoID;
            var photoName;
            $(document).ready(function() {	            
	            //Submit form once image if clicked.
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
	                startTop: '0%',
	                endingTop: '0%',
	            });
		        
		        $('.picmodal').modal({
		        	dismissible: true, 
		            opacity: 0.85,
		            startTop: '14%',
		            endingTop: '14%',
	            });
	           
		        $('#uploadmodal').modal({
	                dismissible: true, 
	                opacity: 0.85,
	                startTop: '4%',
	                endingTop: '10%',
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
	             
	              $("a.addtagb").click(function() {
	            	  photoID = $(this).attr("data-photoId");
	            	  photoName = $(this).attr("data-photoName");
	            	  console.log("id:" + photoID);
	            	  console.log("name: " + photoName);
	            	  $("span#tagPChosen").html(photoName);
	              });
	              
	              $("a.sharepicb").click(function() {
	            	  photoID = $(this).attr("data-photoId");
	            	  photoName = $(this).attr("data-photoName");
	            	  console.log("id:" + photoID);
	            	  console.log("name: " + photoName);
	            	  $("span#sharePChosen").html(photoName);
	              });
	         });