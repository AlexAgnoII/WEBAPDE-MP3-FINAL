
 
        $("document").ready(function() {
            $(function () {
                $(".img").slice(0, 6).show();
                 $("#showb").on('click', function (e) {
                    e.preventDefault();
                    $("#showb").fadeOut(150); 
                    $("#showb").fadeIn(150); 
                    $(".img:hidden").slice(0, 3).fadeIn(900);
                    if ($(".img:hidden").length == 0) {
                        $("#showb").fadeOut("fast");
                    }

                    $('html,body').animate({
                        scrollTop: $(this).offset().top
                    }, 1500);   
                });
            });

            //Characters remaining for description sign up.
            $("textarea#description").keypress(function(e) {
                //count = $("textarea#description").val().length;
                count = $("span#keyCount").html();
                console.log("keypress" + count);


                if(count > 0) {
                    count--;
                    $("span#keyCount").html(count);
                }

                else e.preventDefault();

            });

            //Characters remaining for description sign up.
            $("textarea#description").keyup(function(e) {
                if(e.keyCode == 8 || e.keyCode == 46) {
                    var descLength = $("textarea#description").val().length;
                        count = $("span#keyCount").html();
                        console.log("keyup" + count);

                        if(descLength == 0) {
                            count = 120;
                            $("span#keyCount").html(count);
                        }

                        else
                            if(count != 120) {
                                count++;
                                $("span#keyCount").html(count);
                            }
                }

            })

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