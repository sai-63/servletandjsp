import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.*;

public class Employee extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();
        String username = req.getParameter("username");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "sai2004");

            String query = "SELECT salary FROM employee WHERE name = ?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, username);

            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                out.println("Salary: " + rs.getObject(1));
            } else {
                out.println("Employee not found");
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace(out);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();
        String method = req.getParameter("_method");

        // Check _method parameter for PUT or DELETE
        if ("put".equalsIgnoreCase(method)) {
            doPut(req, res);
            return;
        } else if ("delete".equalsIgnoreCase(method)) {
            doDelete(req, res);
            return;
        }

        // Handle POST request (create operation)
        String username = req.getParameter("username");
        String salary = req.getParameter("salary");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "sai2004");

            // Check if the employee already exists
            String checkQuery = "SELECT * FROM employee WHERE name = ?";
            PreparedStatement checkPst = con.prepareStatement(checkQuery);
            checkPst.setString(1, username);
            ResultSet checkRs = checkPst.executeQuery();
            
            if (checkRs.next()) {
                out.println("Employee already exists");
            } else {
                // Insert new employee
                String insertQuery = "INSERT INTO employee (name,salary) VALUES (?,?)";
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
            e.printStackTrace(out);
        }
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();
        String username = req.getParameter("username");
        String salary = req.getParameter("salary");

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
            e.printStackTrace(out);
        }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();
        String username = req.getParameter("username");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "sai2004");

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
            e.printStackTrace(out);
        }
    }
}
