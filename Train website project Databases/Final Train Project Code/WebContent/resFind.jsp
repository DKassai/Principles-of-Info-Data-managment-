<!DOCTYPE html>
<html>
   <head>
   Enter Transit Line and Train No. to produce list of all customers who have seats reserved on those given values.
   </head>
   <body>
     <form action="resFound.jsp" method="POST" style="margin-left: 24px">
       Transit Line: <input type="text" name="tline" id="tline" style="border: 1px solid black"/> <br/>
       Train No.:<input type="text" name="tnum" id="tnum" style="border: 1px solid black; margin-left: 22px" size=5 maxlength="4" /> <br/>
       <input type="submit" value="Submit" style="background-color: blue; color: white; border: 1px solid black"/>
     </form>
   </body>
</html>