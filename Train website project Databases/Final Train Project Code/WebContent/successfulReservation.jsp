<!DOCTYPE html>
<html>
   <head>
      <title>Reservation Made</title>
   </head>
   <body>
   Your Reservation Was Created Successfully!
  <br> <br> Your reservation number is: <%=session.getAttribute("resNum")%> <br>
  Your seat number is: <%=session.getAttribute("seatNum")%> <br> <br>  
  Boarding begins 10 minutes before departure time. <br> <br>
  To view your reservation details, click <a href="manage.jsp">here</a>. <br> <br>
  <a href="landingpage.jsp">Back to Home Page</a>
 
   </body>
</html>