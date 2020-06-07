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
try{
	
	Statement st = connection.createStatement();
	ResultSet rs = st.executeQuery("SELECT userName, MAX(Total) as 'MaxTotal' FROM(SELECT userName, SUM(totalFare)  as 'Total' FROM TRAINS.RESERVATION GROUP BY userName) T GROUP BY userName ORDER BY MaxTotal DESC");
	rs.next();
%>
The best customer is: <%= rs.getString("userName")%> <br>
<a href="landingpageAdmin.jsp">Back to Home Page</a>
<% 
	} catch (Exception e) {
		e.printStackTrace();
	}
%>

