<%@ page import ="java.sql.*" %>
<%@ page import ="java.sql.Connection" %>
<%@ page import="java.util.*"%>
<%@ page import="java.time.LocalTime"%>
<%@ page import="java.time.LocalDate"%>
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
	ResultSet rs = st.executeQuery("select * from EMPLOYEE where firstName <> ''");
%>
	<a href="landingpageAdmin.jsp">Back to Home Page</a> <br> <br>
	
	<a href="empAdd.jsp">Add Information</a> |
	<a href="empDelete.jsp">Delete Information</a> |
	<a href="empUpdate.jsp">Edit Information</a> <br> <br>
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
		<th style="width: 12%">SSN</th>
		<th style="width: 11%">First Name</th>
		<th style="width: 6%">Last Name</th>
		<th style="width: 11%">User Name</th>
		<th style="width: 6%">Password</th>
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
	</tr>
<%
	}
%>	</tbody>
<%
} catch (Exception e) {
	e.printStackTrace();
}
%>