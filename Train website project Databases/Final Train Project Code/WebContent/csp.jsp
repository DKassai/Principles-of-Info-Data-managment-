<%@ page import ="java.sql.*" %>
<%@ page import ="java.sql.Connection" %>
<%@ page import="java.util.*"%>
<%

Connection connection = null;
String user =  session.getAttribute("empUser").toString();
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
	<a href="landingpageCustomerRep.jsp">Back to Home Page</a> <br> <br>
	<head>
	Questions & Answers:
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
		<th style="width: 10%">Question ID</th>
		<th style="width: 10%">Customer User Name</th>
		<th style="width: 35%">Question</th>
		<th style="width: 10%">Employee User Name</th>
		<th style="width: 35%">Response</th>
		<th style="display: none">Replied?</th>
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
		<td style="display: none"><%= rs.getBoolean("replied") %></td>
	</tr>
<%
	}
%>	</tbody>
	</table>
	<form action = "cspRespond.jsp" method = "POST">
	<div id="inputField" style="display: none">	
		Question ID:<input type="text" name="qid" id="qid" readonly><br>
		Customer User Name:<input type="text" name="cusUser" id="cusUser" readonly><br>
		Question:<input type="text" name="question" id="question" style="width: 60%" readonly><br>
		Employee User Name:<input type="text" name="empUser" id="empUser" value="<%=user%>" readonly><br>
		Response:<input type="text" name="response" id="response"><br>
   	<button type="submit" style="background-color: #0260FF; color: white">Respond</button>
    </div>
    </form>
    <script>
    var table = document.getElementById("tableStock");
    for(var i = 1; i < table.rows.length; i++){
        table.rows[i].onclick = function(){
             //rIndex = this.rowIndex;
             if(this.cells[5].innerHTML == 'true') {
            	 document.getElementById("inputField").style.display="none";
             } else {
             document.getElementById("qid").value = this.cells[0].innerHTML;
             document.getElementById("cusUser").value = this.cells[1].innerHTML;
             document.getElementById("question").value = this.cells[2].innerHTML;
             document.getElementById("inputField").style.display="block";
             }
        };
    }
    </script>
<%
} catch (Exception e) {
	e.printStackTrace();
}
%>