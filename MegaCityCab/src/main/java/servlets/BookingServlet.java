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
    Map<String, Map<String, Double>> distances = Locations.getLocationDistances();
    request.setAttribute("distances", distances);
    
    List<Vehicle> vehicles = VehicleDAO.getInstance().getAllVehicles();
    
    // filter unique vehicle names using a LinkedHashSet 
    Set<String> uniqueVehicleNamesSet = new LinkedHashSet<>();
    for (Vehicle vehicle : vehicles) {
        uniqueVehicleNamesSet.add(vehicle.getVehicleName());
    }
    
    List<String> uniqueVehicleNames = new ArrayList<>(uniqueVehicleNamesSet);
    
    request.setAttribute("uniqueVehicleNames", uniqueVehicleNames);

    // Forward the request to the booking.jsp page
    RequestDispatcher dispatcher = request.getRequestDispatcher("/customer/booking.jsp");
    dispatcher.forward(request, response);
}

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String pickup = request.getParameter("pickup");
        String drop = request.getParameter("drop");
        String vehicleType = request.getParameter("vehicleType");  
        String date = request.getParameter("date");               
        String time = request.getParameter("time"); 

        // Calculate the bill using the utility class
        double bill = CalculateBillUtil.calculateBill(pickup, drop);

        request.setAttribute("pickup", pickup);
        request.setAttribute("drop", drop);
        request.setAttribute("vehicleType", vehicleType);
        request.setAttribute("date", date);
        request.setAttribute("time", time);
        request.setAttribute("bill", bill);


        RequestDispatcher dispatcher = request.getRequestDispatcher("/customer/confirmBooking.jsp");
        dispatcher.forward(request, response);
    }
}
