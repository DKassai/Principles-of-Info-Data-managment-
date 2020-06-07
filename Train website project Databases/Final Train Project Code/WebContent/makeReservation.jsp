<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.util.*"%>
<%@ page import="java.math.*"%>
<%

Connection connection = null;
String userid = session.getAttribute("user").toString();
String depStation = session.getAttribute("departureStation").toString();
String arrStation = session.getAttribute("arrivalStation").toString();
String date = session.getAttribute("date").toString();
String transitName = request.getParameter("tname");
String tnum = request.getParameter("tnum");
String departAt = request.getParameter("departTime");
String arriveAt = request.getParameter("arriveTime");
String fare = request.getParameter("fare");
Float totFare = Float.parseFloat(fare.substring(1, 4));
String databaseName = "TRAINS";
String url = "jdbc:mysql://group29.cdbekejbzng4.us-east-2.rds.amazonaws.com:3306/" + databaseName;
String username = "Admin";
String password = "Password123";
Class.forName("com.mysql.jdbc.Driver");
connection = DriverManager.getConnection(url, username, password); 
%>

<!DOCTYPE html>
<html>
   <head>
      <title>Book Ticket</title>
      <script type="text/javascript">
      var gucci = "2.0";
	  var ticketType = document.getElementsByName("tickeType");
	  var classType = document.getElementsByName("classType");
	  var holder = "";
	  var ctype = "";
	
   			function oneWay(){
	   				holder = document.getElementsByName("tfare")[0].value;
	   				if (document.getElementsByName("tfare")[0].value == "$10.00") {
		   				document.getElementsByName("tfare")[0].value = (1.0*10.0);
		   			}
	   				else if (document.getElementsByName("tfare")[0].value == "$15.00") {
		   				document.getElementsByName("tfare")[0].value = (1.0*15.0);
		   			//alert(document.getElementById("tfare").value);
		   			//tickDiscount = (Float)2.0*totFare;
		   			}
	   				else if (document.getElementsByName("tfare")[0].value == "$20.00") {
		   				document.getElementsByName("tfare")[0].value = (1.0*20.0);
		   			}
	   			}
	   			//document.getElementById("tfare").value = (gucci*2);
   			function roundTrip(){
   					holder = document.getElementsByName("tfare")[0].value;
   					if (document.getElementsByName("tfare")[0].value == "$10.00") {
		   				document.getElementsByName("tfare")[0].value = (2.0*10.0);
		   			}
   					else if (document.getElementsByName("tfare")[0].value == "$15.00") {
		   				document.getElementsByName("tfare")[0].value = (2.0*15.0);
		   			//alert(document.getElementById("tfare").value);
		   			//tickDiscount = (Float)2.0*totFare;
		   			}
   					else if (document.getElementsByName("tfare")[0].value == "$20.00") {
		   				document.getElementsByName("tfare")[0].value = (2.0*20.0);
		   			}
	   			}
   			function economy(){
   				gucci = parseFloat(document.getElementsByName("tfare")[0].value);
  				gucci = (gucci*1.0);
  				document.getElementsByName("tfare")[0].value = gucci;
  				ctype = document.getElementsByName("classType")[0].value;
  				document.getElementsByName("ctype")[0].value = ctype;
	   			}
   			function business(){
   				gucci = parseFloat(document.getElementsByName("tfare")[0].value);
  				gucci = (gucci*2.0);
  				document.getElementsByName("tfare")[0].value = gucci;
  				ctype = document.getElementsByName("classType")[1].value;
  				document.getElementsByName("ctype")[0].value = ctype;
	   			}
   			function firstClass(){
   				gucci = parseFloat(document.getElementsByName("tfare")[0].value);
  				gucci = (gucci*3.0);
  				document.getElementsByName("tfare")[0].value = gucci;
  				ctype = document.getElementsByName("classType")[2].value;
  				document.getElementsByName("ctype")[0].value = ctype;
	   			}
   			function oneDay(){
  				document.getElementsByName("dur")[0].value = 0;
   			}
   			function weekly(){
   				gucci = parseFloat(document.getElementsByName("tfare")[0].value);
  				gucci = (gucci*7.0);
  				document.getElementsByName("tfare")[0].value = gucci;
  				document.getElementsByName("dur")[0].value = 7;
			}
   			function monthly(){
   				gucci = parseFloat(document.getElementsByName("tfare")[0].value);
				gucci = (gucci*30.0);
				document.getElementsByName("tfare")[0].value = gucci;
  				document.getElementsByName("dur")[0].value = 30;
   			}
   			function noDiscount(){
   				gucci = parseFloat(document.getElementsByName("tfare")[0].value);
				gucci = (gucci*1) + 3;
				document.getElementsByName("tfare")[0].value ="$" + gucci;
   			}
   			function csDiscount(){
   				gucci = parseFloat(document.getElementsByName("tfare")[0].value);
				gucci = (gucci*0.9) + 3;
				document.getElementsByName("tfare")[0].value ="$" + gucci;
   			}
   			function disableDiscount(){
   				gucci = parseFloat(document.getElementsByName("tfare")[0].value);
				gucci = (gucci*0.8) + 3;
				document.getElementsByName("tfare")[0].value ="$" + gucci;
   			}
   			
   			function refreshPage(){
   				var tickeType = document.getElementsByName("tickeType");
   			  	for(var i=0;i<tickeType.length;i++)
   			  	tickeType[i].checked = false;
   			 	var classType = document.getElementsByName("classType");
			  	for(var i=0;i<classType.length;i++)
			  		classType[i].checked = false;
			  	var tickDuration = document.getElementsByName("tickDuration");
   			  	for(var i=0;i<tickDuration.length;i++)
   			  		tickDuration[i].checked = false;
   			 	var groupDiscount = document.getElementsByName("groupDiscount");
			  	for(var i=0;i<groupDiscount.length;i++)
			  		groupDiscount[i].checked = false;
			  	document.getElementsByName("tfare")[0].value = holder;
			  	
   			}
   		</script>
   </head>
   <body>
     <div id="ticketSelect" style="display: block">
     Select Type of Ticket:
     <input id="oneWay" type="radio" name="tickeType" onclick="oneWay()">
     	<span>One Way</span>
     </input>
     <input id="roundTrip" type="radio" name="tickeType" onclick="roundTrip()">
     	<span>Round Trip</span>
     </input>
     </div>
     <br>
     <div id="classSelect" style="display: block">
     Select Class of Ticket:
     <input id="economy" type="radio" name="classType" value="Economy" onclick="economy()">
     	<span>Economy</span>
     </input>
     <input id="Business" type="radio" name="classType" value="Business" onclick="business()">
     	<span>Business</span>
     </input>
     <input id="firstClass" type="radio" name="classType" value="FirstClass" onclick="firstClass()">
     	<span>First Class</span>
     </input>
     </div>
     <br>
     <div id="ticketDuration" style="display: block">
     Select Duration of Ticket:
     <input id="oneDay" type="radio" name="tickDuration" onclick="oneDay()">
     	<span>One Day Only</span>
     </input>
     <input id="weekly" type="radio" name="tickDuration" onclick="weekly()">
     	<span>One Week Only</span>
     </input>
     <input id="monthly" type="radio" name="tickDuration" onclick="monthly()">
     	<span>One Month Only</span>
     </input>
     </div>
     <br>
     <div id="discountSelect" style="display: block">
     Select Applicable Discount:
     <input id="none" type="radio" name="groupDiscount" onclick="noDiscount()">
     	<span>None</span>
     </input>
     <input id="childSenior" type="radio" name="groupDiscount" onclick="csDiscount()">
     	<span>Child/Senior</span>
     </input>
     <input id="disabled" type="radio" name="groupDiscount" onclick="disableDiscount()">
     	<span>Disabled</span>
     </input>
     </div>
     
     <button type="button" onClick="refreshPage()">Reset Selections</button> 
     <input type="text" value="If you make an error, please click reset." style="width: 200px; font-size: 10px" readonly/>
     
     <br><br>
     
     <form action="makeReservationDetails.jsp" method="POST">
        <div style="display: block">
        First Name: <input type="text" name="fname" style="border: 1px solid black"/> <br/>
        Last Name: <input type="text" name="lname" style="border: 1px solid black"/> <br/>
        Date: <input type="text" name="date" value="<%=date%>" style="border: 1px solid black;  margin-left: 8px" readonly /> <br/>
       	Total Fare (Incl. $3.00 Booking Fee): <input type="text" name="tfare" value="<%=fare%>" style="border: 1px solid black; margin-left: 12px" readonly /> <br/>
        Username: <input type="text" name="username" value="<%=userid%>" style="border: 1px solid black" readonly /> <br/>
        Departure Time: <input type="text" name="depTime" value="<%=departAt%>" style="border: 1px solid black;  margin-left: 4px" readonly/> <br/>
        Arrival Time: <input type="text" name="arrTime" value="<%=arriveAt%>" style="border: 1px solid black;  margin-left: 7px" readonly/> <br/>
        Departure Station: <input type="text" name="depStation" value="<%=depStation%>" style="border: 1px solid black" readonly/> <br/>
        Arrival Station: <input type="text" name="arrStation" value="<%=arrStation%>" style="border: 1px solid black;  margin-left: 6px" readonly/> <br/>
        Transit Name: <input type="text" name="transitName" value="<%=transitName%>" style="border: 1px solid black;  margin-left: 6px" readonly/> <br/>
        Train No.: <input type="text" name="tnum" value="<%=tnum%>" style="border: 1px solid black;  margin-left: 6px" readonly/> <br/>
       	</div>
       	<div style="display: none">
       	Class Type: <input type="text" name="ctype" style="border: 1px solid black"/> <br/>
       	Duration: <input type="text" name="dur" style="border: 1px solid black"/> <br/>
       	</div>
       <input type="submit" value="Submit" style="background-color: blue; color: white; border: 1px solid black"/>
     </form>
   </body>
</html>