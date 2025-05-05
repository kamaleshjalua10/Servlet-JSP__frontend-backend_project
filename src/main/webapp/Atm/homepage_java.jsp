<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.io.*" %>
    <%@ page import="java.util.*" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.information{
height:130px;
width:600px;
color:white;
position:relative;
top:30px;
background-color:#3d3c3c;
justify-content:center;
align-items: center;
text-align:center;
border-radius:20px;
box-shadow: 0px 0px 40px white;
}
h1{
	font-family:monospace;
}
h2{
	position:relative;
	top:250px;
	font-size:52px;
	color:red;
	text-shadow:1px 1px 5px white;
	font-family: 'Courier New', Courier, monospace;
	}


</style>
<title> ATM Interface  </title>
</head>
<body>

<%!
String fname;
Long faccount;
%>

<%

	
	String url="jdbc:mysql://localhost:3306/atm";
	String user="root";
	String hpassword="#bmwm5";
	
	String phoneno=request.getParameter("phonenumber");
	String passwords=request.getParameter("password");

	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection(url,user,hpassword);
	String query="select Mobile_No,Password from bank where Mobile_No=? and Password=?";
	PreparedStatement pstmt=con.prepareStatement(query);
	
	pstmt.setString(1,phoneno);
	pstmt.setString(2,passwords);
	
	ResultSet rs=pstmt.executeQuery();
	
	if(rs.next()){
		String query2="select Name,Account_No from bank where Mobile_No=? and Password=?";
		PreparedStatement pstmt2=con.prepareStatement(query2);
		pstmt2.setString(1,phoneno);
		pstmt2.setString(2,passwords);
		ResultSet rss=pstmt2.executeQuery();

		 if(rss.next()){
		  fname=rss.getString("Name");
		  faccount=rss.getLong("Account_No");
		 
		 }
		 
		// Store values in session
		    session.setAttribute("dataname", fname);
		    session.setAttribute("dataaccount", faccount);
		
		    
		
		 
			pstmt2.close();
			rss.close();
	}	
	else{
		out.println("<h2> wrong pin  </h2>");
	}
	
	con.close();
	pstmt.close();
	rs.close();
	
%>

	
<div class ="information">
<h1> Account holder Name : <%= fname %></h1>
<h1>       Account No    : <%= faccount %></h1>
</div>


<%@ include file="atmpage.jsp" %>




</body>
</html>