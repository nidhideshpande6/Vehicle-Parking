<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>changing cost</title>
<style>
.cost{
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
<table>
<tr><td><form action="adminaction.html" method="get">
<button type="submit"><---back</button></td></tr>
</table>
<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<% try{
		String cost= request.getParameter("cost");
		session.putValue("cost", cost);
		String type = request.getParameter("type");

		Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/parking", "root",
				"deshpande2000");
		Statement st = con.createStatement();
		ResultSet rs;
		int j = st.executeUpdate("update vehicle_type set cost_hr='"+cost+"' where type_id='"+type+"'");
		String QueryString="SELECT * from vehicle_type where type_id='"+type+"'";
		rs=st.executeQuery(QueryString);
		%>
		<div class="cost">
		<h2>Cost changed Successfully</h2>
		
		<table cellpadding="15" border="1">

	<% 
	while(rs.next()){
		%>
		<tr>
		<td>Type Id</td>
		<td>Cost</td>
		<td>Type Name</td>
		</tr>
		<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		</tr>
		<% 
	} %>
	<% 
	rs.close();
	st.close();
	con.close();
}catch(Exception e){
	
	out.println("unable to connect");
}
%>
</table></div>
</body>
</html>