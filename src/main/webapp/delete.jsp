<%@ page import="java.sql.*" %>
<%
    String username = request.getParameter("username");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdb", "root", "root");

        String deleteQuery = "DELETE FROM employee WHERE name = ?";
        PreparedStatement pst = con.prepareStatement(deleteQuery);
        pst.setString(1, username);

        int rows = pst.executeUpdate();
        if (rows > 0) {
            out.println("Employee deleted successfully");
        } else {
            out.println("Error deleting employee or employee does not exist");
        }
        con.close();
    } catch (Exception e) {
        e.printStackTrace(new java.io.PrintWriter(out));
    }
%>

