<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="dao.DriverDAO" %>
<%@ page import="model.Driver" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Drivers</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <%@ include file="navBar.jsp" %>

    <div class="container mt-4">
        <h1 class="mb-4 text-center">Manage Drivers</h1>

        <!-- Actions Table -->
        <table class="table table-bordered">
            <tbody>
                <tr>
                    <td class="text-center">
                        <button type="button" class="btn btn-success btn-sm" data-bs-toggle="modal" data-bs-target="#addDriverModal">
                            Add Driver
                        </button>
                    </td>
                </tr>
            </tbody>
        </table>

        <!-- Driver List Table -->
        <h3 class="mt-4">Driver List</h3>
        <table class="table table-striped table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>NIC</th>
                    <th>Phone Number</th>
                    <th>Address</th>
                    <th>Actions</th> <!-- New Action Column -->
                </tr>
            </thead>
            <tbody>
                <%
                    List<Driver> drivers = DriverDAO.getInstance().getAllDrivers();
                    for (Driver driver : drivers) {
                %>
                <tr>
                    <td><%= driver.getDriverID() %></td>
                    <td><%= driver.getDriverName() %></td>
                    <td><%= driver.getDriverNIC() %></td>
                    <td><%= driver.getPhoneNumber() %></td>
                    <td><%= driver.getAddress() %></td>
                    <td>
                        <!-- Action to delete the driver -->
                        <form action="${pageContext.request.contextPath}/ManageDrivers" method="post" style="display:inline;">
                            <input type="hidden" name="driverID" value="<%= driver.getDriverID() %>">
                            <button type="submit" class="">❌</button>
                        </form>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <!-- Add Driver Modal -->
    <div class="modal fade" id="addDriverModal" tabindex="-1" aria-labelledby="addDriverModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header bg-primary text-white">
                    <h5 class="modal-title" id="addDriverModalLabel">Add New Driver</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="${pageContext.request.contextPath}/ManageDrivers" method="post">
                        <div class="mb-3">
                            <label class="form-label fw-bold">Driver Name</label>
                            <input type="text" name="driverName" class="form-control" placeholder="Enter driver name" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold">Driver NIC</label>
                            <input type="text" name="driverNIC" class="form-control" placeholder="Enter driver NIC" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold">Phone Number</label>
                            <input type="text" name="phoneNumber" class="form-control" placeholder="Enter phone number" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold">Address</label>
                            <input type="text" name="address" class="form-control" placeholder="Enter address" required>
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