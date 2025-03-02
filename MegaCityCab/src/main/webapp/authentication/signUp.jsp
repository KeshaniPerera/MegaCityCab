<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mega City Cab</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .signup-container {
            background-color: #ffffff;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }
        .signup-container h2 {
            margin-bottom: 1.5rem;
            color: #333;
            font-size: 1.8rem;
        }
        .name-group {
            display: flex;
            gap: 1rem;
            margin-bottom: 1rem;
        }
        .input-group {
            flex: 1;
            text-align: left;
        }
        label {
            display: block;
            margin-bottom: 0.5rem;
            color: #555;
            font-weight: bold;
        }
        input[type="text"],
        input[type="email"],
        input[type="tel"],
        input[type="password"] {
            width: 100%;
            padding: 0.8rem;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
            margin-bottom: 1rem;
            transition: border-color 0.3s ease;
        }
        input:focus {
            border-color: #007bff;
            outline: none;
        }
        button[type="submit"] {
            width: 100%;
            padding: 0.8rem;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #0056b3;
        }
        .signin-text {
            margin-top: 1rem;
            color: #555;
        }
        .signin-text a {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
        }
        .signin-text a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="signup-container">
        <h2>Sign Up</h2>

        <form action="<%= request.getContextPath() %>/SignUp" method="post">
            <div class="name-group">
                <div class="input-group">
                    <label for="firstName">First Name:</label>
                    <input type="text" id="firstName" name="firstName" required>
                </div>
                <div class="input-group">
                    <label for="lastName">Last Name:</label>
                    <input type="text" id="lastName" name="lastName" required>
                </div>
            </div>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            
            <label for="nic">NIC:</label>
            <input type="text" id="nic" name="nic" required>
            
            <label for="telephone">Telephone:</label>
            <input type="tel" id="telephone" name="telephone" required>
            
            <label for="address">Address:</label>
            <input type="text" id="address" name="address" required>
            
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            
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
