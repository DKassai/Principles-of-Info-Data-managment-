<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.Time"%>
<%

Connection connection = null;
String station = request.getParameter("station");
String databaseName = "TRAINS";
String url = "jdbc:mysql://group29.cdbekejbzng4.us-east-2.rds.amazonaws.com:3306/" + databaseName;
String username = "Admin";
String password = "Password123";
Class.forName("com.mysql.jdbc.Driver");
connection = DriverManager.getConnection(url, username, password);

try {
	String stationName = "";
	if (station.equals("gc4")) stationName = "Grand Central";
	else if (station.equals("mp3")) stationName = "Metro Park";
	else if (station.equals("nb2")) stationName = "New Brunswick";
	else if (station.equals("ps1")) stationName = "Penn Station";
	
	Statement st = connection.createStatement();
	ResultSet rs = st.executeQuery("SELECT * FROM TRAINSCHEDULE where origin = '"+ station +"' or destination = '"+ station +"' order by transitName");
%>
	<a href="landingpageCustomerRep.jsp">Back to Home Page</a> <br> <br>
	Here are the train schedules that have <%=stationName%> as an origin or as a destination: <br>
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