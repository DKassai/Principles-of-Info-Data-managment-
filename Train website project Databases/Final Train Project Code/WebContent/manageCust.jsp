<%@ page import ="java.sql.*" %>
<%@ page import ="java.sql.Connection" %>
<%@ page import="java.util.*"%>
<%

Connection connection = null;
String databaseName = "TRAINS";
String url = "jdbc:mysql://group29.cdbekejbzng4.us-east-2.rds.amazonaws.com:3306/" + databaseName;
String username = "Admin";
String password = "Password123";
Class.forName("com.mysql.jdbc.Driver");
connection = DriverManager.getConnection(url, username, password);

try {
	Statement st = connection.createStatement();
	ResultSet rs = st.executeQuery("select * from CUSTOMER");
%>
	<a href="landingpageAdmin.jsp">Back to Home Page</a> <br> <br>
	
	<a href="cusAdd.jsp">Add Information</a> |
	<a href="cusDelete.jsp">Delete Information</a> |
	<a href="cusUpdate.jsp">Edit Information</a> <br> <br>
	<head>
	<script type="text/javascript"></script>
	<style>
	table, th, td {
		border: 1px solid black;
		border-collapse: collapse;
	}
	td {
		padding: 5px;
	}
	td {
		text-align: center;
	}
	</style>
	</head>
	<table id="tableStock" style="width: 1000px; display: block">
	<thead>
	<tr>
		<th style="width: 12%">UserName</th>
		<th style="width: 11%">Email</th>
		<th style="width: 6%">Password</th>
		<th style="width: 11%">First Name</th>
		<th style="width: 6%">Last Name</th>
		<th style="width: 6%">Address</th>
		<th style="width: 7%">City</th>
		<th style="width: 7%">Telephone</th>
		<th style="width: 10%">State</th>
		<th style="width: 9%">Zip Code</th>
	</tr>
	</thead>
	<tbody>
	
<% 	while (rs.next()) {
%>	
	<tr>
		<td style="width: 12%"><%= rs.getString(1) %></td>
		<td style="width: 11%"><%= rs.getString(2) %></td>
		<td style="width: 6%"><%= rs.getString(3) %></td>
		<td style="width: 11%"><%= rs.getString(4) %></td>
		<td style="width: 6%"><%= rs.getString(5) %></td>
		<td style="width: 6%"><%= rs.getString(6) %></td>
		<td style="width: 7%"><%= rs.getString(7) %></td>
		<td style="width: 7%"><%= rs.getString(8) %></td>
		<td style="width: 10%"><%= rs.getString(9) %></td>
		<td style="width: 9%"><%= rs.getString(10) %></td>		
	</tr>
<%
	}
%>	</tbody>
<%
} catch (Exception e) {
	e.printStackTrace();
}
%>