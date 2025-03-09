package servlets;

import dao.UserDAO;
import dao.BookingDAO;
import model.Booking;
import model.User;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/MyBookings")
public class MyBookingsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public MyBookingsServlet() {
        super();
    }

    // Handle GET request
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the email from the session or request
        HttpSession session = request.getSession(false);
        if (session != null) {
            String email = (String) session.getAttribute("user_email");  // Assuming email is stored in session
            System.out.println("Session email: " + email);  // Debugging line
            
            if (email != null) {
                // Fetch the user object by email
                UserDAO userDAO = UserDAO.getInstance();
                User user = userDAO.getUserByEmail(email);
                System.out.println("User found: " + user);  // Debugging line
                
                if (user != null) {
                    // Fetch the list of bookings for the customer by userID
                    BookingDAO bookingDAO = BookingDAO.getInstance();
                    List<Booking> bookings = bookingDAO.getBookingsByCustomerID(user.getUserID()); // Corrected here
                    
                    // Debugging line to check the size of the bookings list
                    System.out.println("Bookings fetched: " + bookings.size());
                    
                    if (!bookings.isEmpty()) {
                        // Set the bookings as an attribute in the request
                        request.setAttribute("bookings", bookings);
                    } else {
                        // If no bookings are found
                        System.out.println("No bookings found for this user.");
                        request.setAttribute("bookings", null);  // Set empty bookings
                    }
                    
                    // Forward the request to a JSP page to display the bookings
                    request.getRequestDispatcher("/customer/myBookings.jsp").forward(request, response);
                } else {
                    // If no user is found, redirect to login page
                    System.out.println("User not found. Redirecting to login page.");
                    response.sendRedirect("login.jsp");
                }
            } else {
                // Redirect to login page if no email is found in session
                System.out.println("No email found in session. Redirecting to login page.");
                response.sendRedirect("login.jsp");
            }
        } else {
            // If no session, redirect to login page
            System.out.println("No session found. Redirecting to login page.");
            response.sendRedirect("login.jsp");
        }
    }

    // Handle POST request (if necessary, you can implement POST as well)
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
