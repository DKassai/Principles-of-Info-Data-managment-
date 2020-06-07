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
	ResultSet rs = st.executeQuery("select * from TRAINSCHEDULE");
%>
	<a href="landingpageCustomerRep.jsp">Back to Home Page</a> <br> <br>
	
	<a href="manageTS.jsp">View Train Schedules</a> |
	<a href="tsAdd.jsp">Add Information</a> |
	<a href="tsUpdate.jsp">Edit Information</a> <br> <br>
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
	<form action = "tsDeleteSched.jsp" method = "POST">
	<div id="inputField" style="display: none">
		Transit Name:<input type="text" name="tName" id="tName"><br>
		Departure:<input type="text" name="departure" id="departure"><br>
   	<button type="submit" style="background-color: #0260FF; color: white">Delete this Schedule</button>
    </div>
    </form>
	<table id="tableStock" style="width: 1000px; display: block">
	<thead>
	<tr>
		<th style="width: 12%">Transit Name</th>
		<th style="width: 11%">Departure</th>
		<th style="width: 6%">Travel Time</th>
		<th style="width: 11%">Arrival</th>
		<th style="width: 6%">No. of Stops</th>
		<th style="width: 6%">Origin</th>
		<th style="width: 7%">Stop 1</th>
		<th style="width: 7%">Stop 2</th>
		<th style="width: 10%">Destination</th>
		<th style="width: 9%">Available Seats</th>
		<th style="width: 7%">Fare</th>
		<th style="width: 7%">Available Economy Seats</th>
		<th style="width: 7%">Available Business Seats</th>
		<th style="width: 7%">Available First Class Seats</th>
		<th style="width: 7%">Train ID</th>
	</tr>
	</thead>
	<tbody>
	
<% 	while (rs.next()) {
%>	
	<tr>
		<td style="width: 12%"><%= rs.getString(1) %></td>
		<td style="width: 11%"><%= rs.getDate(2) + " " + rs.getTime(2) %></td>
		<td style="width: 6%"><%= rs.getString(3) %></td>
		<td style="width: 11%"><%= rs.getDate(4) + " " + rs.getTime(4) %></td>
		<td style="width: 6%"><%= rs.getString(5) %></td>
		<td style="width: 6%"><%= rs.getString(6) %></td>
		<td style="width: 7%"><%= rs.getString(7) %></td>
		<td style="width: 7%"><%= rs.getString(8) %></td>
		<td style="width: 10%"><%= rs.getString(9) %></td>
		<td style="width: 9%"><%= rs.getString(10) %></td>
		<td style="width: 7%">$<%= rs.getString(11) %>.00</td>
		<td style="width: 7%"><%= rs.getString(12) %></td>
		<td style="width: 7%"><%= rs.getString(13) %></td>
		<td style="width: 7%"><%= rs.getString(14) %></td>
		<td style="width: 7%"><%= rs.getString(15) %></td>		
	</tr>
<%
	}
%>	</tbody>
	</table>
    <script>
    var table = document.getElementById("tableStock");
    for(var i = 1; i < table.rows.length; i++){
        table.rows[i].onclick = function(){
             document.getElementById("tName").value = this.cells[0].innerHTML;
             document.getElementById("departure").value = this.cells[1].innerHTML;
             document.getElementById("inputField").style.display="block";
        };
    }
    </script>
<%
} catch (Exception e) {
	e.printStackTrace();
}
%>