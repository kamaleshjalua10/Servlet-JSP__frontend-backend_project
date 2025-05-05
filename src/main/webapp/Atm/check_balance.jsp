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

@charset "UTF-8";

@charset "UTF-8";

body{
	background-image: url("color.png");
    background-size: cover;
    display: grid;
	justify-content: center;
    align-items: center;   
}
span{
	margin-top:20px;
	font-size:60px;
	font-family: 'Courier New', Courier, monospace;
	color:white;
	text-shadow:1px 1px 2px black;
}
.cform{
	height:300px;
	width:600px;
	background-color:transparent;
    backdrop-filter: blur(20px);	
	border-radius:25px;
	display:flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	position:relative;
	top:90px;
	right:10%;
	box-shadow: 0 0 50px white;
}
.pin{
	height:150px;
	width:400px;
	display: grid;
    margin-bottom: 20px;
    align-items: center;
    text-align:center;
}
label{
	font-size:37px;
	color: black;
	font-family: monospace;
	text-shadow: 1px 1px 2px green;
}
input{
	height:50px;
	width:400px;
	font-size:20px;
	border-radius:15px;
	text-align:center;
	cursor: pointer;
	outline: none;
	color:black;
	font-family:Lucida Console;
	box-shadow:0px 0px 20px rgb(30, 30, 30);
}
input:focus{
    animation: scal 0.4s;
}
@keyframes scal{
    0%{
        transform: scale(1);
    }
    50%{
        transform: scale(1.1);
        border-color: rgb(255, 34, 222);
    }
    100%{
        transform: scale(1);
    }
}
button{
	font-size:18px;
	height:55px;
	width:120px;
	border-radius:20px;
	background-color:red;
	position:relative;
	left:150px;
	top:17px;
	font-family: Impact, Haettenschweiler, 'Arial Narrow Bold', sans-serif;
	
}
button:focus{
    animation: scal2 0.4s;
}
@keyframes scal2{
    0%{
        transform: scale(1);
    }
    50%{
        transform: scale(1.1);
        border-color: rgba(5, 255, 251, 0.906);
    }
    100%{
        transform: scale(1);
    }
}
.balance{
	height:150px;
	width:600px;
	background-color:transparent;
    backdrop-filter: blur(20px);	
	border-radius:25px;
	display:flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	position:relative;
	top:140px;
	right:10%;
	box-shadow: 0 0 50px lightgray;
}

h1{
	position:relative;
	top:5px;
	font-size:35px;
	color:black;
	text-shadow:1px 1px 9px white;
	font-family: 'Courier New', Courier, monospace;
	}
h2{
	position:relative;
	top:5px;
	font-size:35px;
	color:black;
	text-shadow:1px 1px 9px white;
	font-family: 'Courier New', Courier, monospace;
	}
a{	
	position:absolute;
	top:70px;
	left:70px;
	font-size:30px;
	text-decoration: none;
	color:red;
	text-shadow:1px 1px 5px white;
	font-family:monospace;
}


</style>
</head>
<body>

 <div class="cform">
      <form action="check_balance.jsp"method="post">
	      <div class="pin">
	      <label> Pin </label>
	      <input type="number" name="pin"placeholder="Enter Pin ..."required>
	      </div>
	      <button type="submit"> Check </button>
      </form>     
      </div>
    

<%!
BigDecimal money;

%>

	<%
	
	Long faccountno=(Long)session.getAttribute("dataaccount");
	
	String url="jdbc:mysql://localhost:3306/atm";
	String uname="root";
	String password="#bmwm5";
	
	
	String pin=request.getParameter("pin");
	
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	boolean submit=false;
	
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		con=DriverManager.getConnection(url,uname,password);
		String query="select Pin  from bank where Pin=? AND Account_No=?";
		pstmt=con.prepareStatement(query);
		pstmt.setString(1,pin);
		pstmt.setLong(2,faccountno);
		rs=pstmt.executeQuery();
		
		if(rs.next()){
			String query2="select Balance from bank where Account_No=?";
			PreparedStatement pstmt2=con.prepareStatement(query2);
			pstmt2.setLong(1,faccountno);
			ResultSet rs2=pstmt2.executeQuery();
			if(rs2.next()){
				 money=rs2.getBigDecimal("Balance");
				
				
				rs2.close();
				pstmt2.close();
				submit=true;		
			}			
		}
		
	}catch(Exception e){
		out.println("<h3>Error : " + e.getMessage() + "</h3>");
	}
	
	rs.close();
	pstmt.close();
	con.close();
	
	
	if(submit){
	%>
	<a href="atmpage.jsp"> Atm-page </a>
	<div class="balance">

	<h1> Balance  : <%= money %></h1>
	
	</div>
<%
	}

%>

</body>
</html>