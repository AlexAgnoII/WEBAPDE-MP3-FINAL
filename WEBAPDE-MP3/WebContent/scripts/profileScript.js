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
            
            //Submit form once image if clicked.
	        $("a#searchbmodal").click(function() {
	        	$("form#searchBar").submit();
	        });
	        
	        $('.modal').modal({
                dismissible: true, 
                opacity: 0.7,
                startTop: '0%',
                endingTop: '0%',
            });
	        
	        $('#picmodal').modal({
                dismissible: true, 
                opacity: 0.85,
                startTop: '4%',
                endingTop: '10%',
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