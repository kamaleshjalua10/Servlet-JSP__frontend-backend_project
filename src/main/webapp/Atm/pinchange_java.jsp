<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.util.*" %>
 <%@ page import="java.io.*" %>
 <%@ page import="java.sql.*" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pin-change java Backend</title>

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


String oldpin=request.getParameter("oldpin");
String newpin=request.getParameter("newpin");


Connection con=null;
PreparedStatement pstmt=null;
ResultSet rs=null;
boolean submit = false;

try{
	Class.forName("com.mysql.cj.jdbc.Driver");	
	String query="select Pin from bank where Pin=? AND Account_No=?";
	con=DriverManager.getConnection(url,uname,password);
	pstmt=con.prepareStatement(query);
	pstmt.setString(1,oldpin);
	pstmt.setLong(2,faccountno);
	
	rs=pstmt.executeQuery();
	
	if(rs.next()){
		String query2="update bank set Pin=? where Account_No=?";
		PreparedStatement pstmt2=con.prepareStatement(query2);
		pstmt2.setString(1,newpin);
		pstmt2.setLong(2,faccountno);
		pstmt2.executeUpdate();
		
		pstmt2.close();
		submit=true;
		
	}else{
		out.println("<h1> wrong pin  </h1>");
	}
	
}catch(Exception e){
	out.println("<h3>Error  : " + e.getMessage() + "</h3>");
}

rs.close();
pstmt.close();
con.close();

if(submit){
	
%>
	<a href="atmpage.jsp"> Atm page </a>
 <h1> Pin-Change Sucessfully </h1>

<%
}
%>



</body>
</html>