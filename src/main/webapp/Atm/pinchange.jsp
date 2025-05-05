<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="pinchange.css">
<title>Pin-change</title>
</head>
<body>

<span> Pin-change</span>

 <div class="pinform">
      <form action="pinchange_java.jsp"method="post">
      	 <div class="oldpin">
	      <label> Old Pin </label>
	      <input type="number" name="oldpin" placeholder="Enter old Pin ..."required>
	      </div>
	      <div class="newpin">
	      <label> New Pin </label>
	      <input type="number" name="newpin"placeholder="Enter new Pin ..."required>
	      </div>
	      <button type="submit">OK</button>
      </form>
      
      </div> 

</body>
</html>