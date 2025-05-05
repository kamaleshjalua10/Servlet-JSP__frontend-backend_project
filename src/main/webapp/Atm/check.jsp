<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"  %>   
<%@ page import ="java.math.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Check Balance </title>
<style type="text/css">
/* Your CSS styles here */
</style>
</head>
<body>

 <div class="cform">
      <form action="check.jsp" method="post">
	      <div class="pin">
	      <label> Pin </label>
	      <input type="number" name="pin" placeholder="Enter Pin ..." required>
	      </div>
	      <button type="submit"> Check </button>
      </form>     
 </div>

<%!
BigDecimal money;

%>

<%
Long faccountno = (Long) session.getAttribute("dataaccount");
String url = "jdbc:mysql://localhost:3306/atm";
String uname = "root";
String password = "#bmwm5";

String cpin = request.getParameter("pin");

Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
boolean submit = false;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection(url, uname, password);
    
    String query = "SELECT Pin FROM bank WHERE Pin = ?";
    pstmt = con.prepareStatement(query);
    pstmt.setString(1,cpin);
    rs = pstmt.executeQuery();
    
    if(rs.next()){
        String query2 = "SELECT Balance FROM bank WHERE Account_No = ?";
        PreparedStatement pstmt2 = con.prepareStatement(query2);
        pstmt2.setLong(1, faccountno);
        ResultSet rs2 = pstmt2.executeQuery();
        
        if (rs2.next()) {
            money = rs2.getBigDecimal("Balance");
            submit = true;   
            rs2.close();
            pstmt2.close();
        }            
    }
} catch (Exception e) {
    out.println("<h3>Error: " + e.getMessage() + "</h3>");
} 

rs.close();
pstmt.close();
con.close();


if (submit) {
%>
    <div class="balance">
        <h1> Balance: <%= money  %></h1>
        <h1> account: <%= faccountno  %></h1>
    </div>
<%
}
%>

</body>
</html>