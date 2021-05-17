<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
.bill{
margin-left:30%;
margin-top:70px;
background-color: rgb(190, 190, 290);
padding-top:30px;
padding-left:30px;
height:250px;
width:35%;
border:solid;
border-radius:10px;
text-align:center;
font-size:20px;
}
</style>
</head>
<body><% 
	
   		String connectionURL = "jdbc:mysql://localhost:3306/parking";
		Connection connection = null;
		Statement statement = null;
		ResultSet rs = null;
		ResultSet rs1 = null;
		ResultSet rs2 = null;
		String a = "1";
		String b = "2";
		String c = "3";
		String vehicle = request.getParameter("vehicle");
		session.putValue("vehicle", vehicle);
		String type = request.getParameter("type");
		String slot = request.getParameter("slot");
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		connection = DriverManager.getConnection(connectionURL, "root", "deshpande2000");
		statement = connection.createStatement();
		
		String QueryString2="SELECT * from park where floor='"+type+"'";
		rs2=statement.executeQuery(QueryString2);
		if(rs2.next()){
			 if ( rs2.getString(3).equals(slot)) {
					
					%><div class="bill">
					<h2>Some vehicle parked in same slot.</h2>
					<h2>Try with the other slot.</h2>
					<% 
					return;
				}
		}
		
		
		String QueryString1="SELECT * from park where vehicle_no='"+vehicle+"'";
		rs1=statement.executeQuery(QueryString1);
		if(rs1.next()){
			if (rs1.getString(1).equals(vehicle)) {
				
				%><div class="bill">
				<h2>Vehicle already parked in location</h2>
				<table  cellpadding="15" border="1"><tr><th>vehicleNo</th><th>floor</th><th>slot</th></tr>
				<tr><td><%=rs1.getString(1) %></td><td><%=rs1.getString(2) %></td><td><%=rs1.getString(3) %></td></tr>
				</table></div>
				<% 
				return;
			}
              
			
		}
		
		String QueryString = "SELECT vehicle_no from vehicle_details where type_id='" + type + "'";
		rs = statement.executeQuery(QueryString);
		
		
		%> <div class="bill"> <% 
		
		if (rs.next()) {
	
			if (a.equals(type) && rs.getString(1).equals(vehicle)) {
				%> <h2>Vehicle Parked Successfully</h2><% 
				int floor = 1;
				int i=statement.executeUpdate("insert into log_book values('"+vehicle+"',current_timestamp,null,'"+floor+"','"+slot+"')");
				int j = statement.executeUpdate("insert into park values('" + vehicle + "','" + floor + "','" + slot
						+ "')");
				%>
				<table  cellpadding="15" border="1"><tr><th>vehicleNo</th><th>floor</th><th>slot</th></tr>
				<tr><td><%=vehicle %></td><td><%=floor %></td><td><%=slot %></td></tr>
				</table>
				<% 
				return;
				

			} else if (b.equals(type) && rs.getString(1).equals(vehicle)) {
				%> <h2>Vehicle Parked Successfully</h2><% 
				int floor = 2;
				int i=statement.executeUpdate("insert into log_book values('"+vehicle+"',current_timestamp,null,'"+floor+"','"+slot+"')");
				int j = statement.executeUpdate("insert into park values('" + vehicle + "','" + floor + "','" + slot
						+ "')");
				%>
				<table  cellpadding="15" border="1"><tr><th>vehicleNo</th><th>floor</th><th>slot</th></tr>
				<tr><td><%=vehicle %></td><td><%=floor %></td><td><%=slot %></td></tr>
				</table>
				<% 
						
						return;
			}
				
			 else if (c.equals(type) && rs.getString(1).equals(vehicle)) {
					%> <h2>Vehicle Parked Successfully</h2><% 
				int floor = 3;
					int i=statement.executeUpdate("insert into log_book values('"+vehicle+"',current_timestamp,null,'"+floor+"','"+slot+"')");
				int j = statement.executeUpdate("insert into park values('" + vehicle + "','" + floor + "','" + slot
						+ "')");
				%>
				<table  cellpadding="15" border="1"><tr><th>vehicleNo</th><th>floor</th><th>slot</th></tr>
				<tr><td><%=vehicle %></td><td><%=floor %></td><td><%=slot %></td></tr>
				</table>
				<% 
						return;
			
			} else {
				%><h2>Vehicle name and Type are not matching</h2>
				<h2>Try again</h2><%
			}
		}
		else{
			%><h2>Vehicle name and Type are not matching</h2>
			<h2>Try again</h2><%
		}
			
			/*if(num>10){
				out.println("parking full");
			}*/

		
			
	%></div>
</body>
</html>