package servlets;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import model.Locations;
import model.Vehicle;
import javax.servlet.annotation.WebServlet;
import util.CalculateBillUtil;
import java.util.Map;
import java.util.Set;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import dao.VehicleDAO;

@WebServlet("/booking")
public class BookingServlet extends HttpServlet {

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // Get the location distances
    Map<String, Map<String, Double>> distances = Locations.getLocationDistances();
    request.setAttribute("distances", distances);
    
    // Get all vehicles from the DAO
    List<Vehicle> vehicles = VehicleDAO.getInstance().getAllVehicles();
    
    // Filter unique vehicle names using a LinkedHashSet to preserve order
    Set<String> uniqueVehicleNamesSet = new LinkedHashSet<>();
    for (Vehicle vehicle : vehicles) {
        uniqueVehicleNamesSet.add(vehicle.getVehicleName());
    }
    
    // Convert the set to a list (if needed)
    List<String> uniqueVehicleNames = new ArrayList<>(uniqueVehicleNamesSet);
    
    // Set the unique vehicle names as a request attribute
    request.setAttribute("uniqueVehicleNames", uniqueVehicleNames);

    // Forward the request to the booking.jsp page
    RequestDispatcher dispatcher = request.getRequestDispatcher("/customer/booking.jsp");
    dispatcher.forward(request, response);
}

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the pickup, drop locations, vehicle, date, and time from the form submission
        String pickup = request.getParameter("pickup");
        String drop = request.getParameter("drop");
        String vehicleType = request.getParameter("vehicleType");  
        String date = request.getParameter("date");               
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
