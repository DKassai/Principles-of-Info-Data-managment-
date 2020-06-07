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
	<a href="landingpageCustomerRep.jsp">Back to Home Page</a> <br> <br>
	
	<a href="manageCust.jsp">View Customer Information</a> |
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
	<form action = "cusAddCus.jsp" method = "POST">
	<div id="inputField" style="display: block">
		User Name:<input type="text" name="cusName" id="cusName"><br>
		Email:<input type="text" name="cusEmail" id="cusEmail"><br>
		Password:<input type="text" name="cusPassword" id="cusPassword" size=20><br>
		First Name:<input type="text" name="fName" id="fName"><br>
		Last Name:<input type="text" name="lName" id="lName" size=16><br>
		Address:<input type="text" name="cusAddress" id="cusAddress" size=20><br>
		City:<input type="text" name="cusCity" id="cusCity" size=16><br>
		Telephone:<input type="text" name="cusTelephone" id="cusTelephone" size=10><br>
		State:<input type="text" required placeholder="ex: NJ" name="cusState" id="cusState" size=6 maxlength="2"><br>
		Zip Code:<input type="text" name="cusZip" id="cusZip" size=10 maxlength="5"><br>
   	<button type="submit" style="background-color: #0260FF; color: white">Add this Customer</button>
    </div>
    </form>
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
	</table>
<%
} catch (Exception e) {
	e.printStackTrace();
}
%>