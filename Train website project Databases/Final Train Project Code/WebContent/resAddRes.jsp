<%@ page import ="java.sql.*" %>
<%@ page import ="java.sql.Connection" %>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.time.LocalTime"%>
<%@ page import="java.time.ZoneId"%>
<%
	String rid =  request.getParameter("rid");
	String date = request.getParameter("date");
	String tFare = request.getParameter("fare");
    Float fare = Float.valueOf(tFare.substring(1));
	String user = request.getParameter("username");
	String depTime = request.getParameter("depTime");
	String arrTime = request.getParameter("arrTime");
	String origin = request.getParameter("origin");
	String dest = request.getParameter("dest");
	String fname = request.getParameter("fname");
	String lname = request.getParameter("lname");
	String tline = request.getParameter("tline");
	String ctype = request.getParameter("ctype");
    if (ctype.equals("First Class")) ctype = "FirstClass";
	String tnum = request.getParameter("tnum");
	String snum = request.getParameter("snum");
	String duration = request.getParameter("duration");
	String emp = request.getParameter("empusername");
    Class.forName("com.mysql.jdbc.Driver");
    
    ZoneId zone = ZoneId.of("America/New_York");
    
    LocalDate dmade = LocalDate.now(zone);
    LocalDate resDay = LocalDate.parse(date);
	Boolean isBefore = dmade.isBefore(resDay);
	Boolean isDay = dmade.isEqual(resDay);
	
	LocalTime current = LocalTime.now(zone);
	LocalTime time = LocalTime.parse(request.getParameter("depTime"));
	Boolean isOnTime = current.isBefore(time);
    
    try {
    	if ((isBefore == true)||(isDay == true && isOnTime == true)) {
	    	Connection con = DriverManager.getConnection("jdbc:mysql://group29.cdbekejbzng4.us-east-2.rds.amazonaws.com/TRAINS","Admin", "Password123");
		    Statement st = con.createStatement();
	    	int update = st.executeUpdate("insert into RESERVATION values ('"+ rid +"', '"+ date +"', '"+ fare +"', '"+ user +"', '"+ depTime +"', '"+ arrTime +"', '"+ origin +"', '"+ dest +"', '"+ fname +"', '"+ lname +"', '"+ tline +"', '"+ ctype +"', '"+ dmade +"', '"+ tnum +"', '"+ snum +"', '"+ duration +"', '"+ emp +"')");
	   
		    //subtract one seat available 
		 	Statement st1 = con.createStatement();
		    int update1 = st1.executeUpdate("UPDATE TRAINSCHEDULE SET availableSeats = availableSeats - 1 WHERE transitName =  '"+ tline +"' and departure LIKE'"+ date +"%'");
		   
		   //subtract one seat available from class type 
		    Statement st2 = con.createStatement();
		    int update2 = st2.executeUpdate("UPDATE TRAINSCHEDULE SET availableSeats_"+ ctype +"= availableSeats_"+ ctype +" - 1 WHERE transitName =  '"+ tline +"' and departure LIKE'"+ date +"%'");
		    
		    response.sendRedirect("manageRep.jsp");
	   	} else {
        	response.sendRedirect("resError.jsp");
    	}
    } catch (SQLException e) {
        e.printStackTrace();
        response.sendRedirect("resError.jsp");
    }
%>