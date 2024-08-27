import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/FoodMenuServlet")
public class FoodMenuServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<FoodItem> foodMenu = new ArrayList<>();
        // Add food items to the list (In a real application, retrieve this from a database)
        foodMenu.add(new FoodItem("Burger", "Delicious beef burger", 5.99));
        foodMenu.add(new FoodItem("Pizza", "Cheesy pepperoni pizza", 8.99));
        foodMenu.add(new FoodItem("Pasta", "Creamy Alfredo pasta", 7.99));

        request.setAttribute("foodMenu", foodMenu);
        request.getRequestDispatcher("foodMenu.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}

class FoodItem {
    private String name;
    private String description;
    private double price;

    public FoodItem(String name, String description, double price) {
        this.name = name;
        this.description = description;
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public double getPrice() {
        return price;
    }
}