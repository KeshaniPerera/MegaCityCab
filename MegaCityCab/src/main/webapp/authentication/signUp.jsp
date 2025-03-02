<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - Mega City Cab</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
            min-height: 100vh;
        }

        /* Logo Styles */
        .logo {
            text-align: center;
            margin-bottom: 20px;
        }

        .logo img {
            height: 120px; /* Adjust logo size */
            width: auto;
        }

        /* Signup Container Styles */
        .signup-container {
            background-color: #FFD700; /* Yellow background */
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px; /* Increased width for better spacing */
            text-align: center;
        }

        .signup-container h2 {
            margin-bottom: 1.5rem;
            color: #000000; /* Black text */
            font-size: 1.8rem;
        }

        /* Form Styles */
        .form-row {
            display: flex;
            gap: 1rem; /* Spacing between columns */
            margin-bottom: 1.5rem; /* Spacing between rows */
        }

        .form-group {
            flex: 1; /* Each group takes equal space */
            text-align: left;
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
            color: #000000; /* Black text */
            font-weight: bold;
        }

        input[type="text"],
        input[type="email"],
        input[type="tel"],
        input[type="password"] {
            width: 90%; /* Smaller input fields */
            padding: 0.8rem;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
            transition: border-color 0.3s ease;
        }

        input:focus {
            border-color: #000000; /* Black border on focus */
            outline: none;
        }

        button[type="submit"] {
            width: 100%;
            padding: 0.8rem;
            background-color: #000000; /* Black background */
            color: #FFD700; /* Yellow text */
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #333333; /* Darker black on hover */
        }

        /* Signin Text Styles */
        .signin-text {
            margin-top: 1.5rem;
            color: #000000; /* Black text */
        }

        .signin-text a {
            color: #000000; /* Black text */
            text-decoration: underline; /* Underline for links */
            font-weight: bold;
        }

        .signin-text a:hover {
            color: #333333; /* Darker black on hover */
        }
    </style>
</head>
<body>

    <!-- Logo -->
    <div class="logo">
        <img src="${pageContext.request.contextPath}/images/logo.png" alt="Mega City Cab Logo">
    </div>

    <!-- Signup Container -->
    <div class="signup-container">
        <h2>Sign Up</h2>

        <form action="../SignUp" method="post">
            <!-- First Row: First Name and Last Name -->
            <div class="form-row">
                <div class="form-group">
                    <label for="firstName">First Name:</label>
                    <input type="text" id="firstName" name="firstName" required>
                </div>
                <div class="form-group">
                    <label for="lastName">Last Name:</label>
                    <input type="text" id="lastName" name="lastName" required>
                </div>
            </div>

            <!-- Second Row: Email and NIC -->
            <div class="form-row">
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="nic">NIC:</label>
                    <input type="text" id="nic" name="nic" required>
                </div>
            </div>

            <!-- Third Row: Telephone and Address -->
            <div class="form-row">
                <div class="form-group">
                    <label for="telephone">Telephone:</label>
                    <input type="tel" id="telephone" name="telephone" required>
                </div>
                <div class="form-group">
                    <label for="address">Address:</label>
                    <input type="text" id="address" name="address" required>
                </div>
            </div>

            <!-- Fourth Row: Password -->
            <div class="form-row">
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <!-- Empty div to maintain alignment -->
                <div class="form-group"></div>
            </div>

            <!-- Submit Button -->
            <button type="submit">Sign Up</button>
        </form>
        
        <p class="signin-text">Already a member? <a href="signIn.jsp">Sign In</a></p>
    </div>
    
    <% if (request.getAttribute("message") != null) { %>
        <script>
            <% if ("Registration Successful!".equals(request.getAttribute("message"))) { %>
                Swal.fire({
                    icon: "success",
                    title: "Registration Successful!",
                    text: "Employee has been registered.",
                    timer: 2500,
                    showConfirmButton: false
                });
            <% } else { %>
                Swal.fire({
                    icon: "error",
                    title: "Registration Failed!",
                    text: "<%= request.getAttribute("message") %>",
                    confirmButtonColor: "#d33"
                });
            <% } %>
        </script>
    <% } %>
</body>
</html>