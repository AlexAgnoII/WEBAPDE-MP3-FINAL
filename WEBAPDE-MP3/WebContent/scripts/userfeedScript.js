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
            
             $(document).ready(function() {             
	 	        //Submit form once image if clicked.
	 	        $("a#searchbmodal").click(function() {
	 	        	$("form#searchBar").submit();
	 	        });
             });
             
             $('.modal').modal({
                 dismissible: true, 
                 opacity: 0.7,
                 endingTop: '0%',
             });