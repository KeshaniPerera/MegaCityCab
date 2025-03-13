<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #000;  
            margin: 0;
            padding: 0;
            color: #fff; 
        }
     
     
        .container {
            width: 70%;
            margin: 0 auto;
            background-color: #ffcc00;  /* Yellow background */
            padding: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }
        label {
            font-size: 16px;
            margin-bottom: 5px;
            display: inline-block;
            color: #333;
        }
        select, input[type="date"], input[type="time"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0 20px;
            border: 2px solid #ccc;
            border-radius: 5px;
            background-color: #fff;
        }
        button {
            width: 100%;
            padding: 15px;
            background-color: #000; /* Black button */
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
        }
        button:hover {
            background-color: #333; /* Darker shade of black on hover */
        }
        .form-group {
            margin-bottom: 20px;
        }
        .dropdown-container {
            display: flex;
            justify-content: space-between;
            gap: 10px;
        }
        .dropdown-container select {
            width: 48%;  /* Adjust width to fit side by side */
        }
        .date-time-container {
            display: flex;
            justify-content: space-between;
            gap: 10px;
        }
        .date-time-container input {
            width: 48%;  /* Adjust width to fit side by side */
        }
        .footer {
            text-align: center;
            margin-top: 30px;
            color: #555;
        }
        /* Styling for the fields when there's a value */
        .field-label {
            font-weight: bold;
        }
        .field-container {
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <%@ include file="navBar.jsp" %>

    <div class="container">
        <h1>Booking Page</h1>

          <form action="${pageContext.request.contextPath}/booking" method="post">
            <div class="form-group">
                <label for="vehicle">Select Vehicle:</label>
                <select id="vehicleType" name="vehicleType">
                    <c:forEach var="vehicleName" items="${uniqueVehicleNames}">
                        <option value="${vehicleName}">${vehicleName}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group dropdown-container">
                <div>
                    <label for="pickup">Pickup Location:</label>
                    <select id="pickup" name="pickup">
                        <!-- Iterating over the outer map for pickup locations -->
                        <c:forEach var="pickupEntry" items="${distances}">
                            <option value="${pickupEntry.key}">${pickupEntry.key}</option>
                        </c:forEach>
                    </select>
                </div>

                <div>
                    <label for="drop">Drop Location:</label>
                    <select id="drop" name="drop">
                        <!-- Iterating over the outer map for pickup locations -->
                        <c:forEach var="pickupEntry" items="${distances}">
                            <!-- Then iterating over the inner map for drop locations -->
                            <c:forEach var="dropEntry" items="${pickupEntry.value}">
                                <option value="${dropEntry.key}">${dropEntry.key} - ${dropEntry.value} km</option>
                            </c:forEach>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <div class="form-group date-time-container">
                <div>
                    <label for="date">Select Date:</label>
                    <input type="date" id="date" name="date">
                </div>

                <div>
                    <label for="time">Select Time:</label>
                    <input type="time" id="time" name="time">
                </div>
            </div>

            <button type="submit">Calculate Fare</button>
        </form>
    </div>
</body>
</html>
