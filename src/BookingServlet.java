import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/booking")
public class BookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String username = (String) session.getAttribute("username");
        String roomType = request.getParameter("roomType");
        String checkIn = request.getParameter("checkIn");
        String checkOut = request.getParameter("checkOut");

        try (Connection con = DatabaseConnection.getConnection()) {
            String sql = "INSERT INTO bookings (username, room_type, check_in, check_out) VALUES (?, ?, ?, ?)";
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setString(1, username);
                ps.setString(2, roomType);
                ps.setString(3, checkIn);
                ps.setString(4, checkOut);
                ps.executeUpdate();

                response.sendRedirect("booking.jsp?message=Booking Successful");
            }
        } catch (SQLException e) {
            throw new ServletException("Database access error", e);
        } catch (Exception e) {
            throw new ServletException("An unexpected error occurred", e);
        }
    }
}
