<%@ page import ="java.sql.*" %>
<%@ page import ="java.sql.Connection" %>
<%
    if ((session.getAttribute("user") == null)) {
%>
You are not logged in<br/>
<a href="login.jsp">Please Login</a>
<%} else {
%>
Welcome <%=session.getAttribute("name")%>!

<br>
<br>
<form action = "displayResults.jsp" method = "POST">
<label for = "origin">Choose an origin station:</label>
<select id = "origin" name = "origin">
	<option value = NULL></option>
	<option value = "gc4">Grand Central</option>
	<option value = "mp3">Metro Park</option>
	<option value = "nb2">New Brunswick</option>
	<option value = "ps1">Penn Station</option>
</select>

<br>

<label for = "destination">Choose a destination station:</label>
<select id = "destination" name = "destination">
	<option value = NULL></option>
	<option value = "gc4">Grand Central</option>
	<option value = "mp3">Metro Park</option>
	<option value = "nb2">New Brunswick</option>
	<option value = "ps1">Penn Station</option>
</select>
<br>

<label for = "date">Choose date of travel:</label>
<input name = "date" type="date" required placeholder= "YYYY-MM-DD" size=10 maxlength=10>

<br>
<input type="submit" value="Submit" style="background-color: blue; color: white; border: 1px solid black"/>
</form>
<!-- try {
    Connection con = DriverManager.getConnection("jdbc:mysql://group29.cdbekejbzng4.us-east-2.rds.amazonaws.com/TRAINS","Admin", "Password123");
    Statement st = con.createStatement();
    int update = st.executeUpdate("insert into CUSTOMER values('"+ userid +"', '"+ email +"', '"+ password +"', '"+ firstname +"', '"+ lastname +"', '"+ address +"', '"+ city +"', '"+ telephone +"', '"+ state +"', '"+ zip +"')");
    response.sendRedirect("createdAccountLogin.jsp");
    } catch (SQLException e) {
        e.printStackTrace();
        response.sendRedirect("createAccountError.jsp");
    } -->
<br>
<br>
<a href='logout.jsp'>Log out</a>
<%
    }
%>