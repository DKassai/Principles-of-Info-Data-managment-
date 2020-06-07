<!DOCTYPE html>
<html>
   <head>
      <title>Login Form</title>
   </head>
   Welcome to Group29 Travels
   <body>
     <form action="displayLoginDetails.jsp" method="POST" style="margin-left: 24px">
       Username: <input type="text" name="username" style="border: 1px solid black"/> <br/>
       Password:<input type="password" name="password" style="border: 1px solid black; margin-left: 9px" /> <br/>
       <input type="submit" value="Submit" style="background-color: blue; color: white; border: 1px solid black"/>
     </form>
     <form action="createAccount.jsp" method="POST">
      Don't have an account? Create one!
		</br>
      <input type="submit" value="Create" style="background-color: blue; color: white; border: 1px solid black"/>
    </form>
   </body>
</html>