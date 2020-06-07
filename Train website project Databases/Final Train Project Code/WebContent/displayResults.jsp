<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.Time"%>
<%

Connection connection = null;
String origin = request.getParameter("origin");
String destination = request.getParameter("destination");
String date = request.getParameter("date");
String databaseName = "TRAINS";
String url = "jdbc:mysql://group29.cdbekejbzng4.us-east-2.rds.amazonaws.com:3306/" + databaseName;
String username = "Admin";
String password = "Password123";
Class.forName("com.mysql.jdbc.Driver");
connection = DriverManager.getConnection(url, username, password);
session.setAttribute("departureStation", origin);
session.setAttribute("arrivalStation", destination);
session.setAttribute("date", date);

try {
	//Connection con = DriverManager.getConnection("jdbc:mysql://group29.cdbekejbzng4.us-east-2.rds.amazonaws.com:3306/TRAINS","Admin", "Password123");
	Statement st = connection.createStatement();
	Statement stDep = connection.createStatement();
	Statement stArr = connection.createStatement();
	Statement stOrg = connection.createStatement();
	Statement stDst = connection.createStatement();
	Statement stFar = connection.createStatement();
	ResultSet rs, rsDep, rsArr, rsOrg, rsDst, rsFar;
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

%>
	Search results for traveling from <%=originName %> to <%=destinationName %>:<br><br>
	To sort, click on arrow button for corresponding column header. To begin making a reservation, click on any Transit Name.

<%	
	rs = st.executeQuery("select * from TRAINSCHEDULE where transitName IN (select transitName from TRAINSCHEDULE where origin='" + origin + "' and destination='" + destination
			+ "' and LEFT(departure,10)='" + date + "' UNION select transitName from TRAINSCHEDULE where origin='" + origin + "' and stop_1='" + destination
			+ "' and LEFT(departure,10)='" + date + "' UNION select transitName from TRAINSCHEDULE where origin='" + origin + "' and stop_2='" + destination
			+ "' and LEFT(departure,10)='" + date + "' UNION select transitName from TRAINSCHEDULE where stop_1='" + origin + "' and stop_2='" + destination
			+ "' and LEFT(departure,10)='" + date + "' UNION select transitName from TRAINSCHEDULE where stop_1='" + origin + "' and destination='" + destination
			+ "' and LEFT(departure,10)='" + date + "' UNION select transitName from TRAINSCHEDULE where stop_2='" + origin + "' and destination='" + destination
			+ "' and LEFT(departure,10)='" + date + "') group by transitName");
	rsDep = stDep.executeQuery("select * from TRAINSCHEDULE where origin='" + origin + "' and destination='" + destination
			+ "' and LEFT(departure,10)='" + date + "' UNION select * from TRAINSCHEDULE where origin='" + origin + "' and stop_1='" + destination
			+ "' and LEFT(departure,10)='" + date + "' UNION select * from TRAINSCHEDULE where origin='" + origin + "' and stop_2='" + destination
			+ "' and LEFT(departure,10)='" + date + "' UNION select * from TRAINSCHEDULE where stop_1='" + origin + "' and stop_2='" + destination
			+ "' and LEFT(departure,10)='" + date + "' UNION select * from TRAINSCHEDULE where stop_1='" + origin + "' and destination='" + destination
			+ "' and LEFT(departure,10)='" + date + "' UNION select * from TRAINSCHEDULE where stop_2='" + origin + "' and destination='" + destination
			+ "' and LEFT(departure,10)='" + date + "' order by departure, transitName");
	rsArr = stArr.executeQuery("select * from TRAINSCHEDULE where origin='" + origin + "' and destination='" + destination
			+ "' and LEFT(departure,10)='" + date + "' UNION select * from TRAINSCHEDULE where origin='" + origin + "' and stop_1='" + destination
			+ "' and LEFT(departure,10)='" + date + "' UNION select * from TRAINSCHEDULE where origin='" + origin + "' and stop_2='" + destination
			+ "' and LEFT(departure,10)='" + date + "' UNION select * from TRAINSCHEDULE where stop_1='" + origin + "' and stop_2='" + destination
			+ "' and LEFT(departure,10)='" + date + "' UNION select * from TRAINSCHEDULE where stop_1='" + origin + "' and destination='" + destination
			+ "' and LEFT(departure,10)='" + date + "' UNION select * from TRAINSCHEDULE where stop_2='" + origin + "' and destination='" + destination
			+ "' and LEFT(departure,10)='" + date + "' order by arrival, transitName");
	rsOrg = stOrg.executeQuery("select * from TRAINSCHEDULE where transitName IN (select transitName from TRAINSCHEDULE where origin='" + origin + "' and destination='" + destination
			+ "' and LEFT(departure,10)='" + date + "' UNION select transitName from TRAINSCHEDULE where origin='" + origin + "' and stop_1='" + destination
			+ "' and LEFT(departure,10)='" + date + "' UNION select transitName from TRAINSCHEDULE where origin='" + origin + "' and stop_2='" + destination
			+ "' and LEFT(departure,10)='" + date + "' UNION select transitName from TRAINSCHEDULE where stop_1='" + origin + "' and stop_2='" + destination
			+ "' and LEFT(departure,10)='" + date + "' UNION select transitName from TRAINSCHEDULE where stop_1='" + origin + "' and destination='" + destination
			+ "' and LEFT(departure,10)='" + date + "' UNION select transitName from TRAINSCHEDULE where stop_2='" + origin + "' and destination='" + destination
			+ "' and LEFT(departure,10)='" + date + "') group by origin, transitName order by origin desc");
	rsDst = stDst.executeQuery("select * from TRAINSCHEDULE where transitName IN (select transitName from TRAINSCHEDULE where origin='" + origin + "' and destination='" + destination
			+ "' and LEFT(departure,10)='" + date + "' UNION select transitName from TRAINSCHEDULE where origin='" + origin + "' and stop_1='" + destination
			+ "' and LEFT(departure,10)='" + date + "' UNION select transitName from TRAINSCHEDULE where origin='" + origin + "' and stop_2='" + destination
			+ "' and LEFT(departure,10)='" + date + "' UNION select transitName from TRAINSCHEDULE where stop_1='" + origin + "' and stop_2='" + destination
			+ "' and LEFT(departure,10)='" + date + "' UNION select transitName from TRAINSCHEDULE where stop_1='" + origin + "' and destination='" + destination
			+ "' and LEFT(departure,10)='" + date + "' UNION select transitName from TRAINSCHEDULE where stop_2='" + origin + "' and destination='" + destination
			+ "' and LEFT(departure,10)='" + date + "') group by destination, transitName order by destination desc");
	rsFar = stFar.executeQuery("select * from TRAINSCHEDULE where transitName IN (select transitName from TRAINSCHEDULE where origin='" + origin + "' and destination='" + destination
			+ "' and LEFT(departure,10)='" + date + "' UNION select transitName from TRAINSCHEDULE where origin='" + origin + "' and stop_1='" + destination
			+ "' and LEFT(departure,10)='" + date + "' UNION select transitName from TRAINSCHEDULE where origin='" + origin + "' and stop_2='" + destination
			+ "' and LEFT(departure,10)='" + date + "' UNION select transitName from TRAINSCHEDULE where stop_1='" + origin + "' and stop_2='" + destination
			+ "' and LEFT(departure,10)='" + date + "' UNION select transitName from TRAINSCHEDULE where stop_1='" + origin + "' and destination='" + destination
			+ "' and LEFT(departure,10)='" + date + "' UNION select transitName from TRAINSCHEDULE where stop_2='" + origin + "' and destination='" + destination
			+ "' and LEFT(departure,10)='" + date + "') group by fare, transitName");
%>
	<head>
	<script type="text/javascript"src="js/angular/angular.min.js"></script>
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
		<th style="width: 11%">Departure <button onclick="setFuncDep()">^</button></th>
		<th style="width: 9%">Travel Time</th>
		<th style="width: 10%">Arrival <button onclick="setFuncArr()">^</button></th>
		<th style="width: 6%">No. Stops</th>
		<th style="width: 10%">Origin <button onclick="setFuncOrg()">^</button></th>
		<th style="width: 5%">Stop 1</th>
		<th style="width: 5%">Stop 2</th>
		<th style="width: 12%">Destination <button onclick="setFuncDst()">^</button></th>
		<th style="width: 6%">No. Seats</th>
		<th style="width: 10%">Fare <button onclick="setFuncFar()">^</button></th>
		<th style="width: 6">Train No.</th>
	</tr>
	</thead>
	<tbody>
	
<% 	while (rs.next()) {
		int stopCount = 0;
		int numStops = rs.getInt("numberOfStops");
		float fareDis = rs.getFloat("fare");
		Time depTime = rs.getTime("departure");
		Time arrTime = rs.getTime("arrival");
		if (rs.getString("origin").equals(origin) && rs.getString("destination").equals(destination)){
			stopCount = numStops;
			fareDis = fareDis;
			depTime = depTime;
			arrTime = arrTime;
		}
		else if(rs.getString("origin").equals(origin) && rs.getString("stop_1").equals(destination)){
			stopCount = 0;
			fareDis = fareDis - 5*numStops;
			arrTime = new Time(depTime.getTime() + (1000 * 60 * 45));
		}
		else if(rs.getString("origin").equals(origin) && rs.getString("stop_2").equals(destination)){
			stopCount = 1;
			fareDis = 15;
			arrTime = new Time(depTime.getTime() + (1000 * 60 * 45 * 2));
		}
		else if(rs.getString("stop_1").equals(origin) && rs.getString("stop_2").equals(destination)){
			stopCount = 0;
			fareDis = 10;
			depTime = new Time(depTime.getTime() + (1000 * 60 * 45));
			arrTime = new Time(arrTime.getTime() - (1000 * 60 * 45));
		}
		else if(rs.getString("stop_1").equals(origin) && rs.getString("destination").equals(destination)){
			stopCount = numStops-1;
			fareDis = fareDis - 5;
			depTime = new Time(depTime.getTime() + (1000 * 60 * 45));
		}
		else if(rs.getString("stop_2").equals(origin) && rs.getString("destination").equals(destination)){
			stopCount = 0;
			fareDis = 10;
			depTime = new Time(depTime.getTime() + (1000 * 60 * 45 * 2));
		}
%>	
		<tr>
			<td style="width: 16%"><%= rs.getString("transitName") %></td>
			<td style="width: 11%"><%= depTime %></td>
			<td style="width: 9%"><%= (stopCount+1)*45 %></td>
			<td style="width: 10%"><%= arrTime %></td>
			<td style="width: 6%"><%= stopCount %></td>
			<td style="width: 10%"><%= rs.getString("origin") %></td>
			<td style="width: 5%"><%= rs.getString("stop_1") %></td>
			<td style="width: 5%"><%= rs.getString("stop_2") %></td>
			<td style="width: 12%"><%= rs.getString("destination") %></td>
			<td style="width: 6%"><%= rs.getString("availableSeats") %></td>
			<td style="width: 10%">$<%= fareDis %>0</td>
			<td style="width: 6%"><%= rs.getString("trainID") %></td>
		</tr>
<%
	}
%>	</tbody>
	</table>
	
	<table id="tableDep" style="width: 1000px; display: none">
	<thead>
	<tr>
		<th style="width: 16%">Transit Name</th>
		<th style="width: 11%">Departure <button onclick="setFuncDep()">^</button></th>
		<th style="width: 9%">Travel Time</th>
		<th style="width: 10%">Arrival <button onclick="setFuncArr()">^</button></th>
		<th style="width: 6%">No. Stops</th>
		<th style="width: 10%">Origin <button onclick="setFuncOrg()">^</button></th>
		<th style="width: 5%">Stop 1</th>
		<th style="width: 5%">Stop 2</th>
		<th style="width: 12%">Destination <button onclick="setFuncDst()">^</button></th>
		<th style="width: 6%">No. Seats</th>
		<th style="width: 10%">Fare <button onclick="setFuncFar()">^</button></th>
		<th style="width: 6">Train No.</th>		
	</tr>
	</thead>
	<tbody>
	
<% 	while (rsDep.next()) {
		int stopCount = 0;
		int numStops = rsDep.getInt("numberOfStops");
		float fareDis = rsDep.getFloat("fare");
		Time depTime = rsDep.getTime("departure");
		Time arrTime = rsDep.getTime("arrival");
		if (rsDep.getString("origin").equals(origin) && rsDep.getString("destination").equals(destination)){
			stopCount = numStops;
			fareDis = fareDis;
			depTime = depTime;
			arrTime = arrTime;
		}
		else if(rsDep.getString("origin").equals(origin) && rsDep.getString("stop_1").equals(destination)){
			stopCount = 0;
			fareDis = fareDis - 5*numStops;
			arrTime = new Time(depTime.getTime() + (1000 * 60 * 45));
		}
		else if(rsDep.getString("origin").equals(origin) && rsDep.getString("stop_2").equals(destination)){
			stopCount = 1;
			fareDis = 15;
			arrTime = new Time(depTime.getTime() + (1000 * 60 * 45 * 2));
		}
		else if(rsDep.getString("stop_1").equals(origin) && rsDep.getString("stop_2").equals(destination)){
			stopCount = 0;
			fareDis = 10;
			depTime = new Time(depTime.getTime() + (1000 * 60 * 45));
			arrTime = new Time(arrTime.getTime() - (1000 * 60 * 45));
		}
		else if(rsDep.getString("stop_1").equals(origin) && rsDep.getString("destination").equals(destination)){
			stopCount = numStops-1;
			fareDis = fareDis - 5;
			depTime = new Time(depTime.getTime() + (1000 * 60 * 45));
		}
		else if(rsDep.getString("stop_2").equals(origin) && rsDep.getString("destination").equals(destination)){
			stopCount = 0;
			fareDis = 10;
			depTime = new Time(depTime.getTime() + (1000 * 60 * 45 * 2));
		}
%>	
		<tr>
			<td style="width: 16%"><%= rsDep.getString("transitName") %></td>
			<td style="width: 11%"><%= depTime %></td>
			<td style="width: 9%"><%= (stopCount+1)*45 %></td>
			<td style="width: 10%"><%= arrTime %></td>
			<td style="width: 6%"><%= stopCount %></td>
			<td style="width: 10%"><%= rsDep.getString("origin") %></td>
			<td style="width: 5%"><%= rsDep.getString("stop_1") %></td>
			<td style="width: 5%"><%= rsDep.getString("stop_2") %></td>
			<td style="width: 12%"><%= rsDep.getString("destination") %></td>
			<td style="width: 6%"><%= rsDep.getString("availableSeats") %></td>
			<td style="width: 10%">$<%= fareDis %>0</td>
			<td style="width: 6%"><%= rsDep.getString("trainID") %></td>
		</tr>
<%
	}
%>	</tbody>
	</table>
	
	<table id="tableArr" style="width: 1000px; display: none">
	<thead>
	<tr>
		<th style="width: 16%">Transit Name</th>
		<th style="width: 11%">Departure <button onclick="setFuncDep()">^</button></th>
		<th style="width: 9%">Travel Time</th>
		<th style="width: 10%">Arrival <button onclick="setFuncArr()">^</button></th>
		<th style="width: 6%">No. Stops</th>
		<th style="width: 10%">Origin <button onclick="setFuncOrg()">^</button></th>
		<th style="width: 5%">Stop 1</th>
		<th style="width: 5%">Stop 2</th>
		<th style="width: 12%">Destination <button onclick="setFuncDst()">^</button></th>
		<th style="width: 6%">No. Seats</th>
		<th style="width: 10%">Fare <button onclick="setFuncFar()">^</button></th>
		<th style="width: 6">Train No.</th>		
	</tr>
	</thead>
	<tbody>
	
<% 	while (rsArr.next()) {
		int stopCount = 0;
		int numStops = rsArr.getInt("numberOfStops");
		float fareDis = rsArr.getFloat("fare");
		Time depTime = rsArr.getTime("departure");
		Time arrTime = rsArr.getTime("arrival");
		if (rsArr.getString("origin").equals(origin) && rsArr.getString("destination").equals(destination)){
			stopCount = numStops;
			fareDis = fareDis;
			depTime = depTime;
			arrTime = arrTime;
		}
		else if(rsArr.getString("origin").equals(origin) && rsArr.getString("stop_1").equals(destination)){
			stopCount = 0;
			fareDis = fareDis - 5*numStops;
			arrTime = new Time(depTime.getTime() + (1000 * 60 * 45));
		}
		else if(rsArr.getString("origin").equals(origin) && rsArr.getString("stop_2").equals(destination)){
			stopCount = 1;
			fareDis = 15;
			arrTime = new Time(depTime.getTime() + (1000 * 60 * 45 * 2));
		}
		else if(rsArr.getString("stop_1").equals(origin) && rsArr.getString("stop_2").equals(destination)){
			stopCount = 0;
			fareDis = 10;
			depTime = new Time(depTime.getTime() + (1000 * 60 * 45));
			arrTime = new Time(arrTime.getTime() - (1000 * 60 * 45));
		}
		else if(rsArr.getString("stop_1").equals(origin) && rsArr.getString("destination").equals(destination)){
			stopCount = numStops-1;
			fareDis = fareDis - 5;
			depTime = new Time(depTime.getTime() + (1000 * 60 * 45));
		}
		else if(rsArr.getString("stop_2").equals(origin) && rsArr.getString("destination").equals(destination)){
			stopCount = 0;
			fareDis = 10;
			depTime = new Time(depTime.getTime() + (1000 * 60 * 45 * 2));
		}
%>	
		<tr>
			<td style="width: 16%"><%= rsArr.getString("transitName") %></td>
			<td style="width: 11%"><%= depTime %></td>
			<td style="width: 9%"><%= (stopCount+1)*45 %></td>
			<td style="width: 10%"><%= arrTime %></td>
			<td style="width: 6%"><%= stopCount %></td>
			<td style="width: 10%"><%= rsArr.getString("origin") %></td>
			<td style="width: 5%"><%= rsArr.getString("stop_1") %></td>
			<td style="width: 5%"><%= rsArr.getString("stop_2") %></td>
			<td style="width: 12%"><%= rsArr.getString("destination") %></td>
			<td style="width: 6%"><%= rsArr.getString("availableSeats") %></td>
			<td style="width: 10%">$<%= fareDis %>0</td>		
			<td style="width: 6%"><%= rsArr.getString("trainID") %></td>
		</tr>
<%
	}
%>	</tbody>
	</table>
	
	<table id="tableOrg" style="width: 1000px; display: none">
	<thead>
	<tr>
		<th style="width: 16%">Transit Name</th>
		<th style="width: 11%">Departure <button onclick="setFuncDep()">^</button></th>
		<th style="width: 9%">Travel Time</th>
		<th style="width: 10%">Arrival <button onclick="setFuncArr()">^</button></th>
		<th style="width: 6%">No. Stops</th>
		<th style="width: 10%">Origin <button onclick="setFuncOrg()">^</button></th>
		<th style="width: 5%">Stop 1</th>
		<th style="width: 5%">Stop 2</th>
		<th style="width: 12%">Destination <button onclick="setFuncDst()">^</button></th>
		<th style="width: 6%">No. Seats</th>
		<th style="width: 10%">Fare <button onclick="setFuncFar()">^</button></th>
		<th style="width: 6">Train No.</th>		
	</tr>
	</thead>
	<tbody>
	
<% 	while (rsOrg.next()) {
		int stopCount = 0;
		int numStops = rsOrg.getInt("numberOfStops");
		float fareDis = rsOrg.getFloat("fare");
		Time depTime = rsOrg.getTime("departure");
		Time arrTime = rsOrg.getTime("arrival");
		if (rsOrg.getString("origin").equals(origin) && rsOrg.getString("destination").equals(destination)){
			stopCount = numStops;
			fareDis = fareDis;
			depTime = depTime;
			arrTime = arrTime;
		}
		else if(rsOrg.getString("origin").equals(origin) && rsOrg.getString("stop_1").equals(destination)){
			stopCount = 0;
			fareDis = fareDis - 5*numStops;
			arrTime = new Time(depTime.getTime() + (1000 * 60 * 45));
		}
		else if(rsOrg.getString("origin").equals(origin) && rsOrg.getString("stop_2").equals(destination)){
			stopCount = 1;
			fareDis = 15;
			arrTime = new Time(depTime.getTime() + (1000 * 60 * 45 * 2));
		}
		else if(rsOrg.getString("stop_1").equals(origin) && rsOrg.getString("stop_2").equals(destination)){
			stopCount = 0;
			fareDis = 10;
			depTime = new Time(depTime.getTime() + (1000 * 60 * 45));
			arrTime = new Time(arrTime.getTime() - (1000 * 60 * 45));
		}
		else if(rsOrg.getString("stop_1").equals(origin) && rsOrg.getString("destination").equals(destination)){
			stopCount = numStops-1;
			fareDis = fareDis - 5;
			depTime = new Time(depTime.getTime() + (1000 * 60 * 45));
		}
		else if(rsOrg.getString("stop_2").equals(origin) && rsOrg.getString("destination").equals(destination)){
			stopCount = 0;
			fareDis = 10;
			depTime = new Time(depTime.getTime() + (1000 * 60 * 45 * 2));
		}
%>	
		<tr>
			<td style="width: 16%"><%= rsOrg.getString("transitName") %></td>
			<td style="width: 11%"><%= depTime %></td>
			<td style="width: 9%"><%= (stopCount+1)*45 %></td>
			<td style="width: 10%"><%= arrTime %></td>
			<td style="width: 6%"><%= stopCount %></td>
			<td style="width: 10%"><%= rsOrg.getString("origin") %></td>
			<td style="width: 5%"><%= rsOrg.getString("stop_1") %></td>
			<td style="width: 5%"><%= rsOrg.getString("stop_2") %></td>
			<td style="width: 12%"><%= rsOrg.getString("destination") %></td>
			<td style="width: 6%"><%= rsOrg.getString("availableSeats") %></td>
			<td style="width: 10%">$<%= fareDis %>0</td>
			<td style="width: 6%"><%= rsOrg.getString("trainID") %></td>
		</tr>
<%
	}
%>	</tbody>
	</table>
	
	<table id="tableDst" style="width: 1000px; display: none">
	<thead>
	<tr>
		<th style="width: 16%">Transit Name</th>
		<th style="width: 11%">Departure <button onclick="setFuncDep()">^</button></th>
		<th style="width: 9%">Travel Time</th>
		<th style="width: 10%">Arrival <button onclick="setFuncArr()">^</button></th>
		<th style="width: 6%">No. Stops</th>
		<th style="width: 10%">Origin <button onclick="setFuncOrg()">^</button></th>
		<th style="width: 5%">Stop 1</th>
		<th style="width: 5%">Stop 2</th>
		<th style="width: 12%">Destination <button onclick="setFuncDst()">^</button></th>
		<th style="width: 6%">No. Seats</th>
		<th style="width: 10%">Fare <button onclick="setFuncFar()">^</button></th>
		<th style="width: 6">Train No.</th>
	</tr>
	</thead>
	<tbody>
	
<% 	while (rsDst.next()) {
		int stopCount = 0;
		int numStops = rsDst.getInt("numberOfStops");
		float fareDis = rsDst.getFloat("fare");
		Time depTime = rsDst.getTime("departure");
		Time arrTime = rsDst.getTime("arrival");
		if (rsDst.getString("origin").equals(origin) && rsDst.getString("destination").equals(destination)){
			stopCount = numStops;
			fareDis = fareDis;
			depTime = depTime;
			arrTime = arrTime;
		}
		else if(rsDst.getString("origin").equals(origin) && rsDst.getString("stop_1").equals(destination)){
			stopCount = 0;
			fareDis = fareDis - 5*numStops;
			arrTime = new Time(depTime.getTime() + (1000 * 60 * 45));
		}
		else if(rsDst.getString("origin").equals(origin) && rsDst.getString("stop_2").equals(destination)){
			stopCount = 1;
			fareDis = 15;
			arrTime = new Time(depTime.getTime() + (1000 * 60 * 45 * 2));
		}
		else if(rsDst.getString("stop_1").equals(origin) && rsDst.getString("stop_2").equals(destination)){
			stopCount = 0;
			fareDis = 10;
			depTime = new Time(depTime.getTime() + (1000 * 60 * 45));
			arrTime = new Time(arrTime.getTime() - (1000 * 60 * 45));
		}
		else if(rsDst.getString("stop_1").equals(origin) && rsDst.getString("destination").equals(destination)){
			stopCount = numStops-1;
			fareDis = fareDis - 5;
			depTime = new Time(depTime.getTime() + (1000 * 60 * 45));
		}
		else if(rsDst.getString("stop_2").equals(origin) && rsDst.getString("destination").equals(destination)){
			stopCount = 0;
			fareDis = 10;
			depTime = new Time(depTime.getTime() + (1000 * 60 * 45 * 2));
		}
%>	
		<tr>
			<td style="width: 16%"><%= rsDst.getString("transitName") %></td>
			<td style="width: 11%"><%= depTime %></td>
			<td style="width: 9%"><%= (stopCount+1)*45 %></td>
			<td style="width: 10%"><%= arrTime %></td>
			<td style="width: 6%"><%= stopCount %></td>
			<td style="width: 10%"><%= rsDst.getString("origin") %></td>
			<td style="width: 5%"><%= rsDst.getString("stop_1") %></td>
			<td style="width: 5%"><%= rsDst.getString("stop_2") %></td>
			<td style="width: 12%"><%= rsDst.getString("destination") %></td>
			<td style="width: 6%"><%= rsDst.getString("availableSeats") %></td>
			<td style="width: 10%">$<%= fareDis %>0</td>
			<td style="width: 6%"><%= rsDst.getString("trainID") %></td>
		</tr>
<%
	}
%>	</tbody>
	</table>
	
	<table id="tableFar" style="width: 1000px; display: none">
	<thead>
	<tr>
		<th style="width: 16%">Transit Name</th>
		<th style="width: 11%">Departure <button onclick="setFuncDep()">^</button></th>
		<th style="width: 9%">Travel Time</th>
		<th style="width: 10%">Arrival <button onclick="setFuncArr()">^</button></th>
		<th style="width: 6%">No. Stops</th>
		<th style="width: 10%">Origin <button onclick="setFuncOrg()">^</button></th>
		<th style="width: 5%">Stop 1</th>
		<th style="width: 5%">Stop 2</th>
		<th style="width: 12%">Destination <button onclick="setFuncDst()">^</button></th>
		<th style="width: 6%">No. Seats</th>
		<th style="width: 10%">Fare <button onclick="setFuncFar()">^</button></th>
		<th style="width: 6">Train No.</th>
	</tr>
	</thead>
	<tbody>
	
<% 	while (rsFar.next()) {
		int stopCount = 0;
		int numStops = rsFar.getInt("numberOfStops");
		float fareDis = rsFar.getFloat("fare");
		Time depTime = rsFar.getTime("departure");
		Time arrTime = rsFar.getTime("arrival");
		if (rsFar.getString("origin").equals(origin) && rsFar.getString("destination").equals(destination)){
			stopCount = numStops;
			fareDis = fareDis;
			depTime = depTime;
			arrTime = arrTime;
		}
		else if(rsFar.getString("origin").equals(origin) && rsFar.getString("stop_1").equals(destination)){
			stopCount = 0;
			fareDis = fareDis - 5*numStops;
			arrTime = new Time(depTime.getTime() + (1000 * 60 * 45));
		}
		else if(rsFar.getString("origin").equals(origin) && rsFar.getString("stop_2").equals(destination)){
			stopCount = 1;
			fareDis = 15;
			arrTime = new Time(depTime.getTime() + (1000 * 60 * 45 * 2));
		}
		else if(rsFar.getString("stop_1").equals(origin) && rsFar.getString("stop_2").equals(destination)){
			stopCount = 0;
			fareDis = 10;
			depTime = new Time(depTime.getTime() + (1000 * 60 * 45));
			arrTime = new Time(arrTime.getTime() - (1000 * 60 * 45));
		}
		else if(rsFar.getString("stop_1").equals(origin) && rsFar.getString("destination").equals(destination)){
			stopCount = numStops-1;
			fareDis = fareDis - 5;
			depTime = new Time(depTime.getTime() + (1000 * 60 * 45));
		}
		else if(rsFar.getString("stop_2").equals(origin) && rsFar.getString("destination").equals(destination)){
			stopCount = 0;
			fareDis = 10;
			depTime = new Time(depTime.getTime() + (1000 * 60 * 45 * 2));
		}
%>	
		<tr>
			<td style="width: 16%"><%= rsFar.getString("transitName") %></td>
			<td style="width: 11%"><%= depTime %></td>
			<td style="width: 9%"><%= (stopCount+1)*45 %></td>
			<td style="width: 10%"><%= arrTime %></td>
			<td style="width: 6%"><%= stopCount %></td>
			<td style="width: 10%"><%= rsFar.getString("origin") %></td>
			<td style="width: 5%"><%= rsFar.getString("stop_1") %></td>
			<td style="width: 5%"><%= rsFar.getString("stop_2") %></td>
			<td style="width: 12%"><%= rsFar.getString("destination") %></td>
			<td style="width: 6%"><%= rsFar.getString("availableSeats") %></td>
			<td style="width: 10%">$<%= fareDis %>0</td>
			<td style="width: 6%"><%= rsFar.getString("trainID") %></td>
		</tr>
<%
	}
%>	</tbody>
	</table>
	<form action = "makeReservation.jsp" method = "POST">
	<div id="inputField" style="display: none">	
		Transit Name:<input type="text" name="tname" id="tname" readonly><br>
		Train No.: <input type="text" name="tnum" id="tnum" readonly/><br/>
		Departure Time:<input type="text" name="departTime" id="departTime" readonly><br>
		Arrival Time:<input type="text" name="arriveTime" id="arriveTime" readonly><br>
		Fare:<input type="text" name="fare" id="fare" readonly><br>
   	<button type="submit" style="background-color: #0260FF; color: white">Reserve</button>
    </div>
    </form>
	<div id="keyTable" style="display: block">
	*Key: <table style="width: 130px; height: 65px">
		<thead>
			<tr>
				<th style="width: 70%; font-size: 10px">Station Name</th>
				<th style="width: 30%; font-size: 10px">ID</th>
			</tr>
		</thead>
		<tbody>
<%	
	Statement st1 = connection.createStatement();
	ResultSet rs2 = st1.executeQuery("select name, stationID from STATION order by stationID desc");
	while(rs2.next()){
%>			<tr>
				<td style="width: 70%; font-size: 10px"><%= rs2.getString("name") %></td>
				<td style="width: 30%; font-size: 10px"><%= rs2.getString("stationID") %></td>				
			</tr>

<%
	}
%>	</tbody>
	</table>
	</div>
	<script>
	function setFuncDep(){
		document.getElementById("tableDep").style.display="block";
		document.getElementById("tableStock").style.display="none";
		document.getElementById("tableArr").style.display="none";
		document.getElementById("tableOrg").style.display="none";
		document.getElementById("tableDst").style.display="none";
		document.getElementById("tableFar").style.display="none";
		document.getElementById("keyTable").style.display="block";
        document.getElementById("inputField").style.display="none";
	}
	function setFuncArr(){
		document.getElementById("tableArr").style.display="block";
		document.getElementById("tableStock").style.display="none";
		document.getElementById("tableDep").style.display="none";
		document.getElementById("tableOrg").style.display="none";
		document.getElementById("tableDst").style.display="none";
		document.getElementById("tableFar").style.display="none";
		document.getElementById("keyTable").style.display="block";
        document.getElementById("inputField").style.display="none";
	}
	function setFuncOrg(){
		document.getElementById("tableOrg").style.display="block";
		document.getElementById("tableStock").style.display="none";
		document.getElementById("tableDep").style.display="none";
		document.getElementById("tableArr").style.display="none";
		document.getElementById("tableDst").style.display="none";
		document.getElementById("tableFar").style.display="none";
		document.getElementById("keyTable").style.display="block";
        document.getElementById("inputField").style.display="none";
	}
	function setFuncDst(){
		document.getElementById("tableDst").style.display="block";
		document.getElementById("tableStock").style.display="none";
		document.getElementById("tableDep").style.display="none";
		document.getElementById("tableArr").style.display="none";
		document.getElementById("tableOrg").style.display="none";
		document.getElementById("tableFar").style.display="none";
		document.getElementById("keyTable").style.display="block";
        document.getElementById("inputField").style.display="none";
	}
	function setFuncFar(){
		document.getElementById("tableFar").style.display="block";
		document.getElementById("tableStock").style.display="none";
		document.getElementById("tableDep").style.display="none";
		document.getElementById("tableArr").style.display="none";
		document.getElementById("tableOrg").style.display="none";
		document.getElementById("tableDst").style.display="none";
        document.getElementById("keyTable").style.display="block";
        document.getElementById("inputField").style.display="none";

	}
	var table = document.getElementById("tableStock");
    for(var i = 1; i < table.rows.length; i++){
        table.rows[i].onclick = function(){
             //rIndex = this.rowIndex;
             document.getElementById("tname").value = this.cells[0].innerHTML;
             document.getElementById("departTime").value = this.cells[1].innerHTML;
             document.getElementById("arriveTime").value = this.cells[3].innerHTML;
             document.getElementById("fare").value = this.cells[10].innerHTML;
             document.getElementById("tnum").value = this.cells[11].innerHTML;
             document.getElementById("keyTable").style.display="none";
             document.getElementById("inputField").style.display="block";
        };
    }
    var table = document.getElementById("tableDep");
    for(var i = 1; i < table.rows.length; i++){
        table.rows[i].onclick = function(){
             //rIndex = this.rowIndex;
             document.getElementById("tname").value = this.cells[0].innerHTML;
             document.getElementById("departTime").value = this.cells[1].innerHTML;
             document.getElementById("arriveTime").value = this.cells[3].innerHTML;
             document.getElementById("fare").value = this.cells[10].innerHTML;
             document.getElementById("tnum").value = this.cells[11].innerHTML;
             document.getElementById("keyTable").style.display="none";
             document.getElementById("inputField").style.display="block";
        };
    }
    var table = document.getElementById("tableArr");
    for(var i = 1; i < table.rows.length; i++){
        table.rows[i].onclick = function(){
             //rIndex = this.rowIndex;
             document.getElementById("tname").value = this.cells[0].innerHTML;
             document.getElementById("departTime").value = this.cells[1].innerHTML;
             document.getElementById("arriveTime").value = this.cells[3].innerHTML;
             document.getElementById("fare").value = this.cells[10].innerHTML;
             document.getElementById("tnum").value = this.cells[11].innerHTML;
			 document.getElementById("keyTable").style.display="none";
             document.getElementById("inputField").style.display="block";
        };
    }
    var table = document.getElementById("tableOrg");
    for(var i = 1; i < table.rows.length; i++){
        table.rows[i].onclick = function(){
             //rIndex = this.rowIndex;
             document.getElementById("tname").value = this.cells[0].innerHTML;
             document.getElementById("departTime").value = this.cells[1].innerHTML;
             document.getElementById("arriveTime").value = this.cells[3].innerHTML;
             document.getElementById("fare").value = this.cells[10].innerHTML;
             document.getElementById("tnum").value = this.cells[11].innerHTML;
             document.getElementById("keyTable").style.display="none";
             document.getElementById("inputField").style.display="block";
        };
    }
    var table = document.getElementById("tableDst");
    for(var i = 1; i < table.rows.length; i++){
        table.rows[i].onclick = function(){
             //rIndex = this.rowIndex;
             document.getElementById("tname").value = this.cells[0].innerHTML;
             document.getElementById("departTime").value = this.cells[1].innerHTML;
             document.getElementById("arriveTime").value = this.cells[3].innerHTML;
             document.getElementById("fare").value = this.cells[10].innerHTML;
             document.getElementById("tnum").value = this.cells[11].innerHTML;
             document.getElementById("keyTable").style.display="none";
             document.getElementById("inputField").style.display="block";
        };
    }
    var table = document.getElementById("tableFar");
    for(var i = 1; i < table.rows.length; i++){
        table.rows[i].onclick = function(){
             //rIndex = this.rowIndex;
             document.getElementById("tname").value = this.cells[0].innerHTML;
             document.getElementById("departTime").value = this.cells[1].innerHTML;
             document.getElementById("arriveTime").value = this.cells[3].innerHTML;
             document.getElementById("fare").value = this.cells[10].innerHTML;
             document.getElementById("tnum").value = this.cells[11].innerHTML;
             document.getElementById("keyTable").style.display="none";
             document.getElementById("inputField").style.display="block";
        };
    }
	</script>
<%
} catch (Exception e) {
	e.printStackTrace();
}
%>