<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="deposit.css">
<title>Diposit</title>
</head>
<body>
<span> DEPOSIT Money</span>

 <div class="dform">
      <form action="deposit_java.jsp"method="post">
      	 <div class="amount">
	      <label> Amount </label>
	      <input type="number" name="amount" placeholder="Enter Amount ..."required>
	      </div>
	      <div class="pin">
	      <label> Pin </label>
	      <input type="number" name="pin"placeholder="Enter Pin ..."required>
	      </div>
	      <button type="submit">Deposit</button>
      </form>
      
      </div>    




</body>
</html>