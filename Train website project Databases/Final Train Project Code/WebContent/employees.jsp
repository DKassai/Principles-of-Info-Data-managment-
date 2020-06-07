<%@ page import ="java.sql.*" %>
<%@ page import ="java.sql.Connection" %>
<%@ page import="java.util.*"%>
<%

Connection connection = null;
String user =  session.getAttribute("empUser").toString();
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
	<a href="landingpageCustomerRep.jsp">Back to Home Page</a> <br> <br>
	<head>
	List of Employees:
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
		<th style="width: 15%">SSN</th>
		<th style="width: 20%">First Name</th>
		<th style="width: 20%">Last Name</th>
		<th style="width: 15%">Employee User Name</th>
		<th style="width: 30%">Type of Employee</th>
	</tr>
	</thead>
	<tbody>
	
<% 	while (rs.next()) {
	String ssn = rs.getString("ssn");
	String hidden = "XXX-XX-" + ssn.substring(5);
	String type = "Customer Representative";
	Boolean admin = rs.getBoolean("admin");
	if (admin == true) type = "Admin";
%>	
	<tr>
		<td style="width: 15%"><%= hidden %></td>
		<td style="width: 20%"><%= rs.getString("firstName") %></td>
		<td style="width: 20%"><%= rs.getString("lastName") %></td>
		<td style="width: 15%"><%= rs.getString("userName") %></td>
		<td style="width: 30%"><%= type %></td>
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