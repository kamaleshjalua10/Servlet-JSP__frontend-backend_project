<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.math.BigDecimal" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Deposit Java Backend</title>

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
    String url = "jdbc:mysql://localhost:3306/atm";
    String username = "root";
    String password = "#bmwm5";

    String damount = request.getParameter("amount");
    String dpin = request.getParameter("pin");

    // Convert string to integer
    Integer intamount = Integer.valueOf(damount);
    // Convert integer to decimal
    BigDecimal decamount = BigDecimal.valueOf(intamount);

    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    boolean submit = false;

    try {
        String query = "select Pin, Account_No from bank where Pin=? AND Account_No=?";
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(url, username, password);
        
        pstmt = con.prepareStatement(query);
        pstmt.setString(1, dpin);
        pstmt.setLong(2, faccountno);
        
        rs = pstmt.executeQuery();
        if (rs.next()) {
            String balanceget = "select Balance from bank where Account_No=?";
            PreparedStatement pstmt2 = con.prepareStatement(balanceget);
            pstmt2.setLong(1, faccountno);
            ResultSet rs2 = pstmt2.executeQuery();
            
            if (rs2.next()) {
                BigDecimal sqlamount = rs2.getBigDecimal("Balance");
                BigDecimal sum_amount = sqlamount.add(decamount);
                
                String balanceset = "update bank set Balance=? where Account_No=?";
                PreparedStatement pstmt3 = con.prepareStatement(balanceset);
                pstmt3.setBigDecimal(1, sum_amount);
                pstmt3.setLong(2, faccountno);
                pstmt3.executeUpdate();
                
                pstmt3.close();
                submit = true; 
            }
            
            rs2.close();
            pstmt2.close();
            
        } else {
        	out.println("<h1> wrong pin  </h1>");
        }
        
    } catch (SQLException e) {
        out.println("<h3>Error occurred: " + e.getMessage() + "</h3>");
    } 
    	 	rs.close();
            pstmt.close();
            con.close();
     

    if (submit) {
%>
		<a href="atmpage.jsp"> Atm page </a>
        <h1> Deposit successful !</h1>
<%
    }
%>

</body>
</html>