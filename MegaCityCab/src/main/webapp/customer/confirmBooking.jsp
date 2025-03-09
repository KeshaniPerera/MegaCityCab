<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Confirm Booking</title>
</head>
<body>
    <%@ include file="navBar.jsp" %>

    <p>Your total bill is: ${bill} LKR</p>
    <p>Pickup Location: ${pickup}</p>
    <p>Drop Location: ${drop}</p>
    <p id="vType">Selected Vehicle: ${vehicleType}</p>
    <p>Date: ${date}</p>
    <p>Time: ${time}</p>

    <!-- Hidden form for submitting the booking details -->
    <form action=" ${pageContext.request.contextPath}/ConfirmBooking" method="POST">

        <!-- Hidden Inputs for the passed values -->
        <input type="hidden" name="pickup" value="${pickup}" />
        <input type="hidden" name="drop" value="${drop}" />
        <input type="hidden" name="vehicleType" value="${vehicleType}" />
        <input type="hidden" name="date" value="${date}" />
        <input type="hidden" name="time" value="${time}" />
        <input type="hidden" name="bill" value="${bill}" />

        <!-- Dummy data for other fields -->
        <input type="hidden" name="vehicleID" value="" />
        <input type="hidden" name="driverID" value="" />
        <input type="hidden" name="bookingStatus" value="Pending" />
        <input type="hidden" name="paymentStatus" value="Not Paid" />

        <!-- Confirm Booking Button -->
        <button type="submit">Confirm Booking</button>
    </form>

</body>
</html>
