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
    <form action="tlrDisplay.jsp" method="post">
    	<label for = "text"> Choose Transit Name:</label>
		<input name = "transitName" id="transitName" type="text" required placeholder= "ex: 'Highway to Hell 2'" size=30 maxlength="30"> <br>
		<label for = "text"> Choose Train ID:</label>
		<input name = "trainNumber" id="trainNumber" type="text" required placeholder= "ex: '1001'" size=8 maxlength="4"> <br>
		<input type="submit" value="Submit" style="background-color: blue; color: white; border: 1px solid black"/>
	</form>
    </body>
</html>
<% 
} catch (Exception e) {
	e.printStackTrace();
}
%>