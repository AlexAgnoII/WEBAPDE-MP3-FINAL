<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  		<!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        
        <!--Import materialize.css-->
        <link rel="stylesheet" type="text/css" href="materialize/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        
        <script type="text/javascript" src="jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="materialize/js/materialize.min.js"></script>
        
        <link rel = "stylesheet" type="text/css" href="css/profile.css">
        

      	<!--Let browser know website is optimized for mobile-->
      	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.1.20/jquery.fancybox.min.css" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.1.20/jquery.fancybox.min.js"></script>    

</head>
<body>
 <div id="header">
          <a class="dropdown-button btn" href='#' data-activates="menu" id="dropmenu"> <i class="material-icons" id="icon">menu</i></a>

          <!-- menu contents -->
          <ul id="menu" class='dropdown-content'>
          	  <li><a href="upload.jsp">Upload photo</a></li>
          	  <li class="divider"></li>
              <li><a href="userfeed.jsp">home</a></li>
              <li><a href="profile.jsp">profile</a></li>
              <li><a href="logout">logout</a></li> <!-- Redirects to logout servlet. -->
          </ul>
          
          <p id="userwel">Welcome, ${sessionScope.un}!</p>
            
            <a id="search"><i class="material-icons" id="magglass">search</i></a>
            <form method="get" action="photoSearch" id="searchBar"><input type="text" id="searchbox" name="search"></form>
            
        </div>
            
        <div class="wrapper">
            <div id="userdesc">
                <img src="img/DP.png" id="dp">
                
                <div id="userinfo">
                    <p id="name">Admin Me</p>
                    <p id="uname">@admin</p>
                    <p id="desc">Film photographer and part time white elephant. #onFilm for my photographs!</p> 
                </div>
                
            </div>
            
            <div id="userphotos">
                <a data-fancybox="gallery" href="img/private/1.jpg" data-caption="Lorem ipsum dolor sit amet, consectetur adipiscing elit<br><strong>@admin</strong>">
                <img src="img/private/1.jpg" class="pics"></a>
                
                   <a data-fancybox="gallery" href="img/private/2.jpg" data-caption="Lorem ipsum dolor sit amet, consectetur adipiscing elit<br><strong>@admin</strong>">
                <img src="img/private/2.jpg" class="pics"></a>
                
                <a data-fancybox="gallery" href="img/private/3.jpg" data-caption="Lorem ipsum dolor sit amet, consectetur adipiscing elit<br><strong>@admin</strong>">
                <img src="img/private/3.jpg" class="pics"></a>
                
                <a data-fancybox="gallery" href="img/private/4.jpg" data-caption="Lorem ipsum dolor sit amet, consectetur adipiscing elit<br><strong>@admin</strong>">
                <img src="img/private/4.jpg" class="pics"></a>
                
                <a data-fancybox="gallery" href="img/private/5.jpg" data-caption="Lorem ipsum dolor sit amet, consectetur adipiscing elit<br><strong>@admin</strong>">
                <img src="img/private/5.jpg" class="pics"></a>
                
                <a data-fancybox="gallery" href="img/private/6.jpg" data-caption="Lorem ipsum dolor sit amet, consectetur adipiscing elit<br><strong>@admin</strong>">
                <img src="img/private/6.jpg" class="pics"></a>
                
                <a data-fancybox="gallery" href="img/private/7.jpg" data-caption="Lorem ipsum dolor sit amet, consectetur adipiscing elit<br><strong>@admin</strong>">
                <img src="img/private/7.jpg" class="pics"></a>
                
                <a data-fancybox="gallery" href="img/private/8.jpg" data-caption="Lorem ipsum dolor sit amet, consectetur adipiscing elit<br><strong>@admin</strong>">
                <img src="img/private/8.jpg" class="pics"></a>
                
                <a data-fancybox="gallery" href="img/private/9.jpg" data-caption="Lorem ipsum dolor sit amet, consectetur adipiscing elit<br><strong>@admin</strong>">
                <img src="img/private/9.jpg" class="pics"></a>
                
                 <a data-fancybox="gallery" href="img/private/10.jpg" data-caption="Lorem ipsum dolor sit amet, consectetur adipiscing elit<br><strong>@admin</strong>">
                 <img src="img/private/10.jpg" class="pics"></a>
                
                <a data-fancybox="gallery" href="img/private/11.jpg" data-caption="Lorem ipsum dolor sit amet, consectetur adipiscing elit<br><strong>@admin</strong>">
                <img src="img/private/11.jpg" class="pics"></a>
                
                <a data-fancybox="gallery" href="img/private/12.jpg" data-caption="Lorem ipsum dolor sit amet, consectetur adipiscing elit<br><strong>@admin</strong>">
                <img src="img/private/12.jpg" class="pics"></a>
                
                <a data-fancybox="gallery" href="img/private/13.jpg" data-caption="Lorem ipsum dolor sit amet, consectetur adipiscing elit<br><strong>@admin</strong>">
                <img src="img/private/13.jpg" class="pics"></a>
                
                <a data-fancybox="gallery" href="img/private/14.jpg" data-caption="Lorem ipsum dolor sit amet, consectetur adipiscing elit<br><strong>@admin</strong>">
                <img src="img/private/14.jpg" class="pics"></a>
                
                <a data-fancybox="gallery" href="img/private/15.jpg" data-caption="Lorem ipsum dolor sit amet, consectetur adipiscing elit<br><strong>@admin</strong>">
                <img src="img/private/15.jpg" class="pics"></a>
   
                <a href="#" id="showb">show more</a>
            
            </div>
    
        </div>
        
        <script>
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
        </script>
 
</body>
</html>