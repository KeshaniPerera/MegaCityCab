package servlets;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import model.Locations;
import javax.servlet.annotation.WebServlet;
import util.CalculateBillUtil;
import java.util.Map;

@WebServlet("/booking")
public class BookingServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the location distances (no change needed here)
        Map<String, Map<String, Double>> distances = Locations.getLocationDistances();
        
        // Set the distances map as a request attribute
        request.setAttribute("distances", distances);

        // Forward the request to the booking.jsp page
        RequestDispatcher dispatcher = request.getRequestDispatcher("/customer/booking.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the pickup, drop locations, vehicle, date, and time from the form submission
        String pickup = request.getParameter("pickup");
        String drop = request.getParameter("drop");
        String vehicleType = request.getParameter("vehicleType");  // Corrected vehicle parameter
        String date = request.getParameter("date");        // Corrected date parameter
        String time = request.getParameter("time"); 

        // Calculate the bill using the utility class
        double bill = CalculateBillUtil.calculateBill(pickup, drop);

        // Set the data as attributes to display them on the confirmation page
        request.setAttribute("pickup", pickup);
        request.setAttribute("drop", drop);
        request.setAttribute("vehicleType", vehicleType);
        request.setAttribute("date", date);
        request.setAttribute("time", time);
        request.setAttribute("bill", bill);

        // Forward the request to the confirmation page (confirmBooking.jsp)
        RequestDispatcher dispatcher = request.getRequestDispatcher("/customer/confirmBooking.jsp");

        dispatcher.forward(request, response);
    }
}
