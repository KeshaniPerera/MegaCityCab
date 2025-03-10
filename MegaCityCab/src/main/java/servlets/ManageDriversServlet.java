package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.DriverDAO;
import model.Driver;

@WebServlet("/ManageDrivers")
public class ManageDriversServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ManageDriversServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Check if driverID parameter is present (for deleting a driver)
        String driverID = request.getParameter("driverID");
        
        if (driverID != null && !driverID.isEmpty()) {
            // Call deleteDriver if driverID is provided
            boolean isDeleted = DriverDAO.getInstance().deleteDriver(Integer.parseInt(driverID));

            // Redirect based on success or failure
            if (isDeleted) {
                response.sendRedirect("admin/manageDrivers.jsp?deleteSuccess=true");
            } else {
                response.sendRedirect("admin/manageDrivers.jsp?deleteError=true");
            }
        } else {
            // Get driver details from the request for adding a new driver
            String driverName = request.getParameter("driverName");
            String driverNIC = request.getParameter("driverNIC");
            String phoneNumber = request.getParameter("phoneNumber");
            String address = request.getParameter("address");

            // Create a Driver object using setters
            Driver driver = new Driver();
            driver.setDriverName(driverName);
            driver.setDriverNIC(driverNIC);
            driver.setPhoneNumber(phoneNumber);
            driver.setAddress(address);

            // Insert the driver into the database
            boolean isAdded = DriverDAO.getInstance().addDriver(driver);

            // Redirect based on success or failure
            if (isAdded) {
                response.sendRedirect("admin/manageDrivers.jsp?success=true");
            } else {
                response.sendRedirect("admin/manageDrivers.jsp?error=true");
            }
        }
    }
}