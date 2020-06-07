<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.Time"%>
<%

Connection connection = null;
String origin = request.getParameter("origin");
String destination = request.getParameter("destination");
String databaseName = "TRAINS";
String url = "jdbc:mysql://group29.cdbekejbzng4.us-east-2.rds.amazonaws.com:3306/" + databaseName;
String username = "Admin";
String password = "Password123";
Class.forName("com.mysql.jdbc.Driver");
connection = DriverManager.getConnection(url, username, password);

try {
	String originName = "";
	String destinationName = "";
	if (origin.equals("gc4")) originName = "Grand Central";
	else if (origin.equals("mp3")) originName = "Metro Park";
	else if (origin.equals("nb2")) originName = "New Brunswick";
	else if (origin.equals("ps1")) originName = "Penn Station";
	if (destination.equals("gc4")) destinationName = "Grand Central";
	else if (destination.equals("mp3")) destinationName = "Metro Park";
	else if (destination.equals("nb2")) destinationName = "New Brunswick";
	else if (destination.equals("ps1")) destinationName = "Penn Station";
	
	Statement st = connection.createStatement();
	ResultSet rs = st.executeQuery("SELECT * FROM TRAINSCHEDULE where origin = '"+ origin +"' and destination = '"+ destination +"' order by transitName");
%>
	<a href="landingpageCustomerRep.jsp">Back to Home Page</a> <br> <br>
	Here are the train schedules for origin <%=originName%> and destination <%=destinationName%>: <br>
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
	<table id="tableStock" style="width: 1000px; display: block">
	<thead>
	<tr>
		<th style="width: 16%">Transit Name</th>
		<th style="width: 10%">Date</th>
		<th style="width: 8%">Departure</th>
		<th style="width: 9%">Travel Time</th>
		<th style="width: 8%">Arrival</th>
		<th style="width: 6%">No. Stops</th>
		<th style="width: 10%">Origin</th>
		<th style="width: 5%">Stop 1</th>
		<th style="width: 5%">Stop 2</th>
		<th style="width: 12%">Destination</th>
		<th style="width: 10%">Fare</th>
		<th style="width: 6">Train No.</th>
	</tr>
	</thead>
	<tbody>
<% 	while (rs.next()) {
%>	
	<tr>
		<td style="width: 16%"><%= rs.getString("transitName") %></td>
		<td style="width: 10%"><%= rs.getDate("departure") %></td>
		<td style="width: 8%"><%= rs.getTime("departure") %></td>
		<td style="width: 9%"><%= rs.getString("travelTime") %></td>
		<td style="width: 8%"><%= rs.getTime("arrival") %></td>
		<td style="width: 6%"><%= rs.getString("numberOfStops") %></td>
		<td style="width: 10%"><%= rs.getString("origin") %></td>
		<td style="width: 5%"><%= rs.getString("stop_1") %></td>
		<td style="width: 5%"><%= rs.getString("stop_2") %></td>
		<td style="width: 12%"><%= rs.getString("destination") %></td>
		<td style="width: 10%">$<%= rs.getString("fare") %>.00</td>
		<td style="width: 6%"><%= rs.getString("trainID") %></td>
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