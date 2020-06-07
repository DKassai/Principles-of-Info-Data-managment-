<!DOCTYPE html>
<html>
   <head>
   Select Specific Origin and Destination:
   </head>
   <body>
     <form action = "tsOriginDestFound.jsp" method = "POST">
		<label for = "origin">Choose origin station:</label>
		<select id = "origin" name = "origin">
			<option value = NULL></option>
			<option value = "gc4">Grand Central</option>
			<option value = "mp3">Metro Park</option>
			<option value = "nb2">New Brunswick</option>
			<option value = "ps1">Penn Station</option>
		</select>
	<br>
		<label for = "destination">Choose destination station:</label>
		<select id = "destination" name = "destination">
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