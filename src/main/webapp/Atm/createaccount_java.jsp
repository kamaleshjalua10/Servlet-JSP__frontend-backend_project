<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*" %>
    <%@ page import="java.util.*" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body{
	background-color:black;
	display:flex;
	justify-content: center;
	align-items: center;
}
.notis{
 	height:250px;
 	width:630px;
 	background-color:gray;
 	display:grid;
	justify-content: center;
 	text-align:center;
	border-radius:25px;
	margin-top:260px
}
h1{
	color:red;
	font-family:Lucida Console;
}
</style>
<meta charset="UTF-8">
<title>Create Account backend</title>
</head>
<body>


<%

	String url="jdbc:mysql://localhost:3306/atm";
	String user="root";
	String sqlpassword="#bmwm5";
	

	String name =request.getParameter("c_name");
	String accountnumber =request.getParameter("c_account_no");
	String pin=request.getParameter("c_pin");
	String mobilenumber =request.getParameter("c_mobile_no");
	String password=request.getParameter("c_password");
	String email =request.getParameter("c_email");
	String gender =request.getParameter("c_gender");
	String dateofbirth =request.getParameter("c_dateofbirth");
	String village =request.getParameter("c_address");
	String date =request.getParameter("c_date");
	
	//   convert data type 
	long convert_account=Long.valueOf(accountnumber);
	
	
	
	//    Connection 
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection(url,user,sqlpassword);
	String query="insert into bank (Name,Account_No,Pin,Mobile_No,Password,Email,Gender,Date_of_birth,Village,Date)values(?,?,?,?,?,?,?,?,?,?)";
	PreparedStatement pstmt=con.prepareStatement(query);
	
	pstmt.setString(1,name);
	pstmt.setLong(2,convert_account);
	pstmt.setString(3,pin);
	pstmt.setString(4,mobilenumber);
	pstmt.setString(5,password);
	pstmt.setString(6,email);
	pstmt.setString(7,gender);
	pstmt.setString(8,dateofbirth);
	pstmt.setString(9,village);
	pstmt.setString(10,date);
	pstmt.executeUpdate();
	
	
	con.close();
	pstmt.close();
	
%>


<div class="notis">
	<h1>  <%= name %></h1>
	<h1> your Account Has been Created </h1>
</div>




</body>
</html>