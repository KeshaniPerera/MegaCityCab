<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.BookingDAO, model.Booking, java.util.List, dao.VehicleDAO, model.Vehicle, dao.DriverDAO, model.Driver" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Bookings</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function openManagePopup(bookingID) {
            // Pass the booking ID to the popup
            document.getElementById('popup-bookingID').value = bookingID;
            var myModal = new bootstrap.Modal(document.getElementById('manageModal'));
            myModal.show();
        }
    </script>
</head>
<body>
    <%@ include file="navBar.jsp" %>

    <div class="container mt-4">
        <h2 class="text-center mb-4">Manage Bookings</h2>

        <!-- Pending Bookings Table -->
        <h3 class="mt-4">Pending Bookings</h3>
        <table class="table table-striped table-bordered">
            <thead class="table-warning">
                <tr>
                    <th>Booking ID</th>
                    <th>Customer ID</th>
                    <th>Vehicle Type</th>
                    <th>Vehicle ID</th>
                    <th>Driver ID</th>
                    <th>Rental Date</th>
                    <th>Rental Time</th>
                    <th>Pickup Location</th>
                    <th>Drop Location</th>
                    <th>Bill</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    BookingDAO bookingDAO = BookingDAO.getInstance();
                    List<Booking> pendingBookings = bookingDAO.getPendingBookings();

                    if (pendingBookings.isEmpty()) {
                %>
                        <tr>
                            <td colspan="12" class="text-center">No pending bookings available.</td>
                        </tr>
                <%
                    } else {
                        for (Booking booking : pendingBookings) {
                %>
                        <tr>
                            <td><%= booking.getBookingID() %></td>
                            <td><%= booking.getCustomerID() %></td>
                            <td><%= booking.getVehicleType() %></td>
                            <td><%= booking.getVehicleID() %></td>
                            <td><%= booking.getDriverID() %></td>
                            <td><%= booking.getRentalDate() %></td>
                            <td><%= booking.getRentalTime() %></td>
                            <td><%= booking.getPickupLocation() %></td>
                            <td><%= booking.getReturnLocation() %></td>
                            <td>Rs. <%= booking.getBill() %></td>
                            <td>
                                <div style="display: flex; gap: 10px;">
                                    <button type="button" class="btn btn-primary btn-sm" onclick="openManagePopup(<%= booking.getBookingID() %>)">Manage</button>
                                    <form action="${pageContext.request.contextPath}/ManageBooking" method="post" style="display:inline;">
                                        <input type="hidden" name="bookingID" value="<%= booking.getBookingID() %>">
                                        <input type="hidden" name="newStatus" value="Cancelled">
                                        <button type="submit" class="btn btn-danger btn-sm">Cancel</button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>

        <!-- Booked Bookings Table -->
        <h3 class="mt-4">Booked Bookings</h3>
        <table class="table table-striped table-bordered">
            <thead class="table-success">
                <tr>
                    <th>Booking ID</th>
                    <th>Customer ID</th>
                    <th>Vehicle Type</th>
                    <th>Vehicle ID</th>
                    <th>Driver ID</th>
                    <th>Rental Date</th>
                    <th>Rental Time</th>
                    <th>Pickup Location</th>
                    <th>Drop Location</th>
                    <th>Bill</th>
                    <th>Payment Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Booking> bookedBookings = bookingDAO.getBookedBookings();

                    if (bookedBookings.isEmpty()) {
                %>
                        <tr>
                            <td colspan="12" class="text-center">No booked bookings available.</td>
                        </tr>
                <%
                    } else {
                        for (Booking booking : bookedBookings) {
                %>
                        <tr>
                            <td><%= booking.getBookingID() %></td>
                            <td><%= booking.getCustomerID() %></td>
                            <td><%= booking.getVehicleType() %></td>
                            <td><%= booking.getVehicleID() %></td>
                            <td><%= booking.getDriverID() %></td>
                            <td><%= booking.getRentalDate() %></td>
                            <td><%= booking.getRentalTime() %></td>
                            <td><%= booking.getPickupLocation() %></td>
                            <td><%= booking.getReturnLocation() %></td>
                            <td>Rs. <%= booking.getBill() %></td>
                            <td>
                                <div class="d-flex justify-content-between">
                                    <form action="${pageContext.request.contextPath}/ManageBooking" method="post" style="display:inline;">
                                        <input type="hidden" name="bookingID" value="<%= booking.getBookingID() %>">
                                        <input type="hidden" name="newStatus" value="Cancelled">
                                        <button type="submit" class="">❌</button>
                                    </form>
                                    <form action="${pageContext.request.contextPath}/ManageBooking" method="post" style="display:inline;">
                                        <input type="hidden" name="bookingID" value="<%= booking.getBookingID() %>">
                                        <input type="hidden" name="newStatus" value="Completed">
                                        <button type="submit" class="">✅</button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>

        <!-- Completed Bookings Table -->
        <h3 class="mt-4">Completed Bookings</h3>
        <table class="table table-striped table-bordered">
            <thead class="table-info">
                <tr>
                    <th>Booking ID</th>
                    <th>Customer ID</th>
                    <th>Vehicle Type</th>
                    <th>Vehicle ID</th>
                    <th>Driver ID</th>
                    <th>Rental Date</th>
                    <th>Rental Time</th>
                    <th>Pickup Location</th>
                    <th>Drop Location</th>
                    <th>Bill</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Booking> completedBookings = bookingDAO.getCompletedBookings();

                    if (completedBookings.isEmpty()) {
                %>
                        <tr>
                            <td colspan="11" class="text-center">No completed bookings available.</td>
                        </tr>
                <%
                    } else {
                        for (Booking booking : completedBookings) {
                %>
                        <tr>
                            <td><%= booking.getBookingID() %></td>
                            <td><%= booking.getCustomerID() %></td>
                            <td><%= booking.getVehicleType() %></td>
                            <td><%= booking.getVehicleID() %></td>
                            <td><%= booking.getDriverID() %></td>
                            <td><%= booking.getRentalDate() %></td>
                            <td><%= booking.getRentalTime() %></td>
                            <td><%= booking.getPickupLocation() %></td>
                            <td><%= booking.getReturnLocation() %></td>
                            <td>Rs. <%= booking.getBill() %></td>
                        </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>

        <!-- Cancelled Bookings Table -->
        <h3 class="mt-4">Cancelled Bookings</h3>
        <table class="table table-striped table-bordered">
            <thead class="table-danger">
                <tr>
                    <th>Booking ID</th>
                    <th>Customer ID</th>
                    <th>Vehicle Type</th>
                    <th>Vehicle ID</th>
                    <th>Driver ID</th>
                    <th>Rental Date</th>
                    <th>Rental Time</th>
                    <th>Pickup Location</th>
                    <th>Drop Location</th>
                    <th>Bill</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Booking> cancelledBookings = bookingDAO.getCancelledBookings();

                    if (cancelledBookings.isEmpty()) {
                %>
                        <tr>
                            <td colspan="11" class="text-center">No cancelled bookings available.</td>
                        </tr>
                <%
                    } else {
                        for (Booking booking : cancelledBookings) {
                %>
                        <tr>
                            <td><%= booking.getBookingID() %></td>
                            <td><%= booking.getCustomerID() %></td>
                            <td><%= booking.getVehicleType() %></td>
                            <td><%= booking.getVehicleID() %></td>
                            <td><%= booking.getDriverID() %></td>
                            <td><%= booking.getRentalDate() %></td>
                            <td><%= booking.getRentalTime() %></td>
                            <td><%= booking.getPickupLocation() %></td>
                            <td><%= booking.getReturnLocation() %></td>
                            <td>Rs. <%= booking.getBill() %></td>
                        </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
    </div>

    <!-- Popup Modal for Managing Booking -->
    <div class="modal fade" id="manageModal" tabindex="-1" aria-labelledby="manageModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="manageModalLabel">Manage Booking</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="${pageContext.request.contextPath}/ManageBooking" method="post">
                        <input type="hidden" id="popup-bookingID" name="bookingID">
                        <div class="mb-3">
                            <label for="vehicleID" class="form-label">Assign Vehicle</label>
                            <select class="form-select" name="vehicleID" id="vehicleID" required>
                                <option value="" selected>Select a vehicle</option>
                                <%
                                    VehicleDAO vehicleDAO = VehicleDAO.getInstance();
                                    List<Vehicle> vehicles = vehicleDAO.getAllVehicles();
                                    for (Vehicle vehicle : vehicles) {
                                %>
                                    <option value="<%= vehicle.getVehicleID() %>">
                                        <%= vehicle.getVehicleID() + " - " + vehicle.getVehicleName() %>
                                    </option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                        <input type="hidden" name="newStatus" value="Booked">
                        <div class="mb-3">
                            <label for="driverID" class="form-label">Assign Driver</label>
                            <select class="form-select" name="driverID" id="driverID" required>
                                <option value="" selected>Select a driver</option>
                                <%
                                    DriverDAO driverDAO = DriverDAO.getInstance();
                                    List<Driver> drivers = driverDAO.getAllDrivers();
                                    for (Driver driver : drivers) {
                                %>
                                    <option value="<%= driver.getDriverID() %>">
                                        <%= driver.getDriverID() + " - " + driver.getDriverName() %>
                                    </option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                        <div class="d-flex justify-content-between">
                            <button type="submit" class="btn btn-success">Book</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</body>
</html>