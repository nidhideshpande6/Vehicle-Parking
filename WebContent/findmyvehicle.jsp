<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Find my vehicle</title>
<style>
.bill{
margin-left:30%;
margin-top:70px;
background-color: rgb(190, 190, 290);
padding-top:30px;
padding-left:60px;
height:250px;
width:35%;
border:solid;
border-radius:10px;
text-align:center;
font-size:20px;
}
</style>
</head>
<body>
<%
try{
	String connectionURL="jdbc:mysql://localhost:3306/parking";
	Connection connection=null;
	Statement statement=null;
	ResultSet rs=null;

	String vehicle=request.getParameter("vehicle");
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	connection=DriverManager.getConnection(connectionURL,"root","deshpande2000");
	statement=connection.createStatement();
	String QueryString="SELECT * from park where vehicle_no='"+vehicle+"'";
	rs=statement.executeQuery(QueryString);
	
	%>
	<table>
<tr><td><form action="Regindex.html" method="get">
<button type="submit"><---back</button></td></tr>
</table>
	<div class="bill">
	<table cellpadding="15" border="1">

	<% 
	
	if(rs.next()){
		%>
		<h2>Vehicle details</h2>
		<tr><th>VehicleNo</th>
		<th>Floor</th><th>Slot</th></tr>
		<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		
		</tr>
		<% 
	}
	else{
		%>
		<h2>vehicle not found</h2>
		<% 
	}
	rs.close();
	statement.close();
	connection.close();
}catch(Exception e){
	
	out.println("unable to connect");
}
%>
</table></div></font>
</body>
</html>