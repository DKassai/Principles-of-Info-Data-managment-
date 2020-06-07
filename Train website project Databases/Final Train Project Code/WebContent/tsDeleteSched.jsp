<%@ page import ="java.sql.*" %>
<%@ page import ="java.sql.Connection" %>
<%

	String tname =  request.getParameter("tName");
	String date = request.getParameter("departure");
    Class.forName("com.mysql.jdbc.Driver");
    try {
    Connection con = DriverManager.getConnection("jdbc:mysql://group29.cdbekejbzng4.us-east-2.rds.amazonaws.com/TRAINS","Admin", "Password123");
    Statement st = con.createStatement();
    int update = st.executeUpdate("delete from TRAINSCHEDULE where transitName = '"+ tname +"' and departure = '"+ date +"'");
    response.sendRedirect("manageTS.jsp");
    } catch (SQLException e) {
        e.printStackTrace();
        response.sendRedirect("tsError.jsp");
    }
%>