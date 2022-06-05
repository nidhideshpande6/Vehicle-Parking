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
	<%
	String oid=request.getParameter("oid");
	session.putValue("oid",oid);
	String pwd=request.getParameter("pwd");
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/parking","root","deshpande2000");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from owner_details where oid='"+oid+"'");
	if(rs.next()){
		if(rs.getString(2).equals(pwd)){
			%><h3 style="text-align:center; margin-top:90px;">Login Successful<br>
			<center><h4>Welcome <%=oid %></h4></center>
			</h3>
			<%
			response.setHeader("Refresh","4;url=Regindex.html");
		
		}
		else{
			%><h3 style="text-align:center; margin-top:90px;">Invalid Password or Username<br></h3><% 
			response.setHeader("Refresh","4;url=Regindex.html");
		}
	}
	else
		%><h3 style="text-align:center; margin-top:90px;">Invalid Password or Username<br></h3><% 
		response.setHeader("Refresh","4;url=Regindex.html");
	%>

</body>
</html>