<%@ page import ="java.sql.*" %>
<%@ page import ="java.sql.Connection" %>
<%@ page import="java.util.*"%>
<%

Connection connection = null;
String user =  session.getAttribute("custUser").toString();
session.setAttribute("user", user);
String databaseName = "TRAINS";
String url = "jdbc:mysql://group29.cdbekejbzng4.us-east-2.rds.amazonaws.com:3306/" + databaseName;
String username = "Admin";
String password = "Password123";
Class.forName("com.mysql.jdbc.Driver");
connection = DriverManager.getConnection(url, username, password);

try {
	Statement st = connection.createStatement();
	ResultSet rs = st.executeQuery("select * from MESSAGES");
%>
	<a href="landingpage.jsp">Back to Home Page</a> <br> <br>
	<head>
	Questions & Answers:
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
	</head> <br> <br>
	Ask for Help:
	<form action = "helpSubmit.jsp" method = "POST">
		<input name="query" id="query" type="text" required placeholder="Start by asking your question here" style="width: 60%" maxlength=240>
		<input type="submit" value="Submit Question/Request" style="background-color: #0260FF; color: white"/>
	</form>
	Search Questions & Answers:
	<form action = "helpSearch.jsp" method = "POST">
		<input name="search" id="search" type="text" required placeholder="Search by keyword/phrase" style="width: 60%" maxlength=240>
		<input type="submit" value="Search" style="background-color: #0260FF; color: white"/>
	</form>
	<table id="tableStock" style="width: 1000px; display: block">
	<thead>
	<tr>
		<th style="width: 10%">Question ID</th>
		<th style="width: 10%">Customer User Name</th>
		<th style="width: 35%">Question</th>
		<th style="width: 10%">Employee User Name</th>
		<th style="width: 35%">Response</th>
	</tr>
	</thead>
	<tbody>
	
<% 	while (rs.next()) {
%>	
	<tr>
		<td style="width: 10%"><%= rs.getString("messagenum") %></td>
		<td style="width: 10%"><%= rs.getString("cusUserName") %></td>
		<td style="width: 35%"><%= rs.getString("request") %></td>
		<td style="width: 10%"><%= rs.getString("empUserName") %></td>
		<td style="width: 35%"><%= rs.getString("reply") %></td>
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