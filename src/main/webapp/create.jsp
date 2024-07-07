<%@ page import="java.sql.*" %>
<%
    String username = request.getParameter("username");
    String salary = request.getParameter("salary");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "sai2004");

        String checkQuery = "SELECT * FROM employee WHERE name = ?";
        PreparedStatement checkPst = con.prepareStatement(checkQuery);
        checkPst.setString(1, username);
        ResultSet checkRs = checkPst.executeQuery();

        if (checkRs.next()) {
            out.println("Employee already exists");
        } else {
            String insertQuery = "INSERT INTO employee (name, salary) VALUES (?, ?)";
            PreparedStatement pst = con.prepareStatement(insertQuery);
            pst.setString(1, username);
            pst.setString(2, salary);

            int rows = pst.executeUpdate();
            if (rows > 0) {
                out.println("Employee created successfully");
            } else {
                out.println("Error creating employee");
            }
        }
        con.close();
    } catch (Exception e) {
        e.printStackTrace(new java.io.PrintWriter(out));
    }
%>
