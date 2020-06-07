<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.Time"%>
<%

Connection connection = null;
String databaseName = "TRAINS";
String url = "jdbc:mysql://group29.cdbekejbzng4.us-east-2.rds.amazonaws.com:3306/" + databaseName;
String username = "Admin";
String password = "Password123";
Class.forName("com.mysql.jdbc.Driver");
connection = DriverManager.getConnection(url, username, password);

try {
%>
<!DOCTYPE HTML>
<html>
  
    <body>
    <form action="cityDestination.jsp" method="post">
    	<label for = "destinationCity"> Choose Destination City:</label>
		<input name = "destinationCity" type="text" required placeholder= "ex: 'New Brunswick'" size=50 maxlength="50"> <br>
		<label for = "destinationState"> Choose Destination State:</label>
		<input name = "destinationState" type="text" required placeholder= "ex: 'New Jersey'" size=20 maxlength="20">
		<input type="submit" value="Submit" style="background-color: blue; color: white; border: 1px solid black"/>
	</form>
	<br>
	    <div id="keyTable" style="display: block">
	*Key: <table style="width: 240px; height: 65px; text-align: center">
		<thead>
			<tr>
				<th style="width: 35%; font-size: 10px">Station Name</th>
				<th style="width: 7%; font-size: 10px">ID</th>
				<th style="width: 30%; font-size: 10px">City</th>
				<th style="width: 28%; font-size: 10px">State</th>
			</tr>
		</thead>
		<tbody>
    <%	
    
	Statement st1 = connection.createStatement();
	ResultSet rs2 = st1.executeQuery("select name, stationID, locationOfStation, state from STATION order by stationID desc");
	while(rs2.next()){
%>			<tr>
				<td style="width: 35%; font-size: 10px"><%= rs2.getString("name") %></td>
				<td style="width: 7%; font-size: 10px"><%= rs2.getString("stationID") %></td>
				<td style="width: 30%; font-size: 10px"><%= rs2.getString("locationOfStation") %></td>
				<td style="width: 28%; font-size: 10px"><%= rs2.getString("state") %></td>				
			</tr>
<%
	}
%>	</tbody>
	</table>
    </div>
    </body>
  </html>

<% 
} catch (Exception e) {
	e.printStackTrace();
}
%>
