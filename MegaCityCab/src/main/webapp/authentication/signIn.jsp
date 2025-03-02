<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Mega City Cab</title>
</head>
<body style="font-family: Arial, sans-serif; background-color: #f4f4f4; margin: 0; padding: 0; display: flex; justify-content: center; align-items: center; height: 100vh;">

    <!-- Login Container -->
    <div class="login-container" style="background-color: #fff; padding: 40px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); width: 100%; max-width: 400px;">
        <h2 style="text-align: center; color: #333; margin-bottom: 20px;">Login</h2>
        <form id="loginForm" style="display: flex; flex-direction: column; gap: 15px;">
            <label for="email" style="font-size: 16px; color: #333;">Email:</label>
            <input type="email" id="email" name="email" required style="padding: 10px; font-size: 16px; border: 1px solid #ccc; border-radius: 5px; outline: none; transition: border-color 0.3s;">
            
            <label for="password" style="font-size: 16px; color: #333;">Password:</label>
            <input type="password" id="password" name="password" required style="padding: 10px; font-size: 16px; border: 1px solid #ccc; border-radius: 5px; outline: none; transition: border-color 0.3s;">
            
            <button type="submit" style="padding: 12px 20px; background-color: #007bff; color: #fff; border: none; border-radius: 5px; cursor: pointer; font-size: 16px; transition: background-color 0.3s;">Login</button>
        </form>
        <p class="signup-text" style="text-align: center; margin-top: 20px; font-size: 14px; color: #555;">New Here? <a href="signUp.jsp" style="color: #007bff; text-decoration: none;">Sign Up</a></p>
    </div>

</body>
</html>
