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
	ResultSet rs = st.executeQuery("select * from EMPLOYEE where firstName <> ''");
%>
	<a href="landingpageAdmin.jsp">Back to Home Page</a> <br> <br>
	
	<a href="manageEmp.jsp">View Employee Information</a> |
	<a href="empAdd.jsp">Add Information</a> |
	<a href="empDelete.jsp">Delete Information</a> <br> <br>
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
	<form action = "empUpdateEmp.jsp" method = "POST">
	<div id="inputField" style="display: none">
		SSN:<input type="text" name="ssn" id="ssn" maxlength="9" readonly><br>
		First Name:<input type="text" name="fName" id="fName"><br>
		Last Name:<input type="text" name="lName" id="lName" size=16><br>
		User Name:<input type="text" name="userName" id="userName" size=20><br>
		Password:<input type="text" name="password" id="password" size=16><br>
   	<button type="submit" style="background-color: #0260FF; color: white">Update this Employee</button>
    </div>
    <div id="updates" style="display: none">
    	<input type="text" name="UName" id="UName">
 	</div>   
    </form>
    Click on a row to edit:
	<table id="tableStock" style="width: 1000px; display: block">
	<thead>
	<tr>
		<th style="width: 12%">SSN</th>
		<th style="width: 11%">First Name</th>
		<th style="width: 6%">Last Name</th>
		<th style="width: 11%">User Name</th>
		<th style="width: 6%">Password</th>
	</tr>
	</thead>
	<tbody>
	
<% 	while (rs.next()) {
%>	
	<tr>
		<td style="width: 12%"><%= rs.getString(1) %></td>
		<td style="width: 11%"><%= rs.getString(2) %></td>
		<td style="width: 6%"><%= rs.getString(3) %></td>
		<td style="width: 11%"><%= rs.getString(4) %></td>
		<td style="width: 6%"><%= rs.getString(5) %></td>		
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
             document.getElementById("userName").value = this.cells[3].innerHTML;
             document.getElementById("UName").value = this.cells[3].innerHTML;
             document.getElementById("ssn").value = this.cells[0].innerHTML;
             document.getElementById("password").value = this.cells[4].innerHTML;
             document.getElementById("fName").value = this.cells[1].innerHTML;
             document.getElementById("lName").value = this.cells[2].innerHTML;
             document.getElementById("inputField").style.display="block";
        };
    }
    </script>
<%
} catch (Exception e) {
	e.printStackTrace();
}
%>