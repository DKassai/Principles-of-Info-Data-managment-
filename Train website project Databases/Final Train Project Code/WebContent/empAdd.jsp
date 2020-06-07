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
	ResultSet rs = st.executeQuery("select * from EMPLOYEE where firstName <> ''");
%>
	<a href="landingpageCustomerRep.jsp">Back to Home Page</a> <br> <br>
	
	<a href="manageEmp.jsp">View Employee Information</a> |
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
	<form action = "empAddEmp.jsp" method = "POST">
	<div id="inputField" style="display: block">
		SSN:<input type="text" required placeholder = "No dashes" name="ssn" id="ssn" maxlength="9"><br>
		First Name:<input type="text" name="fName" id="fName"><br>
		Last Name:<input type="text" name="lName" id="lName" size=16><br>
		User Name:<input type="text" name="userName" id="userName" size=20><br>
		Password:<input type="text" name="password" id="password" size=16><br>
   	<button type="submit" style="background-color: #0260FF; color: white">Add this Employee</button>
    </div>
    </form>
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
	</table>
<%
} catch (Exception e) {
	e.printStackTrace();
}
%>