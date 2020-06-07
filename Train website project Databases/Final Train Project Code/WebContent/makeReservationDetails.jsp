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

	String fName = request.getParameter("fname");
    String lName = request.getParameter("lname");
    String date = request.getParameter("date");
    String tFare = request.getParameter("tfare");
    Float fare = Float.valueOf(tFare.substring(1));
    String userName = request.getParameter("username");   
    String depTime = request.getParameter("depTime");
    String arrTime = request.getParameter("arrTime");
    String depStation = request.getParameter("depStation");
    String arrStation = request.getParameter("arrStation");
    String transitName = request.getParameter("transitName");
    String classType = request.getParameter("ctype");
    String dur = request.getParameter("dur");
    Float dura = Float.valueOf(dur);
    int a = Math.round(dura);
    String tnum = request.getParameter("tnum");
    
    ZoneId zone = ZoneId.of("America/New_York");
   
    LocalDate dmade = LocalDate.now(zone);    
	LocalDate resDay = LocalDate.parse(date);
	LocalDate endDate = resDay.plusDays(a);
	Boolean isBefore = dmade.isBefore(resDay);
	Boolean isDay = dmade.isEqual(resDay);
	
	LocalTime current = LocalTime.now(zone);
	LocalTime time = LocalTime.parse(request.getParameter("depTime"));
	Boolean isOnTime = current.isBefore(time);

   //reservation ID number function 

    Class.forName("com.mysql.jdbc.Driver");
    try {
    	if ((isBefore == true)||(isDay == true && isOnTime == true)) {
		   	Random rand = new Random();
		   	int resNum = rand.nextInt(1100483646) + 1000000000;
		  	Set <Integer> set1 = new HashSet<Integer>();
		    Connection con = DriverManager.getConnection("jdbc:mysql://group29.cdbekejbzng4.us-east-2.rds.amazonaws.com/TRAINS","Admin", "Password123");
		    Statement st = con.createStatement();
		    ResultSet rs = st.executeQuery("SELECT reservationId FROM RESERVATION");
		    while(rs.next()){
		    		set1.add(Integer.valueOf(rs.getString(1)));
		    }
		    while(set1.contains(resNum)){
		    	resNum = rand.nextInt(1100483646) + 1000000000;
		    }
		
		    Statement st6 = con.createStatement();
		    ResultSet rs3 = st6.executeQuery("SELECT numberOfTrainCars from TRAIN where trainID in (SELECT trainID FROM TRAINSCHEDULE where transitName='"+ transitName +"' and departure LIKE '"+ date +"%')");
		    rs3.next();
		    int seat = rs3.getInt("numberOfTrainCars") * 10;
		    Random rand2 = new Random();
		   	int seatNum = rand2.nextInt(seat) + 1;
		  	Set <Integer> set2 = new HashSet<Integer>();
		    Statement st4 = con.createStatement();
		    ResultSet rs2 = st4.executeQuery("SELECT seatNumber FROM RESERVATION");
		    while(rs2.next()){
		    		set2.add(Integer.valueOf(rs2.getString(1)));
		    }
		    while(set2.contains(seatNum)){
		    	seatNum = rand.nextInt(seat) + 1;
		    }
		    
		   	session.setAttribute("resNum",resNum);
		   	session.setAttribute("seatNum",seatNum);
		    
		   //subtract one seat available 
		 	Statement st1 = con.createStatement();
		    int update1 = st1.executeUpdate("UPDATE TRAINSCHEDULE SET availableSeats = availableSeats - 1 WHERE transitName =  '"+ transitName +"' and departure LIKE'"+ date +"%'");
		   
		   //subtract one seat available from class type 
		    Statement st3 = con.createStatement();
		    int update3 = st3.executeUpdate("UPDATE TRAINSCHEDULE SET availableSeats_"+ classType +"= availableSeats_"+ classType +" - 1 WHERE transitName =  '"+ transitName +"' and departure LIKE'"+ date +"%'");
		    
		   // add information to reversationId table 
		  	Statement st2 = con.createStatement();
		    int update2 = st2.executeUpdate("INSERT INTO RESERVATION values ('"+ resNum +"', '"+ date +"', '"+ fare +"', '"+ userName +"', '"+ depTime +"', '"+ arrTime +"', '"+ depStation +"', '"+ arrStation +"', '"+ fName +"', '"+ lName +"', '"+ transitName +"', '"+ classType +"', '"+ dmade +"', '"+ tnum +"', '"+ seatNum +"', '"+ endDate +"', '')");
		   
		    response.sendRedirect("successfulReservation.jsp");
    	}
    	else {
        	response.sendRedirect("failureReservation.jsp");
    	}
    } catch (SQLException e) {
        e.printStackTrace();
        response.sendRedirect("failureReservation.jsp");
    } 
%>