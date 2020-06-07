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
	<a href="tsDelete.jsp">Delete Information</a> <br> <br>
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
	<form action = "tsUpdateSched.jsp" method = "POST">
	<div id="inputField" style="display: none">
		Transit Name:<input type="text" name="tname" id="tname"><br>
		Departure:<input type="text" name="dep" id="dep"><br>
		Travel Time:<input type="text" name="tTime" id="tTime" size=6><br>
		Arrival:<input type="text" name="arr" id="arr"><br>
		No. of Stops:<input type="text" name="stops" id="stops" size=6><br>
		Origin:<input type="text" name="origin" id="origin" size=6><br>
		Stop 1:<input type="text" name="stop1" id="stop1" size=6><br>
		Stop 2:<input type="text" name="stop2" id="stop2" size=6><br>
		Destination:<input type="text" name="dest" id="dest" size=6><br>
		Available Seats:<input type="text" name="seats" id="seats" size=6><br>
		Fare:<input type="text" name="fare" id="fare" size=6><br>
		Available Economy Seats:<input type="text" name="econ" id="econ" size=5><br>
		Available Business Seats:<input type="text" name="bus" id="bus" size=5><br>
		Available First Class Seats:<input type="text" name="fc" id="fc" size=5><br>
		Train ID:<input type="text" name="tid" id="tid" size=6 maxlength="4"><br>
   	<button type="submit" style="background-color: #0260FF; color: white">Update this Schedule</button>
    </div>
    <div id="updates" style="display: none">
    	<input type="text" name="tName" id="tName">
    	<input type="text" name="departure" id="departure">
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
             //rIndex = this.rowIndex;
             document.getElementById("tname").value = this.cells[0].innerHTML;
             document.getElementById("tName").value = this.cells[0].innerHTML;
             document.getElementById("departure").value = this.cells[1].innerHTML;
             document.getElementById("dep").value = this.cells[1].innerHTML;
             document.getElementById("tTime").value = this.cells[2].innerHTML;
             document.getElementById("arr").value = this.cells[3].innerHTML;
             document.getElementById("stops").value = this.cells[4].innerHTML;
             document.getElementById("origin").value = this.cells[5].innerHTML;
             document.getElementById("stop1").value = this.cells[6].innerHTML;
             document.getElementById("stop2").value = this.cells[7].innerHTML;
             document.getElementById("dest").value = this.cells[8].innerHTML;
             document.getElementById("seats").value = this.cells[9].innerHTML;
             document.getElementById("fare").value = this.cells[10].innerHTML;
             document.getElementById("econ").value = this.cells[11].innerHTML;
             document.getElementById("bus").value = this.cells[12].innerHTML;
             document.getElementById("fc").value = this.cells[13].innerHTML;
             document.getElementById("tid").value = this.cells[14].innerHTML;
             document.getElementById("inputField").style.display="block";
        };
    }
    </script>
<%
} catch (Exception e) {
	e.printStackTrace();
}
%>