<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Salary</title>
</head>
<body>
<h2>Employee Salary Lookup</h2>
<%
    String username = request.getParameter("username");

    if (username != null && !username.trim().isEmpty()) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "sai2004");

            String selectQuery = "SELECT salary FROM employee WHERE name = ?";
            PreparedStatement pst = con.prepareStatement(selectQuery);
            pst.setString(1, username);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                String salary = rs.getString("salary");
                out.println("<p>Salary for " + username + " is: " + salary + "</p>");
            } else {
                out.println("<p>No employee found with the name " + username + "</p>");
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace(new PrintWriter(out));
        }
    } else {
        out.println("<p>Please provide a valid username as a request parameter.</p>");
    }
%>
</body>
</html>
