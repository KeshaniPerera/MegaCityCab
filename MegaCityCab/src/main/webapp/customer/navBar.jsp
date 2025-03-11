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
        background-color: black;
        overflow: hidden;
        display: flex;
        align-items: center;
        justify-content: space-between; /* Space between logo and links */
        padding: 0 20px;
    }

    .navbar a {
        color: #FFD700; /* Darker yellow */
        text-align: center;
        padding: 20px 25px; /* Increased spacing */
        text-decoration: none;
        font-size: 17px;
        font-weight: bold; /* Stronger links */
        text-transform: uppercase; /* Uppercase text */
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
</style>
</head>
<body>

    <!-- Navbar -->
    <div class="navbar">
        <!-- Logo linking to home.jsp -->
        <a href="home.jsp" class="logo">
<img src="${pageContext.request.contextPath}/images/logo.png" alt="Logo">
            
        </a>

        <!-- Navbar links aligned to the right -->
        <div class="nav-links">
            <a href="${pageContext.request.contextPath}/customer/home.jsp">Home</a>
            <a href="${pageContext.request.contextPath}/booking">Booking</a>
			<a href="${pageContext.request.contextPath}/customer/help.jsp">Help</a>
            <a href="${pageContext.request.contextPath}/MyBookings">My Bookings</a>

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