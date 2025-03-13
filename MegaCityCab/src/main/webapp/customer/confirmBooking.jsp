<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Confirm Booking</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        /* Page Styles */
        body {
            background-color: #000; /* Black background */
            color: #fff; /* White text */
        }
        /* Custom Card Styles */
        .card-custom {
            background-color: #ffcc00; /* Yellow background */
            color: #000; /* Black text inside card */
            border-radius: 10px;
            padding: 30px;
        }
        /* Button Styles */
        button {
            background-color: #000; /* Black button */
            color: #ffcc00; /* Yellow text */
            border: 2px solid #ffcc00;
            padding: 10px 20px;
            font-size: 1.2rem;
            border-radius: 5px;
            cursor: pointer;
        }
        
    </style>
</head>
<body>
    <%@ include file="navBar.jsp" %>

    <!-- Center the card both vertically and horizontally -->
    <div class="container d-flex justify-content-center align-items-center" style="min-height: 100vh;">
        <div class="card card-custom text-center">
            <h1 class="mb-4">Your Booking Details</h1>

            <p>Your total bill is: ${bill} LKR</p>
            <p>Pickup Location: ${pickup}</p>
            <p>Drop Location: ${drop}</p>
            <p id="vType">Selected Vehicle: ${vehicleType}</p>
            <p>Date: ${date}</p>
            <p>Time: ${time}</p>

            <!-- Hidden form for submitting the booking details -->
            <form action="${pageContext.request.contextPath}/ConfirmBooking" method="POST">
                <!-- Hidden Inputs for the passed values -->
                <input type="hidden" name="pickup" value="${pickup}" />
                <input type="hidden" name="drop" value="${drop}" />
                <input type="hidden" name="vehicleType" value="${vehicleType}" />
                <input type="hidden" name="date" value="${date}" />
                <input type="hidden" name="time" value="${time}" />
                <input type="hidden" name="bill" value="${bill}" />

                <!-- Dummy data for other fields -->
                <input type="hidden" name="vehicleID" value="0" />
                <input type="hidden" name="driverID" value="0" />
                <input type="hidden" name="bookingStatus" value="Pending" />

                <!-- Confirm Booking Button -->
                <div class="mt-4">
                    <button type="submit">Confirm Booking</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS (Optional) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
