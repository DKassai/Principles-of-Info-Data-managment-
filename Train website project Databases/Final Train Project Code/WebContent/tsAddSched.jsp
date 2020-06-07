<%@ page import ="java.sql.*" %>
<%@ page import ="java.sql.Connection" %>
<%
	String tname =  request.getParameter("tname");
	String dep = request.getParameter("dep");
	String ttime = request.getParameter("tTime");
	String arr = request.getParameter("arr");
	String stops = request.getParameter("stops");
	String origin = request.getParameter("origin");
	String st1 = request.getParameter("stop1");
	String st2 = request.getParameter("stop2");
	String dest = request.getParameter("dest");
	String seats = request.getParameter("seats");
	String tFare = request.getParameter("fare");
    Float fare = Float.valueOf(tFare.substring(1));
	String econ = request.getParameter("econ");
	String bus = request.getParameter("bus");
	String fc = request.getParameter("fc");
	String tid = request.getParameter("tid");
    Class.forName("com.mysql.jdbc.Driver");
    try {
    Connection con = DriverManager.getConnection("jdbc:mysql://group29.cdbekejbzng4.us-east-2.rds.amazonaws.com/TRAINS","Admin", "Password123");
    Statement st = con.createStatement();
    int update = st.executeUpdate("insert into TRAINSCHEDULE values ('"+ tname +"', '"+ dep +"', '"+ ttime +"', '"+ arr +"', '"+ stops +"', '"+ origin +"', '"+ st1 +"', '"+ st2 +"', '"+ dest +"', '"+ seats +"', '"+ fare +"', '"+ econ +"', '"+ bus +"', '"+ fc +"', '"+ tid +"')");
    response.sendRedirect("manageTS.jsp");
    } catch (SQLException e) {
        e.printStackTrace();
        response.sendRedirect("tsError.jsp");
    }
%>