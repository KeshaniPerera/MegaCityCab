package servlets;

import dao.BookingDAO;
import dao.UserDAO;
import model.Booking;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/ConfirmBooking")
public class ConfirmBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final BookingDAO bookingDAO = BookingDAO.getInstance();
    private final UserDAO userDAO = UserDAO.getInstance();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve user_email from session
        HttpSession session = request.getSession();
        String userEmail = (String) session.getAttribute("user_email");

        if (userEmail == null) {
            System.out.println("ERROR: User not logged in.");
            request.setAttribute("message", "Booking failed. Please log in first.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }

        // Get User by email
        User user = userDAO.getUserByEmail(userEmail);

        if (user == null) {
            System.out.println("ERROR: User not found.");
            request.setAttribute("message", "Booking failed. User not found.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }

        // Assign the fetched UserID as the customerID
        int userID = user.getUserID();

        // Extract form data
        String vehicleType = request.getParameter("vehicleType");
        String vehicleID = request.getParameter("vehicleID");
        String driverID = request.getParameter("driverID");
        String rentalDate = request.getParameter("date");
        String rentalTime = request.getParameter("time");
        String pickupLocation = request.getParameter("pickup");
        String returnLocation = request.getParameter("drop");
        String bill = request.getParameter("bill");
        String bookingStatus = "Confirmed"; // Default status when booking is confirmed
        String paymentStatus = "Pending"; // Default payment status

        // Debugging: Print all form data
        System.out.println("Form Data Received:");
        System.out.println("Customer ID: " + userID);
        System.out.println("Vehicle Type: " + vehicleType);
        System.out.println("Vehicle ID: " + vehicleID);
        System.out.println("Driver ID: " + driverID);
        System.out.println("Rental Date: " + rentalDate);
        System.out.println("Rental Time: " + rentalTime);
        System.out.println("Pickup Location: " + pickupLocation);
        System.out.println("Return Location: " + returnLocation);
        System.out.println("Bill: " + bill);

        // Check if all required fields are received
        if (vehicleType == null || vehicleID == null || driverID == null ||
            rentalDate == null || rentalTime == null || pickupLocation == null || returnLocation == null || bill == null) {
            System.out.println("ERROR: Missing required form data.");
            request.setAttribute("message", "Booking failed. Missing required information.");
            request.getRequestDispatcher("/confirmation.jsp").forward(request, response);
            return;
        }

        try {
            // Validate numeric fields before parsing
            if (!isNumeric(vehicleID) || !isNumeric(driverID) || !isNumeric(bill)) {
                System.out.println("ERROR: One or more numeric fields are invalid.");
                request.setAttribute("message", "Booking failed due to invalid number format. Please check the entered values.");
                request.getRequestDispatcher("/confirmation.jsp").forward(request, response);
                return;
            }

            // Create booking object
            Booking booking = new Booking();
            booking.setCustomerID(userID); // Set customerID from session
            booking.setVehicleType(vehicleType);
            booking.setVehicleID(Integer.parseInt(vehicleID));
            booking.setDriverID(Integer.parseInt(driverID));
            booking.setRentalDate(rentalDate);
            booking.setRentalTime(rentalTime);
            booking.setPickupLocation(pickupLocation);
            booking.setReturnLocation(returnLocation);
            booking.setBill(Double.parseDouble(bill));
            booking.setBookingStatus(bookingStatus);
            booking.setPaymentStatus(paymentStatus);

            // Debugging: Print booking object to ensure correct values
            System.out.println("Booking Object Created: " + booking);

            // Add booking to database
            boolean isBookingAdded = bookingDAO.addBooking(booking);

            // Check if booking was added successfully
            if (isBookingAdded) {
                System.out.println("Booking added successfully!");
                request.setAttribute("message", "Booking added successfully!");
            } else {
                System.out.println("Booking failed to add.");
                request.setAttribute("message", "Booking confirmation failed. Please try again.");
            }

        } catch (NumberFormatException e) {
            System.out.println("ERROR: Invalid number format.");
            e.printStackTrace();
            request.setAttribute("message", "Booking failed due to invalid number format. Please check the entered values.");
        } catch (Exception e) {
            System.out.println("ERROR: Unexpected exception.");
            e.printStackTrace();
            request.setAttribute("message", "Booking failed due to an unexpected error. Please try again.");
        }

        // Forward the request back to a confirmation page
        System.out.println("Forwarding to confirmation page.");
        request.getRequestDispatcher("/customer/myBookings.jsp").forward(request, response);
    }

    // Helper method to check if a string is numeric
    private boolean isNumeric(String str) {
        try {
            Double.parseDouble(str);
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }
}
