<%@ page import ="java.sql.*" %>
<%@ page import ="java.sql.Connection" %>
<%
	String ssn =  request.getParameter("ssn");
	String user = request.getParameter("UName");
	String userName = request.getParameter("userName");
	String Password = request.getParameter("password");
	String firstName = request.getParameter("fName");
	String lastName = request.getParameter("lName");
	
    Class.forName("com.mysql.jdbc.Driver");
    try {
    Connection con = DriverManager.getConnection("jdbc:mysql://group29.cdbekejbzng4.us-east-2.rds.amazonaws.com/TRAINS","Admin", "Password123");
    Statement st = con.createStatement();
    int update = st.executeUpdate("update EMPLOYEE set ssn = '"+ ssn +"', firstName = '"+ firstName +"', lastName = '"+ lastName +"', userName = '"+ userName +"', password = '"+ Password +"' where userName = '"+ user +"'");
    response.sendRedirect("manageEmp.jsp");
    } catch (SQLException e) {
        e.printStackTrace();
        response.sendRedirect("empError.jsp");
    }
%>