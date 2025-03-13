package servlets;

import dao.BookingDAO;
import dao.VehicleDAO;
import dao.DriverDAO; // Add this import
import model.Vehicle;
import model.Driver; // Add this import

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/ManageBooking")
public class ManageBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ManageBookingServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch vehicles from the database
        VehicleDAO vehicleDAO = VehicleDAO.getInstance();
        List<Vehicle> vehicles = vehicleDAO.getAllVehicles();

        DriverDAO driverDAO = DriverDAO.getInstance(); 
        List<Driver> drivers = driverDAO.getAllDrivers();

        // Set vehicles and drivers as request attributes
        request.setAttribute("vehicles", vehicles);
        request.setAttribute("drivers", drivers); 

        request.getRequestDispatcher("/manageBookings.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	String bookingIDStr = request.getParameter("bookingID");
        String newStatus = request.getParameter("newStatus");
        String vehicleIDStr = request.getParameter("vehicleID");
        String driverIDStr = request.getParameter("driverID");
        String vehicleName = request.getParameter("vehicleName");

        BookingDAO bookingDAO = BookingDAO.getInstance();
        VehicleDAO vehicleDAO = VehicleDAO.getInstance();

        try {
            if ((vehicleName != null && !vehicleName.isEmpty()) &&
                (bookingIDStr == null || bookingIDStr.isEmpty()) &&
                (newStatus == null || newStatus.isEmpty()) &&
                (vehicleIDStr == null || vehicleIDStr.isEmpty()) &&
                (driverIDStr == null || driverIDStr.isEmpty())) {

                System.out.println("Fetching vehicle IDs for vehicleName: " + vehicleName); // Debugging
                List<Integer> vehicleIDs = vehicleDAO.getVehicleIDsByName(vehicleName);
                System.out.println("Vehicle IDs found: " + vehicleIDs); // Debugging

                if (vehicleIDs.isEmpty()) {
                    response.getWriter().write("No vehicles found with name: " + vehicleName);
                } else {
                    // Manually create JSON response
                    StringBuilder jsonResponse = new StringBuilder("[");

                    for (int i = 0; i < vehicleIDs.size(); i++) {
                        jsonResponse.append(vehicleIDs.get(i));
                        if (i < vehicleIDs.size() - 1) {
                            jsonResponse.append(",");
                        }
                    }
                    jsonResponse.append("]");

                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write(jsonResponse.toString());
                    return;
                }
                return;
            }

            if ((bookingIDStr != null && !bookingIDStr.isEmpty()) &&
                (newStatus != null && !newStatus.isEmpty()) &&
                (vehicleIDStr == null || vehicleIDStr.isEmpty()) &&
                (driverIDStr == null || driverIDStr.isEmpty())) {

                int bookingID = Integer.parseInt(bookingIDStr);
                boolean isUpdated = bookingDAO.updateBookingStatus(bookingID, newStatus);

                response.sendRedirect(request.getContextPath() + "/admin/manageBookings.jsp?status=" + (isUpdated ? "success" : "failed"));
                return;
            }

            if ((bookingIDStr != null && !bookingIDStr.isEmpty()) &&
                (newStatus != null && !newStatus.isEmpty()) &&
                (vehicleIDStr != null && !vehicleIDStr.isEmpty()) &&
                (driverIDStr != null && !driverIDStr.isEmpty())) {

                int bookingID = Integer.parseInt(bookingIDStr);
                int vehicleID = Integer.parseInt(vehicleIDStr);
                int driverID = Integer.parseInt(driverIDStr);

                boolean isUpdated = bookingDAO.updateBookingWithVehicleAndDriver(bookingID, newStatus, vehicleID, driverID);

                response.sendRedirect(request.getContextPath() + "/admin/manageBookings.jsp?status=" + (isUpdated ? "success" : "failed"));
                return;
            }

            // If parameters are missing or invalid
            response.getWriter().write("Invalid request. Please provide valid parameters.");
        } catch (NumberFormatException e) {
            response.getWriter().write("Invalid input. Ensure IDs are valid numbers.");
        }
    }
}