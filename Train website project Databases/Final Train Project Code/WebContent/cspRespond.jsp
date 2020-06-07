<%@ page import ="java.sql.*" %>
<%@ page import ="java.sql.Connection" %>
<%

	String user =  request.getParameter("empUser");
	String reply = request.getParameter("response");
	String qid = request.getParameter("qid");
    Class.forName("com.mysql.jdbc.Driver");
    try {
    Connection con = DriverManager.getConnection("jdbc:mysql://group29.cdbekejbzng4.us-east-2.rds.amazonaws.com/TRAINS","Admin", "Password123");
    Statement st = con.createStatement();
    int update = st.executeUpdate("update MESSAGES set reply = '"+ reply +"', empUserName = '"+ user +"', replied = 1 where messagenum = "+ qid +"");
    response.sendRedirect("csp.jsp");
    } catch (SQLException e) {
        e.printStackTrace();
        response.sendRedirect("cspError.jsp");
    }
%>