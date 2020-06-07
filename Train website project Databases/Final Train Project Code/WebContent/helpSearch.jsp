<%@ page import ="java.sql.*" %>
<%@ page import ="java.sql.Connection" %>
<%

	String search = request.getParameter("search");
	System.out.println(search);
    Class.forName("com.mysql.jdbc.Driver");
    try {
    Connection con = DriverManager.getConnection("jdbc:mysql://group29.cdbekejbzng4.us-east-2.rds.amazonaws.com/TRAINS","Admin", "Password123");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from MESSAGES where request LIKE '"+ search +"%' or request LIKE '%"+ search +"%' or request LIKE '%"+ search +"' or reply LIKE '"+ search +"%' or reply LIKE '%"+ search +"%' or reply LIKE '%"+ search +"'");
%>
	<head>
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
	<a href="landingpage.jsp">Back to Home Page</a> |
    <a href="help.jsp">Back to Help Page</a> <br> <br>
    Results:
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
    } catch (SQLException e) {
        e.printStackTrace();
        response.sendRedirect("help.jsp");
    }
%>