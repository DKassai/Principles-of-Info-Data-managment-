<%@ page import ="java.sql.*" %>
<%@ page import ="java.sql.Connection" %>
<%
	Connection connection = null;
	String userid = request.getParameter("username");   
    String pwd = request.getParameter("password");
    String databaseName = "TRAINS";
	String url = "jdbc:mysql://group29.cdbekejbzng4.us-east-2.rds.amazonaws.com:3306/" +databaseName;
	String username = "Admin";
	String password = "Password123";
    Class.forName("com.mysql.jdbc.Driver");
	connection = DriverManager.getConnection(url, username, password);
	
	
    //Connection con = DriverManager.getConnection("jdbc:mysql://group29.cdbekejbzng4.us-east-2.rds.amazonaws.com:3306/TRAINS","Admin", "Password123");
    Statement st = connection.createStatement();
    Statement st2 = connection.createStatement();
    Statement st3 = connection.createStatement();
    ResultSet rs, rs2, rs3;
    String name;
    
    rs = st.executeQuery("select * from CUSTOMER where userName='" + userid + "' and password='" + pwd + "'");
    rs2 = st2.executeQuery("select * from EMPLOYEE where userName='" + userid + "' and password='" + pwd + "' and admin=0");
    rs3 = st3.executeQuery("select * from EMPLOYEE where userName='" + userid + "' and password='" + pwd + "' and admin=1");
    if (rs.next()) {
    	name = rs.getString(4);
        session.setAttribute("name", name); // the username will be stored in the session
        session.setAttribute("user", userid); // the username will be stored in the session
        out.println("welcome " + name);
        out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("landingpage.jsp");
    } else if (rs2.next()) {
    	name = rs2.getString(2);
        session.setAttribute("name", name); // the username will be stored in the session
        session.setAttribute("user", userid); // the username will be stored in the session
        out.println("welcome Employee " + name);
        out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("landingpageCustomerRep.jsp");
    } else if (rs3.next()) {
    	name = rs3.getString(2);
        session.setAttribute("name", name); // the username will be stored in the session
        session.setAttribute("user", userid); // the username will be stored in the session
        out.println("welcome Admin " + name);
        out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("landingpageAdmin.jsp");
    } else {
        out.println("Invalid password <a href='login.jsp'>try again</a>");
    }
%>