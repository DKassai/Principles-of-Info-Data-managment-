<!DOCTYPE HTML>
<html>
	<head>
	Find Train Schedules: <br>
	</head>
    <body>
        <button type = "button" id = "submitButton" onclick = "redirectToTSSOD()" style = "margin-top: 0px; margin-bottom: 0px; height: 60px; width: 150px; background-color: #0260FF; color: white">By Specific Origin and Destination</button><br>
        <button type = "button" id = "submitButton" onclick = "redirectToTStation()" style = "margin-top: 0px; margin-bottom: 0px; height: 60px; width: 150px; background-color: #0260FF; color: white">By Train Station</button><br>
    </body>
    <a href='landingpageCustomerRep.jsp'>Back to Home Page</a>
    <script type="text/javascript">
        function redirectToTSSOD() {
            window.location="tsOriginDest.jsp";
        }
        function redirectToTStation() {
            window.location="tsTrainStation.jsp";
        }
    </script>
</html>