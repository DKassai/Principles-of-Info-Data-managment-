<%@ page import ="java.sql.*" %>
<%@ page import ="java.sql.Connection" %>
<%@ page import="java.util.*"%>
<%

Connection connection = null;
String user = request.getParameter("user");
String databaseName = "TRAINS";
String url = "jdbc:mysql://group29.cdbekejbzng4.us-east-2.rds.amazonaws.com:3306/" + databaseName;
String username = "Admin";
String password = "Password123";
Class.forName("com.mysql.jdbc.Driver");
connection = DriverManager.getConnection(url, username, password);

try {
	Statement st = connection.createStatement();
	ResultSet rs = st.executeQuery("SELECT * FROM TRAINS.RESERVATION WHERE userName = '"+ user +"'");
%>
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
	<a href="landingpageAdmin.jsp">Back to Home Page</a> <br> <br>
	<table id="tableStock" style="width: 1000px; display: block">
		
	<thead>
	<tr>
		<th style="width: 12%">Reservation ID</th>
		<th style="width: 11%">Rate</th>
		<th style="width: 6%">Total Fare</th>
		<th style="width: 11%">User Name</th>
		<th style="width: 10%">Name</th>
		<th style="width: 9%">Date Made</th>
		<th style="width: 9%">Seat Number</th>

		
	</tr>
	</thead>
	<tbody>
	
<% 	while (rs.next()) {
%>	
	<tr>
		<td style="width: 12%"><%= rs.getString(1) %></td>
		<td style="width: 11%"><%= rs.getString(2) %></td>
		<td style="width: 6%">$<%= rs.getString(3) %>.00</td>
		<td style="width: 11%"><%= rs.getString(4) %></td>
		<td style="width: 10%"><%= rs.getString(9) + " " + rs.getString(10) %></td>	
		<td style="width: 9%"><%= rs.getString(13) %></td>	
		<td style="width: 9%"><%= rs.getString(15) %></td>			
	</tr>

<%
	}
%>	</tbody>
	</table>
<%
} catch (Exception e) {
	e.printStackTrace();
}
%>