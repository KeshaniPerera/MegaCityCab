<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /* Internal CSS for the navbar */
    body {
        margin: 0;
        font-family: Arial, sans-serif;
    }

    .navbar {
        background-color: #007BFF; /* Blue background */
        overflow: hidden;
        display: flex;
        align-items: center;
        justify-content: space-between; /* Space between logo and links */
        padding: 0 20px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Subtle shadow */
    }

    .navbar a {
        color: white; /* White text */
        text-align: center;
        padding: 20px 25px; /* Increased spacing */
        text-decoration: none;
        font-size: 17px;
        font-weight: bold; /* Stronger links */
        text-transform: uppercase; /* Uppercase text */
        transition: background-color 0.3s, color 0.3s; /* Smooth hover effect */
    }

    .navbar a:hover {
        background-color: #0056b3; /* Darker blue on hover */
        color: #fff; /* White text on hover */
    }

    .navbar a.logo {
        padding: 5px; /* Adjust padding for the logo */
    }

    .navbar a.logo img {
        height: 80px; /* Larger logo */
        vertical-align: middle;
    }

    .navbar .nav-links {
        display: flex;
        align-items: center;
    }

    /* Style for active link */
    .navbar a.active {
        background-color: #0056b3; /* Darker blue for active link */
        color: #fff; /* White text for active link */
    }
</style>
</head>
<body>

    <!-- Navbar -->
    <div class="navbar">
        <!-- Logo linking to home.jsp -->
        <a href="dashboard.jsp" class="logo">
            <img src="../images/logo.png" alt="Logo">
        </a>

        <!-- Navbar links aligned to the right -->
        <div class="nav-links">
            <a href="dashboard.jsp">Home</a>
            <a href="manageBookings.jsp">Manage Bookings</a>
            <a href="manageVehicles.jsp">Manage Vehicles</a>
            <a href="manageDrivers.jsp">Manage Drivers</a>
            <a href="help.jsp">Help</a>
            

            <!-- Check if user is logged in -->
            <% 
                // Check if the user is logged in (e.g., by checking a session attribute)
                String loggedInUser = (String) session.getAttribute("user_email");
                if (loggedInUser != null) {
                    // User is logged in, display Logout link
            %>
                    <a href="${pageContext.request.contextPath}/SignOut">Logout</a>
            <%
                } else {
                    // User is not logged in, display Login link
            %>
                    <a href="../authentication/signIn.jsp">Login</a>
            <%
                }
            %>
        </div>
    </div>

</body>
</html>