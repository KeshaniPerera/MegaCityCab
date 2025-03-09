package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.VehicleDAO;
import model.Vehicle;

@WebServlet("/ManageVehicles")
public class ManageVehiclesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ManageVehiclesServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Check if vehicleID parameter is present (for deleting a vehicle)
        String vehicleID = request.getParameter("vehicleID");
        
        if (vehicleID != null && !vehicleID.isEmpty()) {
            // Call deleteVehicle if vehicleID is provided
            boolean isDeleted = VehicleDAO.getInstance().deleteVehicle(Integer.parseInt(vehicleID));

            // Redirect based on success or failure
            if (isDeleted) {
                response.sendRedirect("admin/manageVehicles.jsp?deleteSuccess=true");
            } else {
                response.sendRedirect("admin/manageVehicles.jsp?deleteError=true");
            }
        } else {
            // Get vehicle details from the request for adding a new vehicle
            String vehicleName = request.getParameter("vehicleName");
            String model = request.getParameter("model");
            String brand = request.getParameter("brand");
            String year = request.getParameter("year");
            String registrationNumber = request.getParameter("registrationNumber");
            int seatingCapacity = Integer.parseInt(request.getParameter("seatingCapacity"));
            String fuelType = request.getParameter("fuelType");
            double ratePerDay = Double.parseDouble(request.getParameter("ratePerDay"));

            // Create a Vehicle object using setters
            Vehicle vehicle = new Vehicle();
            vehicle.setVehicleName(vehicleName);
            vehicle.setModel(model);
            vehicle.setBrand(brand);
            vehicle.setYear(year);
            vehicle.setRegistrationNumber(registrationNumber);
            vehicle.setSeatingCapacity(seatingCapacity);
            vehicle.setFuelType(fuelType);
            vehicle.setRatePerDay(ratePerDay);

            // Insert the vehicle into the database
            boolean isAdded = VehicleDAO.getInstance().addVehicle(vehicle);

            // Redirect based on success or failure
            if (isAdded) {
                response.sendRedirect("admin/manageVehicles.jsp?success=true");
            } else {
                response.sendRedirect("admin/manageVehicles.jsp?error=true");
            }
        }
    }
}
