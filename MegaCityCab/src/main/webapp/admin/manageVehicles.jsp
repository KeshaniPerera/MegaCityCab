<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="dao.VehicleDAO" %>
<%@ page import="model.Vehicle" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Vehicles</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <%@ include file="navBar.jsp" %>

    <div class="container mt-4">
        <h1 class="mb-4 text-center">Manage Vehicles</h1>

        <!-- Actions Table -->
        <table class="table table-bordered">
            <tbody>
                <tr>
                    <td class="text-center">
                        <button type="button" class="btn btn-success btn-sm" data-bs-toggle="modal" data-bs-target="#addVehicleModal">
                            Add Vehicle
                        </button>
                    </td>
                </tr>
            </tbody>
        </table>

        <!-- Vehicle List Table -->
        <h3 class="mt-4">Vehicle List</h3>
        <table class="table table-striped table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Vehicle Name</th>
                    <th>Model</th>
                    <th>Brand</th>
                    <th>Year</th>
                    <th>Registration Number</th>
                    <th>Seating Capacity</th>
                    <th>Fuel Type</th>
                    <th>Rate Per Day</th>
                    <th>Actions</th> <!-- New Action Column -->
                </tr>
            </thead>
            <tbody>
                <%
                    List<Vehicle> vehicles = VehicleDAO.getInstance().getAllVehicles();
                    for (Vehicle vehicle : vehicles) {
                %>
                <tr>
                    <td><%= vehicle.getVehicleID() %></td>
                    <td><%= vehicle.getVehicleName() %></td>
                    <td><%= vehicle.getModel() %></td>
                    <td><%= vehicle.getBrand() %></td>
                    <td><%= vehicle.getYear() %></td>
                    <td><%= vehicle.getRegistrationNumber() %></td>
                    <td><%= vehicle.getSeatingCapacity() %></td>
                    <td><%= vehicle.getFuelType() %></td>
                    <td><%= vehicle.getRatePerDay() %></td>
                    <td>
                        <!-- Action to delete the vehicle -->
                        <form action="${pageContext.request.contextPath}/ManageVehicles" method="post" style="display:inline;">
                            <input type="hidden" name="vehicleID" value="<%= vehicle.getVehicleID() %>">
                            <button type="submit" class="">❌</button>
                        </form>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <!-- Add Vehicle Modal -->
    <div class="modal fade" id="addVehicleModal" tabindex="-1" aria-labelledby="addVehicleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header bg-primary text-white">
                    <h5 class="modal-title" id="addVehicleModalLabel">Add New Vehicle</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="${pageContext.request.contextPath}/ManageVehicles" method="post">
                    
                        <div class="mb-3">
                            <label class="form-label fw-bold">Vehicle Name</label>
                            <select name="vehicleName" class="form-control" required>
                                <option value="" disabled selected>Select a vehicle</option>
                                <option value="Alto">Alto</option>
                                <option value="WagonR">WagonR</option>
                                <option value="KDH">KDH</option>
                                <option value="Prius">Prius</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">Model</label>
                            <input type="text" name="model" class="form-control" placeholder="Enter model" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold">Brand</label>
                            <input type="text" name="brand" class="form-control" placeholder="Enter brand" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold">Year</label>
                            <input type="text" name="year" class="form-control" placeholder="Enter year" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold">Registration Number</label>
                            <input type="text" name="registrationNumber" class="form-control" placeholder="Enter registration number" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold">Seating Capacity</label>
                            <input type="number" name="seatingCapacity" class="form-control" placeholder="Enter seating capacity" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold">Fuel Type</label>
                            <input type="text" name="fuelType" class="form-control" placeholder="Enter fuel type" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold">Rate Per Day</label>
                            <input type="number" name="ratePerDay" class="form-control" placeholder="Enter rate per day" required>
                        </div>
                        <div class="d-flex justify-content-end gap-2">
                            <button type="submit" class="btn btn-success">Add</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
