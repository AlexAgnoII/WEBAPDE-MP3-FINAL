<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
   		<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> -->
    	<title>Insert title here</title>
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        
        <!--Import materialize.css-->
        <link rel="stylesheet" type="text/css" href="materialize/css/materialize.min.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        
        <script type="text/javascript" src="jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="materialize/js/materialize.min.js"></script>
        
        <link rel = "stylesheet" type="text/css" href="css/upload.css">
        
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>   
      
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.1.20/jquery.fancybox.min.css" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.1.20/jquery.fancybox.min.js"></script>     
        
        <script src="jquery-3.2.1.min.js"></script>
<meta charset="ISO-8859-1">
</head>
<body>
	
 	  <div id="uploaddiv">
            <div id="left">
                <p>Select file</p>
                <form method="post" action="upload" id="uploadPic">
                <input type="file" id= "uploadb" name="pic" accept="image/*" onchange="readURL(this);" data-classIcon="icon-plus">
                Uploaded by: <input type="text" name = "uploader"><br>
                Title: <input type = "text" name ="title"><br>
                Description: <input type = "text" name = "description"><br>
                Privacy: <input type = "text" name = "privacy"> <br>
                Tags: <input type = "text" name = "tags"><br>
                </form>
                
                <div id="question">
	                <a class="waves-effect waves-light btn" id="upload">Upload</a> <br>
	                <a class="waves-effect waves-light btn" id="back" href="profile.jsp">Back</a> <br>
               	</div>
            </div>
            
            <div id="right">
                <img id="image" src="img/default.gif" alt="your image">
            </div>
        </div>

        <script>
           function readURL(input) {
             if (input.files && input.files[0]) {
               var reader = new FileReader();
               reader.onload = function (e) {
               $('#image')
                .attr('src', e.target.result)
                .width(800)
                .height(800);
               };
             reader.readAsDataURL(input.files[0]);
             }
           }
           
           $(document).ready(function() {
        	   $("a#upload").click(function() {
        		  var path = $("input#uploadb").val();
        		  console.log(path);
        		  if(path.length != 0) {
        			  Materialize.toast('Uploading! Please wait..', 4000)
        			  $("form#uploadPic").submit();
        		  }
        		  
        		  else {
        			  Materialize.toast('Please choose a file!', 4000)
        		  }
        	   });
           });
        </script>
</body>
</html>