<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bookings</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            padding: 20px;
        }
        h2, h3 {
            color: #333;
            text-align: center;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        table th, table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        table th {
            background-color: #f2f2f2;
        }
        .btn {
            display: block;
            width: 200px;
            margin: 20px auto;
            text-align: center;
            padding: 10px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        .logout {
            position: absolute;
            top: 10px;
            right: 10px;
        }
    </style>
</head>
<body>
    <a href="logout.jsp" class="logout">Logout</a> <!-- Logout button -->
    <h2>Bookings</h2>
    <%
        // Retrieve the session, do not create a new one if it doesn't exist
        HttpSession session1 = request.getSession(false);
        
        // If session does not exist or username is not set, redirect to login page
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp");
        } else {
            // Retrieve the username from the session
            String username = (String) session.getAttribute("username");
    %>
    <h3>Welcome, <%= username %>!</h3>
    <% 
            // Database connection parameters
            String url = "jdbc:mysql://localhost:3306/hotel";
            String user = "root";
            String password = "123456";

            // SQL query to retrieve bookings
            String query = "SELECT id, room_type, check_in, check_out FROM bookings";

            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                // Establish the database connection
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(url, user, password);

                // Create statement
                stmt = conn.createStatement();

                // Execute the query
                rs = stmt.executeQuery(query);

    %>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Room Type</th>
                <th>Check In</th>
                <th>Check Out</th>
            </tr>
        </thead>
        <tbody>
            <% 
                // Process the result set
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String roomType = rs.getString("room_type");
                    Date checkIn = rs.getDate("check_in");
                    Date checkOut = rs.getDate("check_out");
            %>
            <tr>
                <td><%= id %></td>
                <td><%= roomType %></td>
                <td><%= checkIn %></td>
                <td><%= checkOut %></td>
            </tr>
            <%
                }
            } catch (Exception e) {
                out.println("<tr><td colspan='4'>Exception: " + e.getMessage() + "</td></tr>");
            } finally {
                // Close resources
                try { if (rs != null) rs.close(); } catch (SQLException e) { /* ignored */ }
                try { if (stmt != null) stmt.close(); } catch (SQLException e) { /* ignored */ }
                try { if (conn != null) conn.close(); } catch (SQLException e) { /* ignored */ }
            }
            // Close the table tag outside of Java code blocks
            %>
        </tbody>
    </table>
    <a href="booking.jsp" class="btn">Book Another Room</a>
    <% } %> <!-- End of else block for session check -->
</body>
</html>
