

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<html>
<head>
<meta charset="ISO-8859-1">
<title>All Vehicles</title>
<style>
.bill{

margin-top:40px;
background-color: rgb(190, 190, 290);
padding-top:30px;
padding-left:280px;
padding-right:10px;
border:solid;
border-radius:10px;
text-align:center;
font-size:20px;
}
</style>
</head>


<body>
<%   



CallableStatement myStat=null;
String connectionURL="jdbc:mysql://localhost:3306/parking";
Connection connection=null;
Statement statement=null;
ResultSet rs=null;
ResultSet rs1=null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
connection=DriverManager.getConnection(connectionURL,"root","deshpande2000");
myStat=connection.prepareCall("{call log()}");
rs=myStat.executeQuery();
%>

<table>
<tr><td><form action="adminaction.html" method="get">
<button type="submit"><---back</button></td></tr>
</table>
<center><h1>Parked Vehicle details</h1></center>
	<div class="bill">
	<table cellpadding="15" border="1">
		<tr><th>VehicleNo</th>
		<th>Entry time</th><th>Exit time</th>
		<th>Floor</th><th>Slot</th>
		</tr><% 
		 
		
	while(rs.next()){	%>	
		<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
		<td><%=rs.getString(5) %></td>
		
		
		
		<% 
	} 
	%>
</body>
</html>