package servlets;

import dao.BookingDAO;
import model.Booking;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/ViewBookings")
public class ViewBookingsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final BookingDAO bookingDAO = BookingDAO.getInstance(); // Ensure this method exists in BookingDAO

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Retrieve all bookings from the database
            List<Booking> bookings = bookingDAO.getAllBookings();
            
            if (bookings != null) {
                System.out.println("Number of bookings retrieved: " + bookings.size()); // Debugging
                request.setAttribute("bookings", bookings);
            } else {
                System.out.println("No bookings found.");
                request.setAttribute("bookings", null);
            }

            // Forward to the correct JSP page
            request.getRequestDispatcher("/customer/myBookings.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving bookings.");
        }
    }
}
