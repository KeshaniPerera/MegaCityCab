<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Mega City Cab</title>
    <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #000000; /* Black background */
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* Logo Styles */
        .logo {
            text-align: center;
        }

        .logo img {
            height: 120px; /* Adjust logo size */
            width: auto;
        }

        /* Login Container Styles */
        .login-container {
            background-color: #FFD700; /* Yellow background */
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }

        .login-container h2 {
            text-align: center;
            color: #000000; /* Black text */
            margin-bottom: 20px;
        }

        /* Form Styles */
        #loginForm {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        #loginForm label {
            font-size: 16px;
            color: #000000; /* Black text */
        }

        #loginForm input[type="email"],
        #loginForm input[type="password"] {
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            outline: none;
            transition: border-color 0.3s;
        }

        #loginForm input[type="email"]:focus,
        #loginForm input[type="password"]:focus {
            border-color: #000000; /* Black border on focus */
        }

        #loginForm button[type="submit"] {
            padding: 12px 20px;
            background-color: #000000; /* Black background */
            color: #FFD700; /* Yellow text */
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        #loginForm button[type="submit"]:hover {
            background-color: #333333; /* Darker black on hover */
        }

        /* Signup Text Styles */
        .signup-text {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
            color: #000000; /* Black text */
        }

        .signup-text a {
            color: #000000; /* Black text */
            text-decoration: underline; /* Underline for links */
        }

        .signup-text a:hover {
            color: #333333; /* Darker black on hover */
        }
    </style>
</head>
<body>

    <!-- Logo -->
    <div class="logo">
        <img src="${pageContext.request.contextPath}/images/logo.png" alt="Mega City Cab Logo">
    </div>

    <!-- Login Container -->
    <div class="login-container">
        <h2>Login</h2>
        <form id="loginForm">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            
            <button type="submit">Login</button>
        </form>
        <p class="signup-text">New Here? <a href="signUp.jsp">Sign Up</a></p>
    </div>

</body>
</html>