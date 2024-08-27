<%@ page import="javax.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html>
<head>
    <title>Book a Room</title>
</head>
<body>
    <h2>Book a Room</h2>
    <%
        HttpSession session1 = request.getSession(false);

        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp");
        } else {
            String username = (String) session.getAttribute("username");
    %>

    <!-- Display a welcome message with the username -->
    <h3>Welcome, <%= username %>!</h3>

    <!-- Form to book a room -->
    <form action="booking" method="post">
        Room Type: <input type="text" name="roomType" required><br>
        Check-In Date: <input type="date" name="checkIn" required><br>
        Check-Out Date: <input type="date" name="checkOut" required><br>
        <input type="submit" value="Book">
    </form>

    <!-- Link to view booking details -->
    <a href="bookings.jsp">View Booking Details</a>

    <!-- Display a message if available in the request -->
    <%
        String message = request.getParameter("message");
        if (message != null) {
            out.println("<p>" + message + "</p>");
        }
    %>

    <% } %> <!-- End of else block -->
</body>
</html>
