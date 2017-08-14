            $(function () {
                $(".pics").slice(0, 6).show();
                 $("#showb").on('click', function (e) {
                    e.preventDefault();
                    $("#showb").fadeOut(150); 
                    $("#showb").fadeIn(150); 
                    $(".pics:hidden").slice(0, 3).fadeIn(900);
                    if ($(".pics:hidden").length == 0) {
                        $("#showb").fadeOut("fast");
                    }
                     
                    $('html,body').animate({
                        scrollTop: $(this).offset().top
                    }, 1500);   
                });
               
            });
            
            //Submit form once image if clicked.
	        $("a#search").click(function() {
	        	$("form#searchBar").submit();
	        });