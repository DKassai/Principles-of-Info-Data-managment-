<%@ page import ="java.sql.*" %>
<%@ page import ="java.sql.Connection" %>
<%
String user = session.getAttribute("custUser").toString();
Connection con = null;
String databaseName = "TRAINS";
String url = "jdbc:mysql://group29.cdbekejbzng4.us-east-2.rds.amazonaws.com:3306/" + databaseName;
String username = "Admin";
String password = "Password123";
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection(url, username, password);

try {
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from RESERVATION where userName = '"+ user +"'");
%>	
	<a href="landingpage.jsp">Back to Home Page</a> <br><br>
	
	<head>
	Your Reservations: <br>
	Note: To cancel a reservation, please click on the row corresponding to that reservation and proceed. You may cancel a reservation up to 1 hour before the scheduled departure time.
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
		<th style="width: 12%">Reservation ID</th>
		<th style="width: 11%">Date</th>
		<th style="width: 8%">Total Fare</th>
		<th style="width: 8%">Username</th>
		<th style="width: 6%">Departure Time</th>
		<th style="width: 6%">Arrival Time</th>
		<th style="width: 6%">Origin</th>
		<th style="width: 8%">Destination</th>
		<th style="width: 17%">Passenger Name</th>
		<th style="width: 9%">Transit Line</th>
		<th style="width: 7%">Class Type</th>
		<th style="width: 11%">Date Made</th>
		<th style="width: 7%">Train No.</th>
		<th style="width: 7%">Seat No.</th>
	</tr>
	</thead>
	<tbody>
	
<% 	while (rs.next()) {
%>	
	<tr>
		<td style="width: 12%"><%= rs.getString(1) %></td>
		<td style="width: 11%"><%= rs.getString(2) %></td>
		<td style="width: 8%">$<%= rs.getString(3) %>.00</td>
		<td style="width: 8%"><%= rs.getString(4) %></td>
		<td style="width: 6%"><%= rs.getTime(5) %></td>
		<td style="width: 6%"><%= rs.getString(6) %></td>
		<td style="width: 6%"><%= rs.getString(7) %></td>
		<td style="width: 8%"><%= rs.getString(8) %></td>
		<td style="width: 17%"><%= rs.getString(9) + " " + rs.getString(10) %></td>
		<td style="width: 9%"><%= rs.getString(11) %></td>
		<td style="width: 7%"><%= rs.getString(12) %></td>
		<td style="width: 11%"><%= rs.getString(13) %></td>
		<td style="width: 7%"><%= rs.getString(14) %></td>
		<td style="width: 7%"><%= rs.getString(15) %></td>
	</tr>
<%
}
%>	
	</tbody>
	</table>
	<form action = "deleteReservation.jsp" method = "POST">
	<div id="inputField" style="display: none">	
		Reservation ID:<input type="text" name="rid" id="rid" readonly><br>
		Name:<input type="text" name="name" id="name" readonly><br>
   	<button type="submit" style="background-color: #0260FF; color: white">Cancel this Reservation</button>
    </div>
    <div id="updates" style="display: none">
    	<input type="text" name="cType" id="cType">
    	<input type="text" name="tName" id="tName">
    	<input type="text" name="date" id="date">
    	<input type="text" name="depTime" id="depTime">
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
	Statement st1 = con.createStatement();
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
	var table = document.getElementById("tableStock");
    for(var i = 1; i < table.rows.length; i++){
        table.rows[i].onclick = function(){
             //rIndex = this.rowIndex;
             document.getElementById("rid").value = this.cells[0].innerHTML;
             document.getElementById("name").value = this.cells[8].innerHTML;
             document.getElementById("cType").value = this.cells[10].innerHTML;
             document.getElementById("tName").value = this.cells[9].innerHTML;
             document.getElementById("date").value = this.cells[1].innerHTML;
             document.getElementById("depTime").value = this.cells[4].innerHTML;
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