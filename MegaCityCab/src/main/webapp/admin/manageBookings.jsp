<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.BookingDAO, model.Booking, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Bookings</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- Added jQuery for AJAX -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function openManagePopup(bookingID, vehicleName) {
            // Pass the booking ID and vehicle name to the popup
            document.getElementById('popup-bookingID').value = bookingID;
            document.getElementById('vehicleName').value = vehicleName;

            // Fetch vehicle IDs when the modal is opened
            fetchVehicleIDs();

            // Show the modal
            var myModal = new bootstrap.Modal(document.getElementById('manageModal'));
            myModal.show();
        }

        function fetchVehicleIDs() {
            let vehicleName = document.getElementById("vehicleName").value;
            console.log("Fetching vehicle IDs for:", vehicleName); // Debugging

            if (vehicleName.trim() !== "") {
                // Using jQuery AJAX to fetch vehicle IDs
                $.ajax({
                    url: 'ManageBooking',  // The servlet URL
                    type: 'GET',
                    data: { vehicleName: vehicleName },  // Send the vehicle name to the backend
                    success: function(response) {
                        console.log("Response from server:", response); // Debugging
                        try {
                            const vehicleIDs = JSON.parse(response);  // Parse the response as JSON
                            let vehicleIDDropdown = document.getElementById("vehicleID");
                            vehicleIDDropdown.innerHTML = "";  // Clear previous options

                            if (vehicleIDs.length === 0) {
                                let option = new Option("No vehicles found", "");
                                vehicleIDDropdown.appendChild(option);
                            } else {
                                vehicleIDs.forEach(id => {
                                    let option = new Option(id, id);
                                    vehicleIDDropdown.appendChild(option);
                                });
                            }
                        } catch (error) {
                            console.error("Error parsing JSON:", error);
                        }
                    },
                    error: function(xhr, status, error) {
                        console.error("AJAX error:", error);  // Handle errors
                    }
                });
            }
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
                                    <!-- Pass booking ID and vehicle name to the openManagePopup function -->
                                    <button type="button" class="btn btn-primary btn-sm" onclick="openManagePopup(<%= booking.getBookingID() %>, '<%= booking.getVehicleType() %>')">Manage</button>
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

        <!-- Other tables (Booked, Completed, Cancelled) remain unchanged -->
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
                        <input type="hidden" id="vehicleName" name="vehicleName">
                        <div class="mb-3">
                            <label for="vehicleID" class="form-label">Assign Vehicle</label>
                            <select class="form-select" name="vehicleID" id="vehicleID" required>
                                <option value="" selected>Select a vehicle</option>
                                <!-- Vehicle options will be populated dynamically -->
                            </select>
                        </div>
                        <input type="hidden" name="newStatus" value="Booked">
                        <div class="mb-3">
                            <label for="driverID" class="form-label">Assign Driver</label>
                            <select class="form-select" name="driverID" id="driverID" required>
                                <option value="" selected>Select a driver</option>
                                <option value="1">Driver 1</option>
                                <option value="2">Driver 2</option>
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
