

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
.bill{

margin-top:40px;
background-color: rgb(190, 190, 290);
padding-top:30px;
padding-left:10px;
padding-right:10px;
height:450px;
border:solid;
border-radius:10px;
text-align:center;
font-size:20px;
}
</style>
</head>


<body>
<%   




String connectionURL="jdbc:mysql://localhost:3306/parking";
Connection connection=null;
Statement statement=null;
ResultSet rs=null;
ResultSet rs1=null;



Class.forName("com.mysql.jdbc.Driver").newInstance();
connection=DriverManager.getConnection(connectionURL,"root","deshpande2000");

CallableStatement myStat=null;
myStat=connection.prepareCall("{call a()}");

rs=myStat.executeQuery();
//statement=connection.createStatement();
//String QueryString="SELECT * from log_book";
//rs=statement.executeQuery(QueryString);
	

%><table>
<tr><td><form action="adminaction.html" method="get">
<button type="submit"><---back</button></td></tr>
</table>
	<div class="bill">
	<table cellpadding="15" border="1">
	<h2>Parked Vehicle details</h2>
		<tr><th>VehicleNo</th>
		<th>Floor</th><th>Slot</th><th>OwnerId</th>
		<th>typeId</th><th>Name</th><th>Phone No</th><th>Email Id</th>
		<th>Entry time</th><th>Exit time</th></tr>

	<% 
	
	while(rs.next()){
		%>
		
		<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(5) %></td>
		<td><%=rs.getString(6) %></td>
		<td><%=rs.getString(9) %></td>
		<td><%=rs.getString(10) %></td>
		<td><%=rs.getString(11) %></td>
		<td><%=rs.getString(13) %></td>
		<td><%=rs.getString(14) %></td>
		
		
		<% 
	} 
	%>
</body>
</html>