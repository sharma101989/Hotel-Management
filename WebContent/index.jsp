<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hotel Management System</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('images/hotel-background.jpg'); /* Replace with your hotel background image path */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            color: #fff;
            text-align: center;
            padding: 50px;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* Full viewport height */
        }
        .container {
            background-color: rgba(0, 0, 0, 0.6); /* Semi-transparent background for readability */
            padding: 20px;
            border-radius: 10px;
            max-width: 400px; /* Adjust as needed */
            text-align: center;
        }
        h1 {
            font-size: 3em;
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); /* Text shadow for better readability */
        }
        .menu {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 20px;
        }
        .menu a {
            display: block;
            margin: 10px;
            padding: 10px 20px;
            background-color: #FFD700; /* Gold color for buttons */
            color: #000;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        }
        .menu a:hover {
            background-color: #FFC107; /* Slightly darker gold on hover */
        }
        .toggle-menu {
            position: absolute;
            top: 20px;
            right: 20px;
            cursor: pointer;
            color: #fff;
            font-size: 24px;
            z-index: 1000; /* Ensure it's above other content */
        }
        .menu-hidden {
            display: none; /* Hidden initially */
        }
        .menu-visible {
            display: flex; /* Shown when toggled */
        }
    </style>
    <script>
        function toggleMenu() {
            var menu = document.getElementById('menu');
            menu.classList.toggle('menu-visible');
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>Welcome to Hotel Management System</h1>
        <!-- Toggle menu button -->
        <div class="toggle-menu" onclick="toggleMenu()">☰</div>
        
        <!-- Menu items -->
        <div id="menu" class="menu menu-hidden">
            <a href="login.jsp">Login</a>
            <a href="register.jsp">Register</a>
            <a href="orderFood.jsp">Order Food</a>
            <a href="games.jsp">Games</a> <!-- Link to games.jsp -->
            <a href="hotel_meeting.jsp">Hotel Meeting</a> <!-- Link to hotel_meeting.jsp -->
            <!-- Add more menu items as needed -->
        </div>
    </div>
</body>
</html>
