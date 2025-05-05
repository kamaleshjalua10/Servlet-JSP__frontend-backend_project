<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="homepage.css">
<title>ATM HOME</title>
</head>
<body>

<img src="bank.png">
<h5 data-text="&nbsp;Fraud Bank Of India &nbsp;">&nbsp;<span> !  !  WELCOME  TO !  ! </span>&nbsp;</h5>


<div class="main_con">
     <nav>          
       <div class="nav_div">
         	<div id="new_user"><a href="createaccount.jsp">Create Account </a></div>
             <div id="password"><a href="">Forget Password</a></div>  
         </div>
      </nav>
      
      <div class="form">
      <form action="homepage_java.jsp"method="post">
      		<div class="phone">
	      <label>Phone number </label>
	      <input type="number" name="phonenumber" placeholder="Enter here..."required>
	      </div>
	      <div class="pass">
	      <label>PassWord </label>
	      <input type="text" name="password"placeholder="Enter here..."required>
	      </div>
	      <button type="submit">Log in </button>
      </form>
      
      </div>    
          
  </div>

</body>
</html>