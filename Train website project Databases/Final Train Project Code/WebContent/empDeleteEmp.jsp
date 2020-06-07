<%@ page import ="java.sql.*" %>
<%@ page import ="java.sql.Connection" %>
<%

	String User =  request.getParameter("userName");
    Class.forName("com.mysql.jdbc.Driver");
    try {
    Connection con = DriverManager.getConnection("jdbc:mysql://group29.cdbekejbzng4.us-east-2.rds.amazonaws.com/TRAINS","Admin", "Password123");
    Statement st = con.createStatement();
    int update = st.executeUpdate("delete from EMPLOYEE where userName = '"+ User +"'");
    response.sendRedirect("manageEmp.jsp");
    } catch (SQLException e) {
        e.printStackTrace();
        response.sendRedirect("empError.jsp");
    }
%>