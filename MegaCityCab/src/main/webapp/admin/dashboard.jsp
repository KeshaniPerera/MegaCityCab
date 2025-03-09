<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f9;
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
        height: 100vh;
        overflow: hidden;
    }

    .background-image {
        width: 100%;
        height: 100%;
        object-fit: cover;
        display: block;
    }

    .overlay {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        background-color: rgba(0, 0, 0, 0.7);
        padding: 40px;
        border-radius: 15px;
        text-align: center;
        max-width: 600px;
    }

    .overlay h2 {
        color: white;
        font-size: 36px;
        margin-bottom: 20px;
    }

    .overlay p {
        color: white;
        font-size: 18px;
        margin-bottom: 30px;
    }

</style>
</head>
<body>

    <%@ include file="navBar.jsp" %>

    <div class="image-container">
        <img src="https://img.freepik.com/free-vector/man-taking-break-from-work_23-2148508516.jpg?t=st=1741530665~exp=1741534265~hmac=6eeabd0b34c2c00f113adf46151abc8d4a38a461c46e67d4a0fafe06111d326d&w=1060" alt="Admin Working" class="background-image">
        <div class="overlay">
            <h2>Welcome to MegaCityCab Admin Dashboard</h2>
            <p>Manage bookings, vehicles, and drivers efficiently from one platform.</p>
        </div>
    </div>

</body>
</html>
