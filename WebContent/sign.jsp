<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<% try{
		int typeid;
		String oid = request.getParameter("oid");
		session.putValue("oid", oid);
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String vehicle = request.getParameter("vehicleno");
		String type = request.getParameter("type");

		Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/parking", "root",
				"deshpande2000");
		Statement st = con.createStatement();
		ResultSet rs;
		int j = st.executeUpdate("insert into owner_details values('" + oid + "','" + pwd + "','" + name + "','"
				+ phone + "','" + email + "')");
		int i = st.executeUpdate(
				"insert into vehicle_details values('" + vehicle + "','" + oid + "','" + type + "')");
		%><h3 style="text-align:center; margin-top:90px;">Successfully Registered<br>
		<center><h4>Welcome <%=name %></h4></center>
		</h3>
		<%
		response.setHeader("Refresh","4;url=Regindex.html");
	}catch(Exception e){
		%><h3 style="text-align:center; margin-top:90px;">Registration Unsuccessful<br>
		<center><h4>Try Again</h4></center>
		</h3><% 
		response.setHeader("Refresh","4;url=index.html");
	}
	%>
	<br>
	<br>
	
</body>
</html>