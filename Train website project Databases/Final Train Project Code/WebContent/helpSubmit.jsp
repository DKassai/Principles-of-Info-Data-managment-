<%@ page import ="java.sql.*" %>
<%@ page import ="java.sql.Connection" %>
<%

	String user =  session.getAttribute("user").toString();
	String search = request.getParameter("query");
    Class.forName("com.mysql.jdbc.Driver");
    try {
    Connection con = DriverManager.getConnection("jdbc:mysql://group29.cdbekejbzng4.us-east-2.rds.amazonaws.com/TRAINS","Admin", "Password123");
    Statement st = con.createStatement();
    int update = st.executeUpdate("insert into MESSAGES(request, cusUserName) values('"+ search +"', '"+ user +"')");
    response.sendRedirect("help.jsp");
    } catch (SQLException e) {
        e.printStackTrace();
        response.sendRedirect("helpError.jsp");
    }
%>