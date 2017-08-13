<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  		<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> -->
    	<title>Insert title here</title>
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        
        <!--Import materialize.css-->
        <link rel="stylesheet" type="text/css" href="materialize/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        
         <script type="text/javascript" src="jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="materialize/js/materialize.min.js"></script>
        
         <link rel = "stylesheet" type="text/css" href="css/sharedphoto.css">

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
</body>
</html>