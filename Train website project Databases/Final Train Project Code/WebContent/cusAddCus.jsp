<%@ page import ="java.sql.*" %>
<%@ page import ="java.sql.Connection" %>
<%
	String userName =  request.getParameter("cusName");
	String Email = request.getParameter("cusEmail");
	String Password = request.getParameter("cusPassword");
	String firstName = request.getParameter("fName");
	String lastName = request.getParameter("lName");
	String Address = request.getParameter("cusAddress");
	String City = request.getParameter("cusCity");
	String Telephone = request.getParameter("cusTelephone");
	String State = request.getParameter("cusState");
	String Zip = request.getParameter("cusZip");
	
    Class.forName("com.mysql.jdbc.Driver");
    try {
    Connection con = DriverManager.getConnection("jdbc:mysql://group29.cdbekejbzng4.us-east-2.rds.amazonaws.com/TRAINS","Admin", "Password123");
    Statement st = con.createStatement();
    int update = st.executeUpdate("insert into CUSTOMER values ('"+ userName +"', '"+ Email +"', '"+ Password +"', '"+ firstName +"', '"+ lastName +"', '"+ Address +"', '"+ City +"', '"+ Telephone +"', '"+ State +"', '"+ Zip +"')");
    response.sendRedirect("manageCust.jsp");
    } catch (SQLException e) {
        e.printStackTrace();
        response.sendRedirect("cusError.jsp");
    }
%>