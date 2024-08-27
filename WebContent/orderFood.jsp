<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Food</title>
</head>
<body>
    <h1>Order Food</h1>
    <form action="OrderFoodServlet" method="post">
        <label for="foodItem">Select Food Item:</label>
        <select name="foodItem" id="foodItem">
            <option value="Pizza">Pizza</option>
            <option value="Burger">Burger</option>
            <option value="Pasta">Pasta</option>
            <option value="Salad">Salad</option>
        </select>
        <br><br>
        <label for="quantity">Quantity:</label>
        <input type="number" id="quantity" name="quantity" min="1" required>
        <br><br>
        <input type="submit" value="Order">
    </form>
</body>
</html>
