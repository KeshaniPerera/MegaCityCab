<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Bookings</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
         
        }
        .table-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #333;
            margin-bottom: 20px;
        }
        .table th, .table td {
            vertical-align: middle;
        }
        .status-confirmed {
            color: #28a745;
        }
        .status-pending {
            color: #ffc107;
        }
        .status-cancelled {
            color: #dc3545;
        }
    </style>
</head>
<body>
    <%@ include file="navBar.jsp" %>

    <div class="container">
        <div class="table-container">
            <h1>My Bookings</h1>

            <c:choose>
                <c:when test="${not empty bookings}">
                    <table class="table table-striped table-hover">
                        <thead class="table-dark">
                            <tr>
                                <th>Booking ID</th>
                                <th>Customer Email</th>
                                <th>Vehicle Type</th>
                                <th>Vehicle ID</th>
                                <th>Driver ID</th>
                                <th>Rental Date</th>
                                <th>Rental Time</th>
                                <th>Pickup Location</th>
                                <th>Return Location</th>
                                <th>Bill</th>
                                <th>Booking Status</th>
                                <th>Payment Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="booking" items="${bookings}">
                                <tr>
                                    <td>${booking.bookingID}</td>
                                    <td>${booking.vehicleType}</td>
                                    <td>${booking.vehicleID}</td>
                                    <td>${booking.driverID}</td>
                                    <td>${booking.rentalDate}</td>
                                    <td>${booking.rentalTime}</td>
                                    <td>${booking.pickupLocation}</td>
                                    <td>${booking.returnLocation}</td>
                                    <td>$${booking.bill}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${booking.bookingStatus == 'Confirmed'}">
                                                <span class="status-confirmed">${booking.bookingStatus}</span>
                                            </c:when>
                                            <c:when test="${booking.bookingStatus == 'Pending'}">
                                                <span class="status-pending">${booking.bookingStatus}</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="status-cancelled">${booking.bookingStatus}</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${booking.paymentStatus == 'Paid'}">
                                                <span class="status-confirmed">${booking.paymentStatus}</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="status-pending">${booking.paymentStatus}</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <p class="alert alert-info">No bookings found.</p>
                    <p><c:out value="${bookings}"/></p> <!-- Debugging line -->
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
