package servlets;

import dao.BookingDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ManageBooking")
public class ManageBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ManageBookingServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Display or process bookings (if needed in GET request)
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get bookingID, newStatus, vehicleID, and driverID from request parameters
        String bookingIDStr = request.getParameter("bookingID");
        String newStatus = request.getParameter("newStatus");
        String vehicleIDStr = request.getParameter("vehicleID");
        String driverIDStr = request.getParameter("driverID");

        if (bookingIDStr != null && !bookingIDStr.isEmpty() && newStatus != null && !newStatus.isEmpty()) {
            try {
                int bookingID = Integer.parseInt(bookingIDStr);

                // If only 2 parameters are passed (BookingID and NewStatus)
                if (vehicleIDStr == null || vehicleIDStr.isEmpty() || driverIDStr == null || driverIDStr.isEmpty()) {
                    // Update the booking status only
                    BookingDAO bookingDAO = BookingDAO.getInstance();
                    boolean isUpdated = bookingDAO.updateBookingStatus(bookingID, newStatus);

                    if (isUpdated) {
                        // Redirect back to the Manage Bookings page
                        response.sendRedirect(request.getContextPath() + "/admin/manageBookings.jsp?status=success");
                    } else {
                        response.sendRedirect(request.getContextPath() + "/admin/manageBookings.jsp?status=failed");
                    }
                } 
                // If all 4 parameters are passed (BookingID, NewStatus, VehicleID, DriverID)
                else {
                    int vehicleID = Integer.parseInt(vehicleIDStr);
                    int driverID = Integer.parseInt(driverIDStr);

                    // Update the booking with vehicle and driver
                    BookingDAO bookingDAO = BookingDAO.getInstance();
                    boolean isUpdated = bookingDAO.updateBookingWithVehicleAndDriver(bookingID, newStatus, vehicleID, driverID);

                    if (isUpdated) {
                        // Redirect back to the Manage Bookings page
                        response.sendRedirect(request.getContextPath() + "/admin/manageBookings.jsp?status=success");
                    } else {
                        response.sendRedirect(request.getContextPath() + "/admin/manageBookings.jsp?status=failed");

                    }
                    
                }

            } catch (NumberFormatException e) {
                response.getWriter().write("Invalid input. Please ensure all IDs are valid numbers.");
            }
        } else {
            response.getWriter().write("Booking ID, status, and required parameters are required.");
        }
    }
}
