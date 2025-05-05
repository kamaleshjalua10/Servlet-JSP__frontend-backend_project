<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.io.*" %>
    <%@ page import="java.util.*" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="atmpage.css">
<title> ATM InterFace </title>
</head>
<body>

<a id="ahomeid" href="homepage.jsp">home-page </a>
<div class="big-all-function">

	<img src="bank.png">
	
	<h2> Please select your transaction </h2>
	
	<div class="all-function">
	
		<div class="function">
		<a href="deposit.jsp">Deposit</a>
		</div>
		
		<div class="function">
		<a href="Withdrawl.jsp">Withdrawl</a>
		</div>
		
		<div class="function">
		<a href="pinchange.jsp">Pin-change</a>
		</div>
		
		<div class="function">
		<a href="check_balance.jsp">Check-balance</a>
		</div>
		
	</div>

</div>


</body>
</html>