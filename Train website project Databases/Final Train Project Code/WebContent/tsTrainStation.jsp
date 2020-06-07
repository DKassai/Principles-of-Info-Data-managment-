<!DOCTYPE HTML>
<html>
	<head>
	Select Specific Train Station:
   </head>
   <body>
     <form action = "tsTrainStationFound.jsp" method = "POST">
		<label for = "station">Choose station:</label>
		<select id = "station" name = "station">
			<option value = NULL></option>
			<option value = "gc4">Grand Central</option>
			<option value = "mp3">Metro Park</option>
			<option value = "nb2">New Brunswick</option>
			<option value = "ps1">Penn Station</option>
		</select>
	<br>
	<input type="submit" value="Submit" style="background-color: blue; color: white; border: 1px solid black"/>
	</form>
  </body>
</html>