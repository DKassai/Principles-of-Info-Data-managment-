<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.Time"%>
<%

Connection connection = null;
String date = request.getParameter("date");
String databaseName = "TRAINS";
String url = "jdbc:mysql://group29.cdbekejbzng4.us-east-2.rds.amazonaws.com:3306/" + databaseName;
String username = "Admin";
String password = "Password123";
Class.forName("com.mysql.jdbc.Driver");
connection = DriverManager.getConnection(url, username, password);
try{
	
	Statement st = connection.createStatement();
	ResultSet rs = st.executeQuery("SELECT SUM(totalFare) FROM TRAINS.RESERVATION WHERE dateMade LIKE '"+ date +"%'");
	rs.next();
%>
<!DOCTYPE HTML>
<html>
    <body>
    Total sales for <%= date.substring(5) + "/" + date.substring(0,4) %> is: $<%= rs.getFloat(1)%>0 <br>
    <a href="landingpageAdmin.jsp">Back to Home Page</a>
    </body>
</html>
<% 

	} catch (Exception e) {
		e.printStackTrace();
	}
%>

