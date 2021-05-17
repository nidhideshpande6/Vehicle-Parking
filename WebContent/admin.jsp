<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin </title>
</head>
<body>
<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%
	String a="admin";
	String b="ad123";
	String oid=request.getParameter("oid");
	session.putValue("oid",oid);
	String pwd=request.getParameter("pwd");
	if(a.equals(oid) && b.equals(pwd)){
		out.println("successfully login");
		response.sendRedirect("adminaction.html");}
	else
		out.println("invalid password or username");
	
	%>
</body>
</html>