import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/OrderFoodServlet")
public class OrderFoodServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String foodItem = request.getParameter("foodItem");
        String quantityStr = request.getParameter("quantity");
        int quantity = Integer.parseInt(quantityStr);

        // Database connection parameters
        String jdbcURL = "jdbc:mysql://localhost:3306/hotel";
        String dbUser = "root";
        String dbPassword = "123456";

        // SQL query to insert order into the database
        String sql = "INSERT INTO FoodOrders (food_item, quantity) VALUES (?, ?)";

        try {
            // Establishing a database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            // Creating a PreparedStatement to execute the SQL query
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, foodItem);
            statement.setInt(2, quantity);

            // Executing the query
            int rowsInserted = statement.executeUpdate();

            // Preparing the response
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<html><body>");
            if (rowsInserted > 0) {
                out.println("<h1>Order Confirmation</h1>");
                out.println("<p>You ordered " + quantity + " " + foodItem + "(s).</p>");
            } else {
                out.println("<h1>Order Failed</h1>");
                out.println("<p>Sorry, there was an error processing your order. Please try again.</p>");
            }
            out.println("<a href='orderFood.jsp'>Order More Food</a>");
            out.println("</body></html>");

            // Closing the connection
            statement.close();
            connection.close();
        } catch (ClassNotFoundException e) {
            throw new ServletException("JDBC Driver not found.", e);
        } catch (SQLException e) {
            throw new ServletException("Database error.", e);
        }
    }
}
