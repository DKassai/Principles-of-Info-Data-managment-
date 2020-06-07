<%@ page import ="java.sql.*" %>
<%@ page import ="java.sql.Connection" %>
<%@ page import="java.util.*"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.time.ZoneId"%>
<%

Connection connection = null;
String user =  session.getAttribute("empUser").toString();
String databaseName = "TRAINS";
String url = "jdbc:mysql://group29.cdbekejbzng4.us-east-2.rds.amazonaws.com:3306/" + databaseName;
String username = "Admin";
String password = "Password123";
Class.forName("com.mysql.jdbc.Driver");
connection = DriverManager.getConnection(url, username, password);

ZoneId zone = ZoneId.of("America/New_York");

LocalDate dmade = LocalDate.now(zone);

try {
	Statement st = connection.createStatement();
	ResultSet rs = st.executeQuery("select * from RESERVATION order by date desc");
%>
	<a href="landingpageCustomerRep.jsp">Back to Home Page</a> <br> <br>
	
	<a href="manageRep.jsp">View Reservations</a> |
	<a href="resDelete.jsp">Delete Reservation</a> |
	<a href="resUpdate.jsp">Edit Reservation</a> <br> <br>
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
	<form action = "resAddRes.jsp" method = "POST">
	<div id="inputField" style="display: block">
		Reservation ID:<input type="text" name="rid" id="rid" size=12 maxlength="10"><br>
		Date:<input type="text" required placeholder="YYYY-MM-DD" name="date" id="date" size=12 maxlength="10"><br>
		Total Fare:<input type="text" name="fare" id="fare"><br>
		User Name:<input type="text" name="username" id="username"><br>
		Departure Time:<input type="text" required placeholder="HH:MM:SS" name="depTime" id="depTime" size=10 maxlength="8"><br>
		Arrival Time:<input type="text" required placeholder="HH:MM:SS" name="arrTime" id="arrTime" size=10 maxlength="8"><br>
		Origin:<input type="text" name="origin" id="origin" size=6><br>
		Destination:<input type="text" name="dest" id="dest" size=6><br>
		First Name:<input type="text" name="fname" id="fname" size=20><br>
		Last Name:<input type="text" name="lname" id="lname" size=20><br>
		Transit Line:<input type="text" name="tline" id="tline" size=25><br>
		Class Type:<input type="text" name="ctype" id="ctype" size=15><br>
		Train No.:<input type="text" name="tnum" id="tnum" size=5 maxlength="4"><br>
		Seat No.:<input type="text" name="snum" id="snum" size=5 maxlength="2"><br>
		Duration:<input type="text" required placeholder="YYYY-MM-DD" name="duration" id="duration" size=12 maxlength="10"><br>
		Employee User Name:<input type="text" name="empusername" id="empusername" value="<%= user %>"readonly><br>		
   	<button type="submit" style="background-color: #0260FF; color: white">Add this Reservation</button>
    </div>
    </form>
	<table id="tableStock" style="width: 1000px; display: block">
	<thead>
	<tr>
		<th style="width: 12%">Reservation ID</th>
		<th style="width: 11%">Date</th>
		<th style="width: 8%">Total Fare</th>
		<th style="width: 10%">User Name</th>
		<th style="width: 6%">Departure Time</th>
		<th style="width: 6%">Arrival Time</th>
		<th style="width: 6%">Origin</th>
		<th style="width: 8%">Destination</th>
		<th style="width: 17%">Passenger Name</th>
		<th style="width: 9%">Transit Line</th>
		<th style="width: 7%">Class Type</th>
		<th style="width: 7%">Customer Rep</th>
	</tr>
	</thead>
	<tbody>
	
<% 	while (rs.next()) {
%>	
	<tr>
		<td style="width: 12%"><%= rs.getString(1) %></td>
		<td style="width: 11%"><%= rs.getString(2) %></td>
		<td style="width: 8%">$<%= rs.getString(3) %>.00</td>
		<td style="width: 10%"><%= rs.getString(4) %></td>
		<td style="width: 6%"><%= rs.getTime(5) %></td>
		<td style="width: 6%"><%= rs.getString(6) %></td>
		<td style="width: 6%"><%= rs.getString(7) %></td>
		<td style="width: 8%"><%= rs.getString(8) %></td>
		<td style="width: 17%"><%= rs.getString(9) + " " + rs.getString(10) %></td>
		<td style="width: 9%"><%= rs.getString(11) %></td>
		<td style="width: 7%"><%= rs.getString(12) %></td>
		<td style="width: 7%"><%= rs.getString(17) %></td>
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