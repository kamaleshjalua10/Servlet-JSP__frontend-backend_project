<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.math.BigDecimal" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Withdrawl java backend </title>

<style type="text/css">
body{
background-color:black;
display:flex;
justify-content: center;
align-items: center;  

}
	h1{
	position:relative;
	top:250px;
	font-size:52px;
	color:red;
	text-shadow:1px 1px 5px white;
	font-family: 'Courier New', Courier, monospace;
	}
	
	h2{
	position:relative;
	top:250px;
	font-size:52px;
	color:red;
	text-shadow:1px 1px 5px white;
	font-family: 'Courier New', Courier, monospace;
	}
	a{	
	font-size:30px;
	text-decoration: none;
	color:green;
	text-shadow:1px 1px 5px white;
	font-family:monospace;
}

</style>
</head>
<body>

<%


Long faccountno = (Long) session.getAttribute("dataaccount");


String url="jdbc:mysql://localhost:3306/atm";
String uname="root";
String password="#bmwm5";



String amount=request.getParameter("amount");
String pin=request.getParameter("pin");

Integer intamount=Integer.valueOf(amount);
BigDecimal decamount = BigDecimal.valueOf(intamount);


Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
boolean submit = false;

try{
	Class.forName("com.mysql.cj.jdbc.Driver");	
	String query="select Pin,Account_No,Balance from bank where Pin=? AND Account_No=?";
	con=DriverManager.getConnection(url,uname,password);
	pstmt=con.prepareStatement(query);
	pstmt.setString(1,pin);
	pstmt.setLong(2,faccountno);
	rs=pstmt.executeQuery();
	
	if(rs.next()){
		BigDecimal sqlamount = rs.getBigDecimal("Balance");
		
		int result= sqlamount.compareTo(decamount);
		
		if(result > 0 || result ==0){
			
			BigDecimal subtraction=sqlamount.subtract(decamount);
			
			String query2="update bank set Balance=? where Account_No=?";
			PreparedStatement pstmt2=con.prepareStatement(query2);
			pstmt2.setBigDecimal(1,subtraction);
			pstmt2.setLong(2,faccountno);
			pstmt2.executeUpdate();
			
			pstmt2.close();
			submit=true;
						
		}else{
			out.println("<h1>  Insuffcient  Balance   </h1>");
		}
				
	}else{		
		out.println("<h2> wrong pin  </h2>");
	}
	
	rs.close();
	pstmt.close();
	con.close();
	
}catch(Exception e){
	out.println("<h3>Error  : " + e.getMessage() + "</h3>");
}




	if(submit){		
%>	
	<a href="atmpage.jsp"> Atm page </a>
     <h1> Withdrawl sucessfully </h1>
<%
	}
%>

</body>
</html>