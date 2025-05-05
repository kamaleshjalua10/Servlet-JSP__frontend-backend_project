<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import ="java.util.Random" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

Random r=new Random();

long acno=r.nextLong(900000000000L);


%>

<h1 style="color:red ; margin-top:100px ;"> your Account Number :  <%= acno %></h1>

</body>
</html>