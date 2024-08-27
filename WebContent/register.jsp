<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('background.jpg'); /* Replace with your image URL */
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            color: #fff;
        }
        h1 {
            color: #FFD700; /* Gold color for the heading */
        }
        form {
            background-color: rgba(0, 0, 0, 0.7); /* Semi-transparent background */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            width: 300px;
            box-sizing: border-box;
        }
        input[type="text"], input[type="password"], input[type="email"] {
            width: calc(100% - 22px);
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #fff;
        }
        input[type="submit"] {
            width: 100%;
            background-color: #FFD700; /* Gold color for the button */
            color: #000;
            padding: 10px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover {
            background-color: #FFC107; /* Slightly darker gold on hover */
        }
        label {
            display: block;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <h1>Register</h1>
    <form action="register" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>
        
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
        
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>
        
        <input type="submit" value="Register">
    </form>
</body>
</html>
