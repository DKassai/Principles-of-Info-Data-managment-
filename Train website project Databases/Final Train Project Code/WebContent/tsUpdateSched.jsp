<%@ page import ="java.sql.*" %>
<%@ page import ="java.sql.Connection" %>
<%
	String tname =  request.getParameter("tname");
	String tName =  request.getParameter("tName");
	String dep = request.getParameter("dep");
	String departure =  request.getParameter("departure");
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
    int update = st.executeUpdate("update TRAINSCHEDULE set transitName = '"+ tname +"', departure = '"+ dep +"', travelTime = '"+ ttime +"', arrival = '"+ arr +"', numberOfStops = '"+ stops +"', origin = '"+ origin +"', stop_1 = '"+ st1 +"', stop_2 = '"+ st2 +"', destination = '"+ dest +"', availableSeats = '"+ seats +"', fare = '"+ fare +"', availableSeats_Economy = '"+ econ +"', availableSeats_Business = '"+ bus +"', availableSeats_FirstClass = '"+ fc +"', trainID = '"+ tid +"' where transitName = '"+ tName +"' and departure = '"+ departure +"'");
    response.sendRedirect("manageTS.jsp");
    } catch (SQLException e) {
        e.printStackTrace();
        response.sendRedirect("tsError.jsp");
    }
%>