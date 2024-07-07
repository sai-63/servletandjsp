<%@ page import="java.sql.*" %>
<%
    String username = request.getParameter("username");
    String salary = request.getParameter("salary");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "sai2004");

        String updateQuery = "UPDATE employee SET salary = ? WHERE name = ?";
        PreparedStatement pst = con.prepareStatement(updateQuery);
        pst.setString(1, salary);
        pst.setString(2, username);

        int rows = pst.executeUpdate();
        if (rows > 0) {
            out.println("Employee updated successfully");
        } else {
            out.println("Error updating employee or employee does not exist");
        }
        con.close();
    } catch (Exception e) {
        e.printStackTrace(new java.io.PrintWriter(out));
    }
%>
