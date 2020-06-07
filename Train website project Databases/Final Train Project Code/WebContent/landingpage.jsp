<%@ page import ="java.sql.*" %>
<%@ page import ="java.sql.Connection" %>
<%
String user = session.getAttribute("user").toString();
session.setAttribute("custUser", user);
%>
<!DOCTYPE HTML>
<html>
    <head>
        Welcome to Group29 Travels, <%=session.getAttribute("name")%>!
    </head>
    <br>
    <body>
        <button type = "button" id = "submitButton" onclick = "redirectToSearch()" style = "margin-top: 0px; margin-bottom: 0px; height: 60px; width: 150px; background-color: #0260FF; color: white">Make a Reservation!</button><br>
        <button type = "button" id = "submitButton" onclick = "redirectToManage()" style = "margin-top: 0px; margin-bottom: 0px; height: 60px; width: 150px; background-color: #0260FF; color: white">Manage Reservations!</button><br>
        <button type = "button" id = "submitButton" onclick = "redirectToHelp()" style = "margin-top: 0px; margin-bottom: 0px; height: 60px; width: 150px; background-color: #0260FF; color: white">Get Help/FAQ!</button><br>
    </body>
    <a href='logout.jsp'>Log out</a>
    <script type="text/javascript">
        function redirectToSearch() {
            window.location="search.jsp";
        }
        function redirectToManage() {
            window.location="manage.jsp";
        }
        function redirectToHelp() {
            window.location="help.jsp";
        }
    </script>
</html>
</DOCTYPE>
<%
%>