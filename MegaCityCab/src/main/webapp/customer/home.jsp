<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<style>
    /* Internal CSS for the home page */
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
    }

    h1 {
        text-align: center;
        color: white;
        margin: 0;
        padding: 20px;
    }

    .image-container {
        position: relative;
        text-align: center;
    }

    .background-image {
        width: 100%; /* Make main image fit the screen width */
        height: auto;
        display: block;
    }

    .overlay {
        position: absolute;
        top: 40%; /* Adjusted to move text higher */
        left: 30%; /* Adjusted to move text to the left */
        transform: translate(-50%, -50%);
        background-color: rgba(0, 0, 0, 0.7); /* Black rectangle with some transparency */
       20px;
        border-radius: 10px;
        text-align: center;
    }

    .overlay a {
        display: inline-block;
        background-color: yellow;
        color: black;
        padding: 10px 20px;
        text-decoration: none;
        font-size: 18px;
        border-radius: 5px;
        margin-top: 10px;
    }

    .overlay a:hover {
        background-color: black;
        color: yellow;
    }

    .vehicles-image {
        width: 100%; /* Make vehicle image fit the screen width */
        height: auto;
        display: block;
    }
</style>
</head>
<body>

    <%@ include file="navBar.jsp" %>

    <!-- Display main.png as a background image -->
    <div class="image-container">
        <img src="../images/main.png" alt="Main Image" class="background-image">
        
        <!-- Overlay with text and link -->
        <div class="overlay">
            <h1>Enjoy a reliable journey with Mega City Cabs</h1>
            <a href="${sessionScope.user_email != null ?  "../booking" : '../authentication/signIn.jsp'}">BOOK NOW</a>
        </div>
    </div>

    <!-- Display vehicles_image.png from the images folder -->
    <div class="image-container">
        <img src="../images/vehicles_image.png" alt="Vehicles Image" class="vehicles-image">
    </div>

    <!-- Rest of your home page content -->

</body>
</html>