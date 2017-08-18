            $(function () {
                $(".fwrapper").slice(0, 5).show();
                $("#showb").on('click', function (e) {
                    e.preventDefault();
                    $(".fwrapper:hidden").slice(0, 3).slideDown("slow");
                    if ($(".fwrapper:hidden").length == 0) {
                        $("#showb").fadeOut("fast");
                    } 
                });
              
            });
             
             var ctr = 1;

             function addInput(divName){
                  var newdiv = document.createElement('div');
                  newdiv.innerHTML = " <br><input type='text' name='myInputs[]' id='tags'>";
                  document.getElementById(divName).appendChild(newdiv);
                  counter++;    
            }
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
	                 endingTop: '0%',
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
	              
	              //This part is for sending the username clicked by the user in userfeed.
	              $("a.userNameClicky").click(function() {
	            	 var username = $(this).attr("data-userName");
	            	 console.log("Clicked: " + username);
	            	 
	            	 window.location = "visitThisUser?user=" + username;
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
	              
	              $("#sharef").prop('disabled', true);
	              
	              $("input#pr").click(function() {
	            	 console.log("private clicked"); 
	            	 if($("input#pr").is(':checked'))
	            		 $("#sharef").prop('disabled', false);
	              });
	         
	              $("input#pu").click(function() {
		            	 console.log("public clicked");
		            	 if($("input#pu").is(':checked')) {
		            		 $("#sharef").prop('disabled', true)
		            		 $("#sharef").val("");
		            	 }
		           });
	              
	              $("button#submitTag").click(function() {
		            	 if($("input#tagLoc").val().length == 0  ||$("input#tagLoc").val().length == '') {
		            		 Materialize.toast('Please enter an input!', 3000);
		            	 }
		            	 
		            	 else {
		            		 $("input#idTagHolder").val(photoID);
		            		 $("form#tagForm").submit();
		            	 }
		              });
		              
		              $("button#submitShare").click(function() {
			            	 if($("input#shareLoc").val().length == 0  ||$("input#shareLoc").val().length == '') {
			            		 Materialize.toast('Please enter an input!', 3000);
			            	 }
			            	 
			            	 else {
			            		 $("input#idShareHolder").val(photoID);
			            		 $("form#shareForm").submit();
			            	 }
			           });
	          
             });