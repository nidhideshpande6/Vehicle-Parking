<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bill generation</title>
<style>
.bill{
margin-left:30%;
margin-top:70px;
background-color: rgb(190, 190, 290);
padding-top:30px;
padding-left:60px;
height:250px;
width:30%;
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
	
	String QueryString="SELECT vehicle_no,cost_hr from (vehicle_details join vehicle_type on vehicle_details.type_id=vehicle_type.type_id and vehicle_no='"+vehicle+"')";
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
		<h2>The Parking Bill</h2>
		<tr><th>VehicleNo</th>
		<th>Cost</th></tr>
		<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		</tr>
		<% 
	}else{
		%>
		<h2>Enter Valid vehicle number</h2>
		<% 
	}
	
	
	%>
	<% 
	int j = statement.executeUpdate("update log_book set dep=current_timestamp where vehicle_no='"+vehicle+"';");
	int k = statement.executeUpdate("delete from park where vehicle_no='"+vehicle+"';");
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