<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

		<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> -->
           <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        
        <!--Import materialize.css-->
        <link rel="stylesheet" type="text/css" href="materialize/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        
         <script type="text/javascript" src="jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="materialize/js/materialize.min.js"></script>
        
         <link rel = "stylesheet" type="text/css" href="css/userfeed.css">

      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        
      
</head>
<body>
 	  <div id="header">
              <a class="dropdown-button btn" href='#' data-activates="menu" id="dropmenu"> <i class="material-icons" id="icon">menu</i></a>

              <!-- menu contents -->
              <ul id="menu" class='dropdown-content'>
              	  
                  <li><a href="userfeed.jsp">home</a></li>
                  <li><a href="profile.jsp">profile</a></li>
                  <li><a href="logout">logout</a></li>
                   <!-- Redirects to logout servlet. -->
              </ul>
              
              <p id="userwel">Welcome, ${sessionScope.un}!</p>
              
            <a id="search"><i class="material-icons" id="magglass">search</i></a>
            <form method="get" action="photoSearch" id="searchBar"><input type="text" id="searchbox" name="search"></form>
        </div>
        
        <!-- This is a test, you can use this for showing attributes from the session. -->
			<!-- Username: ${sessionScope.un} <br> -->
          
    
        <div id="feed">
             <div class="picwrapper">
                <img src="img/private/1.jpg" class="pics">
                <p class="un">@admin</p><br>
                <p class="caption">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                <br><hr>
                <p id="tags">no tags</p>
            </div>
 
            <div class="picwrapper">
                <img src="img/public/1.jpg" class="pics">
                <p class="un">@alexagnoii</p><br>
                <p class="caption">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                <br><hr>
                <p id="tags">#Outdoor #Nature</p>
            </div>

            <div class="picwrapper">
                <img src="img/private/2.jpg" class="pics">
                <p class="un">@admin</p><br>
                <p class="caption">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                <br><hr>
                <p id="tags">no tags</p>
            </div>
 
            <div class="picwrapper">
                <img src="img/public/2.jpg" class="pics">
                <p class="un">@jessganoww</p><br>
                <p class="caption">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                <br><hr>
                <p id="tags">#Outdoor #Philosophy</p>
            </div>
 
           <div class="picwrapper">
                <img src="img/private/3.jpg" class="pics">
                <p class="un">@admin</p><br>
                <p class="caption">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                <br><hr>
                <p id="tags">no tags</p>
            </div>
            
            <div class="picwrapper">
                <img src="img/public/3.jpg" class="pics">
                <p class="un">@sedilloclaude</p><br>
                <p class="caption">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                <br><hr>
                <p id="tags">#Indoor #Food</p>
            </div>

            <div class="picwrapper">
                <img src="img/private/4.jpg" class="pics">
                <p class="un">@admin</p><br>
                <p class="caption">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                <br><hr>
                <p id="tags">no tags</p>
            </div>
    
            <div class="picwrapper">
                <img src="img/public/4.jpg" class="pics">
                <p class="un">@alexagnoii</p><br>
                <p class="caption">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                <br><hr>
                <p id="tags">#Family</p>
            </div>
            
             <div class="picwrapper">
                <img src="img/private/5.jpg" class="pics">
                <p class="un">@admin</p><br>
                <p class="caption">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                <br><hr>
                <p id="tags">no tags</p>
            </div>
            
            <div class="picwrapper">
                <img src="img/public/5.jpg" class="pics">
                <p class="un">@jessganoww</p><br>
                <p class="caption">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                <br><hr>
                <p id="tags">#Work #Food</p>
            </div>
            
            <div class="picwrapper">
                <img src="img/private/6.jpg" class="pics">
                <p class="un">@admin</p><br>
                <p class="caption">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                <br><hr>
                <p id="tags">no tags</p>
            </div>
            
            <div class="picwrapper">
                <img src="img/public/6.jpg" class="pics">
                <p class="un">@sedilloclaude</p><br>
                <p class="caption">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                <br><hr>
                <p id="tags">#Music #Fun</p>
            </div>
            
             <div class="picwrapper">
                <img src="img/private/7.jpg" class="pics">
                <p class="un">@admin</p><br>
                <p class="caption">no tags</p>
                <br><hr>
                <p id="tags"></p>
            </div>
            
           <div class="picwrapper">
                <img src="img/public/7.jpg" class="pics">
                <p class="un">@alexagnoii</p><br>
                <p class="caption">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                <br><hr>
                <p id="tags">#Outdoor #Vacation</p>
            </div>
            
             <div class="picwrapper">
                <img src="img/private/8.jpg" class="pics">
                <p class="un">@admin</p><br>
                <p class="caption">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                <br><hr>
                <p id="tags">no tags</p>
            </div>
            
            <div class="picwrapper">
                <img src="img/public/8.jpg" class="pics">
                <p class="un">@jessganoww</p><br>
                <p class="caption">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                <br><hr>
                <p id="tags">#Work #Food</p>
            </div>
            
            <a href="#" id="showb">show more</a>
            
        </div>
        
         <script>
            $(function () {
                $(".picwrapper").slice(0, 5).show();
                $("#showb").on('click', function (e) {
                    e.preventDefault();
                    $(".picwrapper:hidden").slice(0, 3).slideDown("slow");
                    if ($(".picwrapper:hidden").length == 0) {
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
             
             function showTagDiv () {
                 console.log("clicked");
                 $("#tagdiv").fadeIn();
             }
             
 	        //Submit form once image if clicked.
 	        $("a#search").click(function() {
 	        	$("form#searchBar").submit();
 	        });
    
        </script>
</body>
</html>