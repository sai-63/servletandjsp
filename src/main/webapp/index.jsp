<!DOCTYPE html>
<html>
<head>
    <title>Employee Management</title>
</head>
<body>
<center>
    <h3>Employee Management Page</h3>
    <form name="create" method="post" action="create.jsp">
        <h4>Create Employee</h4>
        <table>
            <tr>
                <td>Username:</td>
                <td><input type="text" name="username"></td>
            </tr>
            <tr>
                <td>Salary:</td>
                <td><input type="text" name="salary"></td>
            </tr>
        </table>
        <input type="submit" value="Create">
    </form>
    <br/>
    <form name="read" method="get" action="read.jsp">
        <h4>Read Employee</h4>
        <table>
            <tr>
                <td>Username:</td>
                <td><input type="text" name="username"></td>
            </tr>
        </table>
        <input type="submit" value="Read">
    </form>
    <br/>
    <form name="update" method="post" action="update.jsp" onsubmit="return confirm('Are you sure you want to update?')">
        <h4>Update Employee</h4>
        <table>
            <tr>
                <td>Username:</td>
                <td><input type="text" name="username"></td>
            </tr>
            <tr>
                <td>Salary:</td>
                <td><input type="text" name="salary"></td>
            </tr>
        </table>
        <input type="submit" value="Update">
    </form>
    <br/>
    <form name="delete" method="post" action="delete.jsp" onsubmit="return confirm('Are you sure you want to delete?')">
        <h4>Delete Employee</h4>
        <table>
            <tr>
                <td>Username:</td>
                <td><input type="text" name="username"></td>
            </tr>
        </table>
        <input type="submit" value="Delete">
    </form>
</center>
</body>
</html>
