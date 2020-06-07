<%@ page import ="java.sql.*" %>
<%@ page import ="java.sql.Connection" %>
<%@ page import ="java.util.HashSet" %>
<%@ page import ="java.util.List" %>
<%@ page import ="java.util.Set" %>
<%@ page import ="java.util.*" %>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.time.LocalTime"%>
<%@ page import="java.time.ZoneId"%>
<%
	String resNum = request.getParameter("rid");
	String fName = request.getParameter("fname");
    String lName = request.getParameter("lname");
    String date = request.getParameter("date");
    String tFare = request.getParameter("fare");
    Float fare = Float.valueOf(tFare.substring(1));
    String userName = request.getParameter("username");   
    String depTime = request.getParameter("depTime");
    String arrTime = request.getParameter("arrTime");
    String depStation = request.getParameter("origin");
    String arrStation = request.getParameter("dest");
    String transitName = request.getParameter("tline");
    String classType = request.getParameter("ctype");
    if (classType.equals("First Class")) classType = "FirstClass";
    String tnum = request.getParameter("tnum");
    String snum = request.getParameter("snum");
    String tname = request.getParameter("tName");
    String ctype = request.getParameter("cType");
    if (ctype.equals("First Class")) ctype = "FirstClass";
    String Date = request.getParameter("Date");
    String deptime = request.getParameter("deptime");
    
    ZoneId zone = ZoneId.of("America/New_York");

    LocalDate dmade = LocalDate.now(zone);    
	LocalDate resDay = LocalDate.parse(date);
	Boolean isBefore = dmade.isBefore(resDay);
	Boolean isDay = dmade.isEqual(resDay);
	
	LocalTime current = LocalTime.now(zone);
	LocalTime time = LocalTime.parse(request.getParameter("depTime"));
	Boolean isOnTime = current.isBefore(time);

    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://group29.cdbekejbzng4.us-east-2.rds.amazonaws.com/TRAINS","Admin", "Password123");

    try {
    	if ((isBefore == true)||(isDay == true && isOnTime == true)) {
    		Statement st = con.createStatement();
        	int update = st.executeUpdate("UPDATE TRAINSCHEDULE SET availableSeats = availableSeats + 1 WHERE transitName =  '"+ tname +"' and departure LIKE'"+ Date +"%'");
        	Statement st1 = con.createStatement();
        	int update1 = st1.executeUpdate("UPDATE TRAINSCHEDULE SET availableSeats_"+ ctype +"= availableSeats_"+ ctype +" + 1 WHERE transitName =  '"+ tname +"' and departure LIKE'"+ Date +"%'");
    		
        	Statement st2 = con.createStatement();
		    int update2 = st2.executeUpdate("UPDATE TRAINSCHEDULE SET availableSeats = availableSeats - 1 WHERE transitName =  '"+ transitName +"' and departure LIKE'"+ date +"%'");
		    Statement st3 = con.createStatement();
		    int update3 = st3.executeUpdate("UPDATE TRAINSCHEDULE SET availableSeats_"+ classType +"= availableSeats_"+ classType +" - 1 WHERE transitName =  '"+ transitName +"' and departure LIKE'"+ date +"%'");
		    
		  	
		    Statement st4 = con.createStatement();
		    int update4 = st4.executeUpdate("UPDATE RESERVATION SET reservationID = '"+ resNum +"', date = '"+ date +"', totalFare = '"+ fare +"', userName = '"+ userName +"', departureTime = '"+ depTime +"', arrivalTime = '"+ arrTime +"', depStation = '"+ depStation +"', arrStation = '"+ arrStation +"', firstName = '"+ fName +"', lastName = '"+ lName +"', transitName = '"+ transitName +"', classType = '"+ classType +"', dateMade = '"+ dmade +"', trainNumber = '"+ tnum +"', seatNumber = '"+ snum +"' where reservationID ='"+ resNum +"'");
		   
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