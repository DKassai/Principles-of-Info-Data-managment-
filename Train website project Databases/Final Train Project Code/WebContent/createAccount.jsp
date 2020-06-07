<!DOCTYPE html>
<html>
   <head>
      <title>Create Account Form</title>
   </head>
   <body>
     <form action="createAccountDetails.jsp" method="POST">
        Email: <input type="text" name="email" required placeholder="ex. 'johndoe@abcdef.com'" style="border: 1px solid black"/> <br/>
        Username: <input type="text" name="userName" required placeholder="ex. 'Realtrains1'" style="border: 1px solid black;  margin-left: 8px"/> <br/>
        Password: <input type="password" required name="password" style="border: 1px solid black; margin-left: 12px"/> <br/>
        First Name: <input type="text" required name="firstName" style="border: 1px solid black"/> <br/>
        Last Name: <input type="text" required name="lastName" style="border: 1px solid black;  margin-left: 4px"/> <br/>
        Telephone: <input type="text" required name="telephone" style="border: 1px solid black;  margin-left: 7px"/> <br/>
        Street Address: <input type="text" required name="address" style="border: 1px solid black"/> <br/>
        City: <input type="text" required name="city" style="border: 1px solid black;  margin-left: 6px"/> <br/>
        State: <input type="text" name="state" required placeholder="ex. 'NJ'" style="border: 1px solid black"/> <br/>
        Zipcode: <input type="text" required name="zipcode" style="border: 1px solid black"/> <br/>
       <input type="submit" value="Submit" style="background-color: blue; color: white; border: 1px solid black"/>
     </form>
   </body>
</html>