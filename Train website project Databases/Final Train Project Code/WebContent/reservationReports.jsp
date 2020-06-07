<%@ page import ="java.sql.*" %>
<%@ page import ="java.sql.Connection" %>
<%
%>
<!DOCTYPE HTML>
<html>
    <head>
    Please choose type of reservation report:
    </head>
    <br>
    <body>
        <button type = "button" id = "submitButton" onclick = "redirectToCusName()" style = "margin-top: 0px; margin-bottom: 0px; height: 60px; width: 150px; background-color: #0260FF; color: white">Customer Name</button><br>
        <button type = "button" id = "submitButton" onclick = "redirectToTransitLine()" style = "margin-top: 0px; margin-bottom: 0px; height: 60px; width: 150px; background-color: #0260FF; color: white">Transit Line</button><br>
       
    </body>
    <a href="landingpageAdmin.jsp">Back to Home Page</a>
    <script type="text/javascript">
        function redirectToCusName() {
            window.location="cusName.jsp";
        }
        function redirectToTransitLine() {
            window.location="tlr.jsp";
        }
    </script>
</html>
<%
%>