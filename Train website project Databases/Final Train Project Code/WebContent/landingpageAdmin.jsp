<%@ page import ="java.sql.*" %>
<%@ page import ="java.sql.Connection" %>
<%
%>
<!DOCTYPE HTML>
<html>
    <head>
        Welcome Admin <%=session.getAttribute("name")%>!
    </head>
    <br>
    <body>
        <button type = "button" id = "submitButton" onclick = "redirectToManageEmp()" style = "margin-top: 0px; margin-bottom: 0px; height: 60px; width: 150px; background-color: #0260FF; color: white">Manage Employees</button><br>
        <button type = "button" id = "submitButton" onclick = "redirectToManageCus()" style = "margin-top: 0px; margin-bottom: 0px; height: 60px; width: 150px; background-color: #0260FF; color: white">Manage Customers</button><br>
        <button type = "button" id = "submitButton" onclick = "redirectToSales()" style = "margin-top: 0px; margin-bottom: 0px; height: 60px; width: 150px; background-color: #0260FF; color: white">Sales/Revenue Reports</button><br>
        <button type = "button" id = "submitButton" onclick = "redirectToReservationReports()" style = "margin-top: 0px; margin-bottom: 0px; height: 60px; width: 150px; background-color: #0260FF; color: white">Reservation Reports</button><br>
       	<button type = "button" id = "submitButton" onclick = "redirectToBestCustomer()" style = "margin-top: 0px; margin-bottom: 0px; height: 60px; width: 150px; background-color: #0260FF; color: white">Best Customer</button><br>
       	<button type = "button" id = "submitButton" onclick = "redirectToMostActive()" style = "margin-top: 0px; margin-bottom: 0px; height: 60px; width: 150px; background-color: #0260FF; color: white">Most Active Transit Lines</button><br>
       <!-- <button type = "button" id = "submitButton" onclick = "redirectToTLR()" style = "margin-top: 0px; margin-bottom: 0px; height: 60px; width: 150px; background-color: #0260FF; color: white">Transit Line Reports</button><br> --> 
    </body>
    <a href='logout.jsp'>Log out</a>
    <script type="text/javascript">
        function redirectToManageEmp() {
            window.location="manageEmp.jsp";
        }
        function redirectToManageCus() {
            window.location="manageCust.jsp";
        }
        function redirectToSales() {
            window.location="landingReportPage.jsp";
        }
        function redirectToReservationReports() {
            window.location="reservationReports.jsp";
        }
        function redirectToBestCustomer() {
            window.location="bestCustomer.jsp";
        }
        function redirectToMostActive() {
            window.location="mostActive.jsp";
        }
/*         function redirectToTLR() {
            window.location="tlr.jsp";
        } */
    </script>
</html>
<%
%>