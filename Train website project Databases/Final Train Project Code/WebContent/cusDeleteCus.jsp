<%@ page import ="java.sql.*" %>
<%@ page import ="java.sql.Connection" %>
<%

	String User =  request.getParameter("cusName");
    Class.forName("com.mysql.jdbc.Driver");
    try {
    Connection con = DriverManager.getConnection("jdbc:mysql://group29.cdbekejbzng4.us-east-2.rds.amazonaws.com/TRAINS","Admin", "Password123");
    Statement st = con.createStatement();
    int update = st.executeUpdate("delete from CUSTOMER where userName = '"+ User +"'");
    response.sendRedirect("manageCust.jsp");
    } catch (SQLException e) {
        e.printStackTrace();
        response.sendRedirect("cusError.jsp");
    }
%>