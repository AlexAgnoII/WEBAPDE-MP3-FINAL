		
		var photoID;
		var photoName;
		$(document).ready(function() {
			$("a#searchbmodal").click(function() {
	        	var searchTerm = $("#searchbox").val();
	        	var temp = searchTerm;
	        	if(searchTerm.length == 0 || $.trim(temp) == '' )
	        		Materialize.toast('Please enter an input!', 3000) 
	        	else
	        		window.location = "photoSearch?searchTerm=" + searchTerm;
	        });
			
			 $(function () {
	                $(".pwrapper").slice(0, 6).show();
	                 $("#showb").on('click', function (e) {
	                    e.preventDefault();
	                    $("#showb").fadeOut(150); 
	                    $("#showb").fadeIn(150); 
	                    $(".pwrapper:hidden").slice(0, 3).fadeIn(900);
	                    if ($(".pwrapper:hidden").length == 0) {
	                        $("#showb").fadeOut("fast");
	                    }

	                    $('html,body').animate({
	                        scrollTop: $(this).offset().top
	                    }, 1500);   
	                });
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

           