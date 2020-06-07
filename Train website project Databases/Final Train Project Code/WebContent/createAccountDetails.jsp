<%@ page import ="java.sql.*" %>
<%@ page import ="java.sql.Connection" %>
<%

	String userid = request.getParameter("userName");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    String firstname = request.getParameter("firstName");
    String lastname = request.getParameter("lastName");   
    String address = request.getParameter("address");
    String city = request.getParameter("city");
    String telephone = request.getParameter("telephone");
    String state = request.getParameter("state");
    String zip = request.getParameter("zipcode");
    Class.forName("com.mysql.jdbc.Driver");
    try {
    Connection con = DriverManager.getConnection("jdbc:mysql://group29.cdbekejbzng4.us-east-2.rds.amazonaws.com/TRAINS","Admin", "Password123");
    Statement st = con.createStatement();
    int update = st.executeUpdate("insert into CUSTOMER values('"+ userid +"', '"+ email +"', '"+ password +"', '"+ firstname +"', '"+ lastname +"', '"+ address +"', '"+ city +"', '"+ telephone +"', '"+ state +"', '"+ zip +"')");
    response.sendRedirect("createdAccountLogin.jsp");
    } catch (SQLException e) {
        e.printStackTrace();
        response.sendRedirect("createAccountError.jsp");
    }
%>