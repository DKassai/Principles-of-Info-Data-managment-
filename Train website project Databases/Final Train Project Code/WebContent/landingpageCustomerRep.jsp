<%@ page import ="java.sql.*" %>
<%@ page import ="java.sql.Connection" %>
<%
String user = session.getAttribute("user").toString();
session.setAttribute("empUser", user);
%>
<!DOCTYPE HTML>
<html>
    <head>
        Welcome Customer Rep <%=session.getAttribute("name")%>!
    </head>
    <br>
    <body>
        <button type = "button" id = "submitButton" onclick = "redirectToManageRep()" style = "margin-top: 0px; margin-bottom: 0px; height: 60px; width: 150px; background-color: #0260FF; color: white">Manage Reservations</button><br>
        <button type = "button" id = "submitButton" onclick = "redirectToManageTS()" style = "margin-top: 0px; margin-bottom: 0px; height: 60px; width: 150px; background-color: #0260FF; color: white">Manage Train Schedules</button><br>
        <button type = "button" id = "submitButton" onclick = "redirectToCSP()" style = "margin-top: 0px; margin-bottom: 0px; height: 60px; width: 150px; background-color: #0260FF; color: white">Customer Service Portal</button><br>
        <button type = "button" id = "submitButton" onclick = "redirectToEmployees()" style = "margin-top: 0px; margin-bottom: 0px; height: 60px; width: 150px; background-color: #0260FF; color: white">View Employees</button><br>
    </body>
    <a href='logout.jsp'>Log out</a>
    <script type="text/javascript">
        function redirectToManageRep() {
            window.location="manageRep.jsp";
        }
        function redirectToManageTS() {
            window.location="manageTS.jsp";
        }
        function redirectToCSP() {
            window.location="csp.jsp";
        }
        function redirectToEmployees() {
            window.location="employees.jsp";
        }
    </script>
</html>
</DOCTYPE>
<%
%>