<%@ page import ="java.sql.*" %>
<%@ page import ="java.sql.Connection" %>
<%
%>
<!DOCTYPE HTML>
<html>
    <head>
    Please choose type of sales report:
    </head>
    <br>
    <body>
        <button type = "button" id = "submitButton" onclick = "redirectToSalesMonth()" style = "margin-top: 0px; margin-bottom: 0px; height: 60px; width: 150px; background-color: #0260FF; color: white">Sales Report for a Month</button><br>
        <button type = "button" id = "submitButton" onclick = "redirectToTrainInfo()" style = "margin-top: 0px; margin-bottom: 0px; height: 60px; width: 150px; background-color: #0260FF; color: white">Revenue Report Transit Line</button><br>
        <button type = "button" id = "submitButton" onclick = "redirectToCusInfo()" style = "margin-top: 0px; margin-bottom: 0px; height: 60px; width: 150px; background-color: #0260FF; color: white">Revenue Report Customer</button><br>
         <button type = "button" id = "submitButton" onclick = "redirectToDestination()" style = "margin-top: 0px; margin-bottom: 0px; height: 60px; width: 150px; background-color: #0260FF; color: white">Revenue Report Destination</button><br>
       
    </body>
    <a href="landingpageAdmin.jsp">Back to Home Page</a>
    <script type="text/javascript">
        function redirectToSalesMonth() {
            window.location="salesMonth.jsp";
        }
        function redirectToTrainInfo() {
            window.location="trainInfo.jsp";
        }
        function redirectToCusInfo() {
            window.location="cusInfo.jsp";
        }
        function redirectToDestination() {
            window.location="destinationCity.jsp";
        }
    </script>
</html>
</DOCTYPE>
<%
%>