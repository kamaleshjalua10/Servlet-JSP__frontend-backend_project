<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.Random" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <link rel="stylesheet" href="createaccount.css">
<title> Create Account </title>
</head>
<body>

<img src="bank.png">
<h1> ! Fraud Bank Of India  !</h1>

<div class="ac-number-div">

	<% 
	Random r=new Random();	
	long acno=r.nextLong(900000000000L);	
	%>
	<p>Your Account number : </p>
	<br>
	<span><%= acno %></span>

</div>


<div class="create-form-div">
     <form action="createaccount_java.jsp"method="post">
		<div class="under-form-div">
			<label>Name</label>
			<input type="text" name="c_name" placeholder="Enter Here ..."required>
		</div>
		<div class="under-form-div">
			<label>Account Number</label>
			<input type="number" name="c_account_no" placeholder="Enter Given Account number ..."required>
		</div>
		<div class="under-form-div">
			<label>4 Digit Pin</label>
			<input type="number" name="c_pin" placeholder="Create 4 Digit Pin  ..."required>
		</div>
		<div class="under-form-div">
			<label>Mobile Number</label>
			<input type="number" name="c_mobile_no" placeholder="Enter Here ..."required>
		</div>
		<div class="under-form-div">
			<label>Password</label>
			<input type="text" name="c_password" placeholder="Create password ..."required>
		</div>
		<div class="under-form-div">
			<label>Email Address</label>
			<input type="email" name="c_email" placeholder="Enter Here ..."required>
		</div>
		<div class="under-form-div">
			<label>Gender</label>
			<select id="select-class" name="c_gender"required>
	               <option>SELECT GENDER</option>
	               <option value="male">MALE</option>
	               <option value="female">FEMALE</option>
	         </select>
		</div>
		<div class="under-form-div">
			<label>Date Of Birth </label>
			<input type="date" name="c_dateofbirth" placeholder="Enter Here ..." required>
		</div>
		<div class="under-form-div">
			<label>Village </label>
			<textarea id="text-area"name="c_address" cols="30" rows="2"required></textarea>
		</div>
	<div class="under-form-div">
			<label>Date</label>
			<input type="date" name="c_date" placeholder="Enter Here ..."required>
		</div>
		
		<input type="checkbox"id="checkbox" required>
		
		<button type="submit"> Submit </button>
	
	</form>
</div>


</body>
</html>