<%@ page import ="java.sql.*" %>
<%@ page import ="java.sql.Connection"%>
<%@ page import="java.util.*"%>
<%@ page import="java.time.LocalTime"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.time.ZoneId"%>
<%
	String resID = request.getParameter("rid");
	String cType = request.getParameter("cType");
    if (cType.equals("First Class")) cType = "FirstClass";
	String transitName = request.getParameter("tName");
	String date = request.getParameter("date");
	Class.forName("com.mysql.jdbc.Driver");
	
    ZoneId zone = ZoneId.of("America/New_York");
	
	LocalDate currentDay = LocalDate.now(zone);
	LocalDate resDay = LocalDate.parse(date);
	Boolean isBefore = currentDay.isBefore(resDay);
	Boolean isDay = currentDay.isEqual(resDay);
	
	LocalTime current = LocalTime.now(zone);
	LocalTime time = LocalTime.parse(request.getParameter("depTime"));
	LocalTime cutoff = time.minusHours(1);
	Boolean isOnTime = current.isBefore(cutoff);
    
	try {
    Connection con = DriverManager.getConnection("jdbc:mysql://group29.cdbekejbzng4.us-east-2.rds.amazonaws.com/TRAINS","Admin", "Password123");
    Statement st = con.createStatement();
    if ((isBefore == true)||(isDay == true && isOnTime == true)) {
    	int update = st.executeUpdate("delete from RESERVATION where reservationID="+ resID +"");
    	Statement st1 = con.createStatement();
    	int update1 = st1.executeUpdate("UPDATE TRAINSCHEDULE SET availableSeats = availableSeats + 1 WHERE transitName =  '"+ transitName +"' and departure LIKE'"+ date +"%'");
    	Statement st3 = con.createStatement();
    	int update3 = st3.executeUpdate("UPDATE TRAINSCHEDULE SET availableSeats_"+ cType +" = availableSeats_"+ cType +" + 1 WHERE transitName =  '"+ transitName +"' and departure LIKE'"+ date +"%'");
    	response.sendRedirect("manageRep.jsp");
    }
    else {
    	response.sendRedirect("resError.jsp");
    }
    } catch (SQLException e) {
        e.printStackTrace();
        response.sendRedirect("resError.jsp");
    }
%>