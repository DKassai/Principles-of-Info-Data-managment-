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
	String one= null;
	String two= null;
	String three= null;
	String four= null;
	String five= null;
	int counter=1;
	
	Statement st = connection.createStatement();
	ResultSet rs = st.executeQuery("SELECT transitName, count FROM (SELECT transitName, count(reservationID) AS count FROM RESERVATION GROUP BY transitName)T  GROUP by transitName ORDER by count desc, transitName asc");
	while(rs.next()){
		if(counter==1){
			one=rs.getString("transitName");
		}else if (counter==2){
			two=rs.getString("transitName");
		}else if (counter==3){
			three=rs.getString("transitName");
		}else if (counter==4){
			four=rs.getString("transitName");
		}else if(counter==5){
			five=rs.getString("transitName");
		}
		counter++;
	}
	if (one == null) one = "N/A";
	if (two == null) two = "N/A";
	if (three == null) three = "N/A";
	if (four == null) four = "N/A";
	if (five == null) five = "N/A";
%>
The first most active transit line is: <%= one%> <br>
The second most active transit line is: <%= two%> <br>
The third most active transit line is: <%= three%> <br>
The fourth most active transit line is: <%= four%> <br>
The fifth most active transit line is: <%= five%> <br>

<br>

<a href="landingpageAdmin.jsp">Back to Home Page</a>
<% 
	} catch (Exception e) {
		e.printStackTrace();
	}
%>

