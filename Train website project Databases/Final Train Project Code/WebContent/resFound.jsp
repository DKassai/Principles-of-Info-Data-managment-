<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.Time"%>
<%

Connection connection = null;
String tline = request.getParameter("tline");
String tnum = request.getParameter("tnum");
String databaseName = "TRAINS";
String url = "jdbc:mysql://group29.cdbekejbzng4.us-east-2.rds.amazonaws.com:3306/" + databaseName;
String username = "Admin";
String password = "Password123";
Class.forName("com.mysql.jdbc.Driver");
connection = DriverManager.getConnection(url, username, password);

try {
	Statement st = connection.createStatement();
	ResultSet rs = st.executeQuery("SELECT * FROM RESERVATION where transitName = '"+ tline +"' and trainNumber = '"+ tnum +"' order by userName");
%>
	<a href="landingpageCustomerRep.jsp">Back to Home Page</a> <br> <br>
	Here are the customers who have seats reserved on <%=tline%> #<%=tnum%>: <br>
	<head>
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
	<table id="tableStock" style="width: 750px; display: block">
	<thead>
	<tr>
		<th style="width: 25%">User Name</th>
		<th style="width: 25%">Passenger Name</th>
		<th style="width: 15%">Reservation ID</th>
		<th style="width: 15%">Date</th>
		<th style="width: 10%">Class Type</th>		
		<th style="width: 10%">Seat No.</th>
	</tr>
	</thead>
	<tbody>
<% 	while (rs.next()) {
%>	
	<tr>
		<td style="width: 25%"><%= rs.getString("userName") %></td>
		<td style="width: 25%"><%= rs.getString("firstName") + " " + rs.getString("lastName") %></td>
		<td style="width: 15%"><%= rs.getString("reservationID") %></td>
		<td style="width: 15%"><%= rs.getString("date") %></td>
		<td style="width: 10%"><%= rs.getString("classType") %></td>
		<td style="width: 10%"><%= rs.getString("seatNumber") %></td>
	</tr>
<%
}
%>
	</tbody>
	</table>
<%
} catch (Exception e) {
	e.printStackTrace();
}
%>